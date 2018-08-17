class User < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    acts_as_taggable_on :tags

    def self.recent(number)
        User.limit(number)
    end


end
