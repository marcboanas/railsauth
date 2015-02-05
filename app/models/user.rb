# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  password_hash      :string(255)
#  password_salt      :string(255)
#  email_verification :boolean          default(FALSE)
#  verification_code  :string(255)
#  api_authtoken      :string(255)
#  authtoken_expiry   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  provider           :string(255)
#  uid                :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password  
  validates_presence_of :email, :on => :create    
  validates :password, length: { in: 6..30 }, :on => :create 
  
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :email
  has_many :photos
    
  def encrypt_password
    if password.present?      
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(login_name, password)
    user = self.where("email =?", login_name).first
                   
    if user 
      puts "******************* #{password} 1"
      
      begin
        password = AESCrypt.decrypt(password, ENV["API_AUTH_PASSWORD"])      
      rescue Exception => e
        password = nil
        puts "error - #{e.message}"
      end
      
      puts "******************* #{password} 2"
              
      if user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    else
      nil
    end
  end   
    
  def to_json(options={})
    options[:except] ||= [:id, :password_hash, :password_salt, :email_verification, :verification_code, :created_at, :updated_at]
    super(options)
  end    
end
