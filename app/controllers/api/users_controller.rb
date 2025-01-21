module Api
  class UsersController < Api::RootController
    # GET /users
    def index
      @users = Users::List.run!
      render
    end


    # POST /users
    def create
      outcome = Users::Create.run(params.fetch(:user, {}))

      if outcome.valid?
        @user = outcome.result
        render :show
      else
        respond_with_error_messages(outcome.errors.messages)
      end
    end
  end
end
