class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, class_name: BlogPost, foreign_key: :author_id

  before_save :populate_username

  def populate_username
      username = self.email.split("@")[0]
      objects = User.where(username: username)
      if objects.count > 0
          username = "#{username}#{rand(111111..999999)}"
      end
      self.username = username
  end

  def available_name
      full_name = "#{self.first_name} #{self.last_name}"
      if full_name.strip.length > 0
          full_name
      else
          self.email.split("@")[0]
      end
  end


end
