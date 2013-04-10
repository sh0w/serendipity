require 'spec_helper'

describe User do
describe '#followers' do

it 'should initialize with 0 followers' do
user = User.new
user.followers.should == 0
end

end
end
