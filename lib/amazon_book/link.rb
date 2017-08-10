module AmazonBook
  class Link
    BOOK_PATHS = [
      %r{/dp/(\d{9}[\dX])},
      %r{/gp/offer-listing/(\d{9}[\dX])},
      %r{/gp/product/(\d{9}[\dX])},
      %r{/exec/obidos/ASIN/(\d{9}[\dX])},
      %r{/o/ASIN/(\d{9}[\dX])}
    ].freeze

    AMAZON_DOMAINS = [
      'amazon.ca',
      'amazon.cn',
      'amazon.co.jp',
      'amazon.co.uk',
      'amazon.com',
      'amazon.com.au',
      'amazon.com.br',
      'amazon.com.mx',
      'amazon.de',
      'amazon.es',
      'amazon.fr',
      'amazon.in',
      'amazon.it',
      'amazon.nl'
    ].freeze

    attr_reader :url

    def initialize(url)
      @url = url
    end

    def book?
      correct_domain? && isbn13
    end

    def isbn13
      BOOK_PATHS.flat_map do |path_regex|
        Identifiers::ISBN.extract(url[path_regex, 1])
      end.first
    end

    private

    def correct_domain?
      url =~ Regexp.union(AMAZON_DOMAINS)
    end
  end
end
