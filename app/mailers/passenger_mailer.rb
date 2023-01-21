class PassengerMailer < ApplicationMailer
  def booking_email
    @booking = params[:booking]

    @booking.passengers.each do |passenger|
      mail(to: passenger.email, subject: 'Your Flight Has Been Booked!')
    end
  end
end
