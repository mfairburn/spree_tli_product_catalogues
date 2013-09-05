module Spree
  module Admin
    module CataloguesHelper
      def options_text_for(catalogue)
        if catalogue.viewable.is_a?(Spree::Variant)
          if catalogue.viewable.is_master?
            Spree.t(:all)
          else
            catalogue.viewable.options_text
          end
        else
          Spree.t(:all)
        end
      end
    end
  end
end

