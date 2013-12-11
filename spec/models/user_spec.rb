# require 'spec_helper'

# describe User do
#   it "is valid with a name and email address" do
#     user = User.new(name: 'Jennie', email: 'foo@foo.com')
#     expect(user).to be_valid
#   end
#   it "is invalid without a name" do
#     expect(User.new(name: nil)).to have(1).errors_on(:name)
#   end

#   it "is invalid without an email address" do
#     expect(User.new(email:nil)).to have(1).errors_on(:email)
#   end

#   it "is invalid with a duplicated email address" do
#     User.create(name: "Jennie", email: "foo@foo.com")
#     user = User.new(name: 'Mike', email: "foo@foo.com")
#     expect(user).to have(1).errors_on(:email)
#   end

# end
