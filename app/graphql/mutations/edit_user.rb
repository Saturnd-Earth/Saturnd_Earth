module Mutations
  class EditUser < BaseMutation
    argument :id, ID, required: true
    argument :username, String, required: true
    argument :password, String, required: true
    
    field :user, Types::UserType, null: false
    field :errors, [String], null: false
    
    def resolve(id:, username:, password:)
      user = User.find(id)
      user.update(username: username, password: password)
      if user.save
          {
              user: user,
              errors: []
          }
      else
          GraphQL::ExecutionError.new("Invalid Username or Password")
      end
    end
  end
end