class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: 'missing.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  validates :user_name,
            presence: true,
            uniqueness: {
              case_sensitive: false
            } # etc.

  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.user_name = auth.info.name
      user.image = auth.info.image.gsub('http://', 'https://') # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def has_liked?(post)
    liked_posts.include? post
  end

  def created_post?(post)
    posts.include? post
  end

  def created_comment?(comment)
    comments.include? comment
  end

end
