module ActionView
  module Helpers
    module LabeledFormTagHelper
      def labeled_field(name,&block)
        content_tag(:p, concat(name,yield) ,:class=>"show"))
      end§
    end
  end
end