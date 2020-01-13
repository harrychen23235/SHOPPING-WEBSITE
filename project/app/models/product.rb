class Product < ApplicationRecord
	has_many :comments ,:dependent => :destroy	
    has_many :order_items	,:dependent => :destroy						 
    default_scope { where(active: true) }
    validates :name,  presence: true
    validates :name,  presence: true, length: { maximum: 30 }
	has_attached_file :image,  :whiny => false,
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

validates_attachment_presence :image
validates_attachment_size :image, :less_than => 5.megabytes
validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  end
