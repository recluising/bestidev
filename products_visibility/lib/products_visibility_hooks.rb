class ProductsVisibilityHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_product_form_right, "shared/ext_visibility_admin_product_fields.html"
end
