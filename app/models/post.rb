class Post < ActiveRecord::Base  
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :image, presence: true
  validates :caption, length: {in: 3..300, too_long: 'Your caption is too long', too_short: "Your caption is too short"}
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end  