require "html/pipeline"
require "html/pipeline/onebox/version"
require "html/pipeline/onebox/onebox_filter.rb"

module HTML
  class Pipeline
    autoload :OneboxFilter, 'html/pipeline/onebox/onebox_filter'
  end
end
