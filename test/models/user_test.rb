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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
