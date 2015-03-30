require 'rails_helper'
require 'spec_helper'

describe "Static pages" do

  subject { page }

  it "should have the right links on the layout" do

    visit root_path
    click_link "About"
    page.should have_selector 'h1', text: 'About'
    click_link "Ayuda"
    page.should have_selector 'h1', text: 'Ayuda'
    click_link "Contacto"
    page.should have_selector 'h1', text: 'Contacto'
    click_link "Enma"
    page.should have_selector 'h1', text: 'Enma'

  end

  describe "Home page" do

    before { visit root_path }
    it { should have_selector('h1', text: 'Enma') }
    it { should_not have_selector 'title', text: '| Enma' }

  end

  describe "Help page" do

    before { visit help_path }
    it { should have_selector('h1',  text: 'Ayuda') }

  end

  describe "About page" do

    before { visit about_path }
    it { should have_selector('h1', text: 'About') }

  end

  describe "Contact page" do

    before { visit contact_path }
    it { should have_selector('h1', text: 'Contacto') }

  end

end
