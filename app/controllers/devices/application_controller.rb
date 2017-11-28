module Devices
  class ApplicationController < ::ApplicationController
    before_action :extract_signed_body

    private

    def extract_signed_body
      data = params[:signed_body].split(".", 2).last
      params.delete(:signed_body)

      parsed_data = JSON.parse(data)
      params.merge!(parsed_data)
    end
  end
end