module ApplicationHelper

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  # TODO make class nil if there are different colletion presenters
  def present_collection(collection, klass = CollectionPresenter)
    collection_name = collection.class.to_s.split('::')[0].pluralize
    klass ||= "#{collection_name}Presenter".constantize
    presenter = klass.new(collection, self)
    yield presenter if block_given?
    presenter
  end

  private
end
