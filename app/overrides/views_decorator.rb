Deface::Override.new(
  :virtual_path => "spree/admin/shared/_product_tabs",
  :name => "product_catalogue_admin_menu",
  :insert_bottom => "[data-hook='admin_product_tabs']",
  :partial => "spree/admin/shared/catalogues_menu",
  :disabled => false)

Deface::Override.new(
  :virtual_path  => "spree/products/show",
  :name          => "insert_catalogues_list",
  :insert_after  => "[data-hook='description']",
  :partial       => "spree/products/catalogues",
  :disabled => false)


