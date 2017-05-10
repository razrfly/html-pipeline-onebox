require "onebox"

module HTML
  class Pipeline
    # HTML Filter for Onebox.
    class OneboxFilter < TextFilter
      def call
        regex = /(?<=\A|\s)+(https?:\/\/|www\.)\S*/
        @text.gsub(regex) do |element|
          url = element.strip
          parsed_element = ::Onebox.preview(url).to_s.strip

          if parsed_element.present?
            element.gsub(url, parsed_element)
          else
            element
          end
        end
      end
    end
  end
end
