class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :token_authenticatable,
         :confirmable, :lockable, :timeoutable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :avatar
  # attr_accessible :title, :body

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
        user = User.create(name:auth.extra.raw_info.first_name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           avatar:open(auth.info.image),
                           password:Devise.friendly_token[0,20]
                         )
      end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"]
        user.email = data["email"] if user.email.blank?
        user.name = data["first_name"] if user.name.blank?
        user.avatar = open(data["info"]["image"]) if user.avatar.blank?
      end
    end
  end

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
