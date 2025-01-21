module Api
  class InterestsController < Api::RootController
    # GET /interests
    def index
      @interests = Interests::List.run!
      render
    end


    # POST /interests
    def create
      outcome = Interests::Create.run(name: params.dig(:interest, :name))

      if outcome.valid?
        @interest = outcome.result
        render :show
      else
        respond_with_error_messages(outcome.errors.messages)
      end
    end
  end
end
