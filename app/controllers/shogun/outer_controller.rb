module Shogun
  class OuterController < ActionController::Base
    def show
      d = Digest::SHA256.hexdigest "#{Shogun.site_id}-#{Shogun.secret_token}"
      return head :unauthorized unless params[:d] == d
      response.headers.except! 'X-Frame-Options'
      render layout: 'shogun_rails'
    end
  end
end
