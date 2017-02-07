class Present < ActiveRecord::Base

  belongs_to :user

  validates :user_type, :product_name, :who_from, :who_for, :when,  presence: true

  has_attached_file :image,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image,
                                      content_type: ["image/jpg","image/jpeg","image/png"]
end