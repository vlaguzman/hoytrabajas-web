#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'

RSpec.describe "Overall navigation" do
  context "an anonimous user visits the public pages" do
    scenario "all pages render properly" do
      visit root_path
      expect(page).to have_content("Ellos hoy confian en nosotros")
      expect(page).to have_link("Home", href: root_path)

      expect(page).to have_link("Preguntas frecuentes", href: faqs_path)
      click_on("Preguntas frecuentes")
      expect(page).to have_text("Faqs")
      click_on("Home")

      expect(page).to have_link("Registro del candidato", href: new_user_registration_path)
      expect(page).to have_link("Registro de la empresa", href: new_company_registration_path)
      expect(page).to have_link("Ofertas", href: offers_path)
      expect(page).to have_link("Categorias de empleo", href: job_categories_path)
      expect(page).to have_link("Empresas", href: companies_path)
    end
  end
end
=begin
Página registro	/app/registration

Dashboard candidato	[username]/dashboard

Dashboard empresa	/companies/[id]/dashboard

Resultado búsqueda por ciudad	/jobs-[city]
	/empleo-[ciudad]
Resultado búsqueda por modalidad	/empleo-[modalidad]
	/jobs-[work-mode]
Resultado búsqueda por tipo	/empleo-[tipo]
	/jobs-[offer-type]
=end