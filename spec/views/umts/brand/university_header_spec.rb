# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'umts/brand/_university_header.html.haml' do
  subject(:call) do
    render partial: 'umts/brand/university_header',
           locals: { parent_department_name: 'Facilities & Campus Services',
                     parent_department_link: 'https://umass.edu/facilities',
                     department_name: 'Transportation Services',
                     department_link: 'https://umass.edu/transportation' }
  end

  context 'without university trademark authorization' do
    before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: false) }

    it 'raises an error' do
      expect { call }.to raise_error(String)
    end
  end

  context 'with university trademark authorization' do
    before { allow(UMTS::Brand).to receive_messages(using_university_trademarks: true) }

    it 'renders with the given department information' do
      call
      expect(rendered).to have_link('Facilities & Campus Services', href: 'https://umass.edu/facilities').and(
        have_link('Transportation Services', href: 'https://umass.edu/transportation')
      )
    end
  end
end
