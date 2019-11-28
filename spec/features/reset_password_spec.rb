require 'rails_helper'

RSpec.describe "view reset password for user or company", type: :feature do
  feature "I want to see the page where I can recover my password" do
    context 'I am a registered user, I want to recover my password' do
       scenario "go home and click '¿Olvidó su contraseña?'", js: true do
         visit root_path

         expect(page).to have_text("SIGN IN CANDIDATO")
         click_on 'SIGN IN CANDIDATO'

         expect(page).to have_text("¿Olvidó su contraseña?")
         click_on '¿Olvidó su contraseña?'

         expect(current_path).to eq(new_user_password_path)
         expect(page).to have_text("¿Olvidaste tu contraseña?")

       end
    end
  end
  feature "I want to see the page where I can recover my password" do
    context 'I am a registered company, I want to recover my password' do
       scenario "go home and click '¿Olvidó su contraseña?'", js: true do
         visit root_path

         expect(page).to have_text("SIGN IN EMPRESA")
         click_on 'SIGN IN EMPRESA'

         expect(page).to have_text("¿Olvidó su contraseña?")
         click_on '¿Olvidó su contraseña?'

         expect(current_path).to eq(new_company_password_path)
         expect(page).to have_text("¿Olvidaste tu contraseña?")

       end
    end
  end
end