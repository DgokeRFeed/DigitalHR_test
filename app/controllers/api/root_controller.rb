module Api
  class RootController < ActionController::API
    def respond_with_error_messages(error_messages)
      render json: {
        status: :error,
        error_code: :validation,
        validation_errors: error_messages,
      }, status: 422
    end
  end
end
