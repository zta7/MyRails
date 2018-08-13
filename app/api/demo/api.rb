module Demo
    class API < Grape::API
    # 版本信息, (:path(default),:header,:accept_version_header,:param)        
      version 'v1', using: :header, vendor: 'twitter'
      format :json
      prefix :api
    # 早上起来试一试
    # GET POST PUT 的参数 , params[:param]
    # 图片 params[:image_file]
    # Params Class && Declared 请求参数过滤-，-
    # { 'declared_params' => declared(params, include_missing: false) }
      # helpers do
      #   def current_user
      #     User.find(params[:id])
      #   end
      # end
      # helpers HttpCodesHelpers

      # before do
      #   error!('Access Denied', unauthorized) unless current_user
      # end 
      # helpers do
      #   def current_user
      #     params[:token]
      #   end
      #   def authenticate!
      #     error!('401 Unauthorized') unless false
      #   end
      # end
      # before do
      #   p current_user
      #   authenticate!
      # end

      get '/demo' do
        # DemoJob.perform_later
        "".blank?
      end

      hmac_secret = 'my$ecretK3y'
      
      post '/auth/' do
        @user = User.where(
          :email     => params[:email],
          :password  => params[:password]
        ).take!
        payload = {
          :email => params[:email],
          :photo => @user.photo
        }
        token = JWT.encode payload, hmac_secret, 'HS256'
        $redis.set(params[:email], token)
      end


      resource :user do 
        post :create do
          @user = User.new({
            :email     => params[:email],
            :photo     => params[:file],
          })
          @user.tag_list.add(params[:tags],:parse => true)

          if @user.save
            UserMailer.welcome_email(@user).deliver_later
            'success send email'
          else  
          end
        end 
      end





      resource :statuses do
        desc 'Return a public timeline.'
        get :public_timeline do
            'haha'
        #   Status.limit(20)
        end
  
        desc 'Return a personal timeline.'
        get :home_timeline do
          authenticate!
          current_user.statuses.limit(20)
        end
  
        desc 'Return a status.'
        params do
          requires :id, type: Integer, desc: 'Status id.'
        end
        route_param :id do
          get do
            Status.find(params[:id])
          end
        end
  
        desc 'Create a status.'
        params do
          requires :status, type: String, desc: 'Your status.'
        end
        post do
          authenticate!
          Status.create!({
            user: current_user,
            text: params[:status]
          })
        end
  
        desc 'Update a status.'
        params do
          requires :id, type: String, desc: 'Status ID.'
          requires :status, type: String, desc: 'Your status.'
        end
        put ':id' do
          authenticate!
          current_user.statuses.find(params[:id]).update({
            user: current_user,
            text: params[:status]
          })
        end
  
        desc 'Delete a status.'
        params do
          requires :id, type: String, desc: 'Status ID.'
        end
        delete ':id' do
          authenticate!
          current_user.statuses.find(params[:id]).destroy
        end
      end
    end
  end

