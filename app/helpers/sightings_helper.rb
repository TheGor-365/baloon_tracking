module SightingsHelper
  def geo_json(sighting)
    coordinates = [ sighting.coordinates.map { |c| [c.long, c.lat] } ]
    coordinates[0] << coordinates[0][0]
    {
      geometry: {
        type: 'Polygon',
        coordinates: coordinates
      },
      tooltip: sighting.ufo.status,
      label: sighting.ufo.name,
      color: '#00ff00'
    }
  end
end
