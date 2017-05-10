require "onebox"

module HTML
  class Pipeline
    # HTML Filter for Onebox.
    class OneboxFilter < TextFilter
      def call
        regex = /(?<=\A|\s)+(https?:\/\/|www\.)\S*/
        @text.gsub(regex) do |element|
          if onebox_preview = ::Onebox.preview(element).to_s.strip.presence
            onebox_preview
          else
            element
          end
        end
      end
    end
  end
end
