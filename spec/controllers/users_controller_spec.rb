require 'spec_helper'

#require_relative '../spec_helper'

  describe UsersController do

      it 'has username' do
      #wish code that words

      user = User.create({name: 'Lichard', email: 'lichard@lichard.com', password: 'password'})
      actual_name = user.name
      
      expectation_name = 'Lichard'
      #set expectation
      expect(actual_name).to eq(expectation_name)
    end

  end


