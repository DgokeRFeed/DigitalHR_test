module Api
  class SkillsController < Api::RootController
    # GET /skills
    def index
      @skills = Skills::List.run!
      render
    end


    # POST /skills
    def create
      outcome = Skills::Create.run(name: params.dig(:skill, :name))

      if outcome.valid?
        @skill = outcome.result
        render :show
      else
        respond_with_error_messages(outcome.errors.messages)
      end
    end
  end
end
