module RspecApiDocumentation
  class RackTestClient < ClientBase
    def response_body
      if last_response.headers["Content-Type"].include?("json")
        last_response.body.encode("utf-8")
      else
        "[binary data]"
      end
    end
  end
end