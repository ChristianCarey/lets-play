class EventPresenter < BasePresenter

  def join_or_full
    event.full? ? full_label : join_button
  end

  def remaining_seats
    event.max_players - event.players.size
  end

  def datetime
    if event.datetime <= Time.now
      "#{distance_of_time_in_words(Time.now, event.datetime)} ago"
    else
      "#{distance_of_time_in_words(Time.now, event.datetime)} from now"
    end
  end

  private

  def full_label
    content_tag :span, class: "label label-danger" do 
      "Full"
    end
  end

  def join_button
    content_tag :span, class: "label label-success" do 
        "Join"
    end
  end

  def event
    @object
  end
end