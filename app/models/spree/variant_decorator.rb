Spree::Variant.class_eval do

  has_many :catalogues, as: :viewable, order: :position, dependent: :destroy, class_name: "Spree::Catalogue"

end
