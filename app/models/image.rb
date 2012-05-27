class Image < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo,
                    :styles => {
                      :thumb    => ["100x100", :jpg],
                      :pagesize => ["500x400", :jpg]
                    },
                    :default_style => :pagesize
                    
  attr_accessible :photo
  
  validates_attachment :photo, :presence     => true,
                               :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png'] },
                               :size         => { :in => 0..5.megabytes }
                               
  validates_uniqueness_of :photo_file_name, :scope => :user_id
end
