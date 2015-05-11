require 'rails_helper'

RSpec.describe Reservation, type: :model do
    before :each do
      @reservation = Reservation.new user_id: 1, start_time: "12345", end_time: "123456", gcal_eventId: "eventId"
    end

    it "takes four parameters are returns a Reservation object" do
        @reservation.should be_an_instance_of Reservation
    end

    describe "#user_id" do
        it "returns the correct user_id" do
            @reservation.user_id.should eql 1
        end
    end

    describe "#start_time" do
        it "returns the correct start_time" do
            @reservation.start_time.should eql "12345"
        end
    end

    describe "#end_time" do
        it "returns the correct end_time" do
            @reservation.end_time.should eql "123456"
        end
    end

    describe "#gcal_eventId" do
        it "returns the correct gcal_eventId" do
            @reservation.gcal_eventId.should eql "eventId"
        end
    end
end
