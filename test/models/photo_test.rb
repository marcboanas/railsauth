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

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
