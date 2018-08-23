class User < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    acts_as_taggable_on :tags
    # 验证
    validates :name, presence: true, exclusion: { in: %w(zta) }
    validates :sex , acceptance: {accept: ['男','女'], message:'必须是"男"或"女"'}
    
    validates :email, confirmation: true
    # validates :email_confirmation


    def self.recent(number)
        User.limit(number)
    end
end
