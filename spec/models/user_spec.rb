#    Copyright 2010 Diaspora Inc.
#
#    This file is part of Diaspora.
#
#    Diaspora is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Diaspora is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with Diaspora.  If not, see <http://www.gnu.org/licenses/>.
#



require File.dirname(__FILE__) + '/../spec_helper'

describe User do
   before do
      @user = Factory.create(:user)
      @aspect = @user.aspect(:name => 'heroes')
   end
  
  it 'should create with pivotal or allowed emails' do
    user1 = Factory.create(:user, :email => "kimfuh@yahoo.com")
    user2 = Factory.create(:user, :email => "awesome@sofaer.net")
    user3 = Factory.create(:user, :email => "steveellis@pivotallabs.com")
    user1.created_at.nil?.should be false
    user2.created_at.nil?.should be false
    user3.created_at.nil?.should be false
  end

  describe 'profiles' do
    it 'should be able to update their profile and send it to their friends' do 
      Factory.create(:person)
      
      updated_profile = {:profile => {:first_name => 'bob', :last_name => 'billytown', :image_url => "http://clown.com"}}
      
      @user.update_profile(updated_profile).should == true
      @user.profile.image_url.should == "http://clown.com"
    end
  end
end
