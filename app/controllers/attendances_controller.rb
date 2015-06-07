class AttendancesController < ApplicationController
  def new
   addresses_json = {
      schoolAddress: User.find_by(id: session[:user_id]).school.address,
      eventAddress: Event.find_by_id(params[:event_id]).address
    }

    File.open("public/addresses.json","w") do |f|
      f.write(addresses_json.to_json)
    end
  end
end