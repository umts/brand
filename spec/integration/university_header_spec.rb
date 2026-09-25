# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'umts/brand/_university_header.html.haml', type: :view do
  before { render(partial: 'umts/brand/university_header', locals:) }

  context 'without university trademark authorization' do
    let(:locals) do
      {
        university_trademarks: false,
        parent_department_name: 'Not relevant',
        parent_department_link: 'Not relevant',
        department_name: 'Not relevant',
        department_link: 'Not relevant'
      }
    end

    it 'renders nothing' do
      expect(rendered).to be_blank
    end
  end

  context 'with university trademark authorization' do
    let(:locals) do
      {
        university_trademarks: true,
        parent_department_name: 'Facilities & Campus Services',
        parent_department_link: 'https://umass.edu/facilities',
        department_name: 'Transportation Services',
        department_link: 'https://umass.edu/transportation'
      }
    end

    it 'renders with the given department information' do
      expect(rendered).to have_link('Facilities & Campus Services', href: 'https://umass.edu/facilities').and(
        have_link('Transportation Services', href: 'https://umass.edu/transportation')
      )
    end
  end
end
