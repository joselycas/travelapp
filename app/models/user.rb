class User < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password

  def self.create_with_omniauth(auth)

  user = find_or_create_by(uid: auth[‘uid’], provider:  auth[‘provider’])
  user.email = “#{auth[‘uid’]}@#{auth[‘provider’]}.com”
  user.password = auth[‘uid’]
  user.name = auth[‘info’][‘name’]
  if User.exists?(user)
    user
  else
    user.save!
    user
  end
end
#   def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
#     user = User.where(provider: auth.provider, uid: auth.uid).first
#     if user.present?
#         user
#     else
#         user = User.create(first_name:auth.extra.raw_info.first_name,
#                                              last_name:auth.extra.raw_info.last_name,
#                                              facebook_link:auth.extra.raw_info.link,
#                                              user_name:auth.extra.raw_info.name,
#                                              provider:auth.provider,
#                                              uid:auth.uid,
#                                              email:auth.info.email,
#                                              password:Devise.friendly_token[0,20])
#     end
# end

end
