json.array!(@rides) do |ride|
  json.extract! ride, :id, :bike_id, :route_id, :ride_date, :distance, :speed
  json.url ride_url(ride, format: :json)
end
