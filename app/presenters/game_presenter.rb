class GamePresenter < BasePresenter
  def request_button
    content_tag :div do 
      link_to "Request to play", '#', class: 'request-button btn btn-default pull-right'
    end
  end

  private

  def game
    @object
  end
end
