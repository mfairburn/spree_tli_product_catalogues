Spree::Product.class_eval do

    delegate :catalogues, to: :master, prefix: true
    alias_method :catalogues, :master_catalogues

    has_many :variant_catalogues, source: :catalogues, through: :variants_including_master, order: :position

end
