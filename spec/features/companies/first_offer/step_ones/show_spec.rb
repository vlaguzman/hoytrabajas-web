require 'rails_helper'

RSpec.describe "When company fill the step one form", :type => :feature do
  let(:company) { create(:company, :first_time, name: 'HoyTrabajas.com') }

  let(:company_two) { create(:company, :first_time) }

  let!(:industry) { create(:industry) }

  def expected_page_structure
    expect(page).to have_content("Empecemos por conocernos")
    expect(page).to have_content("Brinda a tu candidato información de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'company[name]',                  type: "text" })
      with_tag(:input, with: { name: 'company[industry_id]',           type: "hidden" })
      with_tag(:input, with: { name: 'company[contact_name]',          type: "text" })
      with_tag(:input, with: { name: 'company[contact_work_position]', type: "text" })
      with_tag(:input, with: { name: 'company[contact_cellphone]',     type: "text" })
      with_tag(:input, with: { name: 'company[employees_range_id]',    type: "hidden" })
    end

    expect(page).to have_button('Siguiente')
  end

  def fill_form(data)
    fill_in 'company[name]', :with => data[:name]

    find(id: 'mui-component-select-company[industry_id]', visible: false).click
    find('li', text: industry.description).click

    fill_in 'company[contact_name]', :with => data[:contact_name]
    fill_in 'company[contact_work_position]', :with => data[:contact_work_position]
    fill_in 'company[contact_cellphone]', :with => data[:contact_cellphone]

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"

    find(id: 'mui-component-select-company[employees_range_id]', visible: false).click
    find('li', text: '1-10').click
  end

  describe "Fill the principal company user data" do
    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_one_path

        expected_page_structure
        fill_form(
          {
            name:                  '',
            contact_name:          'Ruben Cordoba',
            contact_work_position: 'CEO',
            contact_cellphone:     '3101234567'
          }
        )
        click_link_or_button('Siguiente')

        company.reload

        expect(company.name).to eq('HoyTrabajas.com')
        expect(company.contact_name).to eq('Ruben Cordoba')
        expect(company.contact_work_position).to eq('CEO')

        expect(company.industry_id).not_to be_nil
        expect(company.employees_range_id).not_to eq('')

        expect(current_path).to eq(companies_first_offer_step_two_path)
      end
    end
  end

  describe "Mandatory fields have not been filled" do
    context "Required fields are empty" do
      scenario "should retorn translate error", js: true do

      sign_in company_two

      visit companies_first_offer_step_one_path

      click_link_or_button('Siguiente')

      expect(current_path).to eq(companies_first_offer_step_one_path)

      expect(page).to have_content("Por favor ingresa el nombre de la empresa, este campo no puede estar en blanco")
      expect(page).to have_content("Por favor ingresa un número de contacto, este campo no puede estar en blanco")
      expect(page).to have_content("Por favor seleccione el sector al que pertenece la empresa, este campo no puede estar en blanco")

      end
    end
  end

  describe "User want to exit the form" do
    context "The navbar is visible" do
      scenario "should click the home button and go to root path", js: true do
        sign_in company
        visit companies_first_offer_step_one_path
    
        click_link_or_button('Inicio')
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe "User want to see the progress of completion" do
    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in company
      visit companies_first_offer_step_one_path

      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 7 * 1))
    end
  end
end
