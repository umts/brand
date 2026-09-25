# frozen_string_literal: true

module UMTS
  module Brand
    module FaviconHelper
      def umts_brand_university_favicons
        Brand.protect_university_trademarks!
        safe_join([
                    favicon_link_tag('umts/brand/university-collegiate-m.png', rel: 'icon', type: 'image/png'),
                    favicon_link_tag('umts/brand/university-collegiate-m.svg', rel: 'icon', type: 'image/svg+xml'),
                    favicon_link_tag('umts/brand/university-collegiate-m.png', rel: 'apple-touch-icon', type: nil)
                  ])
      end
    end
  end
end
