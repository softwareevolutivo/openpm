class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_apps]

  def self.find_for_googleapps_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']

    if user = User.where(:email => data['email']).first
      return user
    else #create a user with stub pwd
      User.create!(:email => data['email'], :password => Devise.friendly_token[0, 20])
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.googleapps_data'] && session['devise.googleapps_data']['user_info']
        user.email = data['email']
      end
    end
  end
end
