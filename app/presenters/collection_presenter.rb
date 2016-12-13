class CollectionPresenter < BasePresenter

  def in_rows_of(num_columns, options = {})
    # TODO handle incorrect input
    # TODO console says rendering but no outpu in the window
    breakpoint  = options[:breakpoint] || "md"
    partial     = options[:partial]
    column_size = 12 / num_columns
    collection.each_slice(num_columns) do |slice|
      content_tag :div, class: 'row' do 
        slice.each do |element|
          content_tag :div, class: "col-#{breakpoint}-#{column_size}" do 
            render partial: partial || element
          end
        end
      end
    end
  end

  private

  def collection
    @object
  end
end