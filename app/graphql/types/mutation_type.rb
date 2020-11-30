module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :login, String, null: true, description: 'User Login' do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email: String, password: String)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "Currently logged user"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false

    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end
  end
end
