module Mutations
  class EditUser < BaseMutation
    argument :id, ID, required: true
    argument :username, String, required: true
    argument :password, String, required: false
    
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    
    def resolve(id:, username:)
      binding.pry
      user = User.new(username: username, password: password)
      if user.save
          {
              user: user,
              errors: []
          }
      else
          {
              user: nil,
              errors: user.errors.full_messages
          }
      end
    end
  end
end