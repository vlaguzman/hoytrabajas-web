#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'

RSpec.describe "Overall navigation" do
  context "an anonimous user visits the public pages" do
    before { create(:offer) }

    context "all pages render properly", type: :feature do
      it "should visit inicio from root_path", js:true do

        visit root_path

        find("button[id='navbar-toggler']", visible: false).click
        expect(page).to have_content("INICIO")
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit ‘FAQ’ page from home page", js: true do
        visit root_path

        expect(page).to have_link("FAQs", href: faqs_path)

        click_on("FAQs")

        expect(page).to have_text("Faqs")

        find("button[id='navbar-toggler']", visible: false).click        
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit Candidato page from home page", js: true do
        visit root_path

        find("button[id='navbar-toggler']", visible: false).click
        expect(page).to have_link("SIGN UP CANDIDATO", href: "/users/sign_up")

        click_on("SIGN UP CANDIDATO")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'Empleador' page from home page", js: true do
        visit root_path

        find("button[id='navbar-toggler']", visible: false).click
        expect(page).to have_link("SIGN UP EMPRESA", href: "/companies/sign_up")

        click_on("SIGN UP EMPRESA")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'ver mas ofertas' page from home page", js: true do
        FactoryBot.create(:offer, title: "Titulo De Oferta")
        FactoryBot.create(:offer, title: "Titulo De Oferta2")
        FactoryBot.create(:offer, title: "Titulo De Oferta3")
        FactoryBot.create(:offer, title: "Titulo De Oferta4")
        FactoryBot.create(:offer, title: "Titulo De Oferta5")
        FactoryBot.create(:offer, title: "Titulo De Oferta6")
        FactoryBot.create(:offer, title: "Titulo De Oferta7")
        FactoryBot.create(:offer, title: "Titulo De Oferta8")

        visit root_path

        has_button?("VER MÁS OFERTAS »")
        click_on("Ver más ofertas »")

        has_button?("VER MÁS OFERTAS »")
        click_on("Ver más ofertas »")

        expect(page).to have_text("Titulo De Oferta8")

        has_button?("VER EL LISTADO DE OFERTAS »")
        click_on("Ver el listado de ofertas »")

        expect(current_path).to eq(offers_path)
        expect(page).to have_text("VER MÁS OFERTAS")

        find("button[id='navbar-toggler']", visible: false).click
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'categorias de empĺeo' page from home page", js: true do
        visit root_path

        expect(page).to have_link("Categorias de empleo", href: job_categories_path)

        click_on("Categorias de empleo")

        expect(page).to have_text("Categorias de empleo")

        find("button[id='navbar-toggler']", visible: false).click
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'empresas' page from home page", js: true do
        visit root_path

        expect(page).to have_link("Empresas", href: companies_path)

        click_on("Empresas")

        expect(page).to have_text(/Ellos hoy confian en nosotros/)
        expect(page).to have_text(/para encontrar su empleado ideal/)

        find("button[id='navbar-toggler']", visible: false).click
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end
    end
  end
end
