require 'rails_helper'

RSpec.describe 'Searching for a flight', type: :feature do
  let!(:toronto) { FactoryBot.create(:airport, code: 'YYZ', city: 'Toronto') }
  let!(:london) { FactoryBot.create(:airport, code: 'LGW', city: 'London') }
  tomorrows_time = Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 1, period: :all)
  todays_time = Faker::Time.between_dates(from: Date.today, to: Date.today, period: :all)
  let!(:flight1) {
                  FactoryBot.create(:flight, departure_airport: toronto,
                                    arrival_airport: london,
                                    departure_time: tomorrows_time,
                                    departure_date: Date.today + 1
                                   )
                 }
  let!(:flight2) {
                  FactoryBot.create(:flight, departure_airport: toronto,
                                    arrival_airport: london,
                                    departure_time: tomorrows_time,
                                    departure_date: Date.today + 1
                                   )
                 }
  let!(:flight3) {
                  FactoryBot.create(:flight, departure_airport: toronto,
                                    arrival_airport: london,
                                    departure_time: todays_time,
                                    departure_date: Date.today
                                   )
                 }

  context 'when 2 flights available' do
    before do
      visit root_path
      page.select 'Toronto', from: 'departure_airport_id'
      page.select 'London', from: 'arrival_airport_id'
      page.select '2', from: 'passengers'
      tomorrow = ((Date.today) + 1).strftime("%Y-%m-%d")
      page.select tomorrow, from: 'departure_date'
      click_on 'Search'
    end

    it 'finds 2 available flights' do
      expect(page).to have_content('2 flights available')
    end
  end

  context 'when 1 flight available' do
    before do
      visit root_path
      page.select 'Toronto', from: 'departure_airport_id'
      page.select 'London', from: 'arrival_airport_id'
      page.select '2', from: 'passengers'
      today = (Date.today).strftime("%Y-%m-%d")
      page.select today, from: 'departure_date'
      click_on 'Search'
    end

    it 'finds 1 available flight' do
      expect(page).to have_content('1 flight available')
    end
  end

  context 'when booking a flight' do
    before do
      visit root_path
      page.select 'Toronto', from: 'departure_airport_id'
      page.select 'London', from: 'arrival_airport_id'
      page.select '2', from: 'passengers'
      tomorrow = ((Date.today) + 1).strftime("%Y-%m-%d")
      page.select tomorrow, from: 'departure_date'
      click_on 'Search'
      choose("flight_id_#{flight1.id}")
      click_on 'Book'
    end

    it 'has 2 passenger creation forms' do
      expect(page).to have_content 'Passenger 2 Info'
    end

    it 'does not have more than 2 passenger creation forms' do
      expect(page).not_to have_content 'Passenger 3 Info'
    end

    it 'books the flight' do
      fill_in 'booking_passengers_attributes_0_name', with: Faker::Name.name
      fill_in 'booking_passengers_attributes_0_email', with: Faker::Internet.email
      fill_in 'booking_passengers_attributes_1_name', with: Faker::Name.name
      fill_in 'booking_passengers_attributes_1_email', with: Faker::Internet.email
      click_on 'Purchase Flight'
      expect(page).to have_content('Your flight has been booked!')
    end
  end
end
