class LegalHooks < Spree::ThemeSupport::HookListener
  #insert after, insert before, replace
  # custom hooks go here
	replace :footer_left, 'shared/legal_footer_left' 
	replace :footer_right, 'shared/legal_footer_right'
	insert_before :sidebar, 'shared/languages_header'
        replace :admin_product_form_right,'shared/admin_product_form_right_h'
	insert_before :homepage_products, 'shared/welcome'
end
