# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  image_url  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  random_id  :string(255)
#

class Photo < ActiveRecord::Base  
  belongs_to :user
  
  def to_json(options={})
    options[:except] ||= [:id, :user_id, :created_at, :updated_at]
    super(options)
  end  
end
