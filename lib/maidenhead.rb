class Maidenhead
  def self.to_latlon(location)

    length = location.length / 2
    while (length < 5)
      if (length % 2) == 1
        location += '55'
      else
        location += 'LL'
      end
      length = location.length / 2
    end

    lat = 0
    lon = 0

    lat_multiplier = 10.0
    lon_multiplier = 20.0

    5.times do |counter|
      grid_lon = location[counter * 2, 1]
      grid_lat = location[counter * 2 + 1, 1]

      if counter == 0
        lat += l2n(grid_lat) * lat_multiplier
        lon += l2n(grid_lon) * lon_multiplier
      elsif (counter % 2) == 0
        lat_multiplier /= 24
        lon_multiplier /= 24
        lat += l2n(grid_lat) * lat_multiplier
        lon += l2n(grid_lon) * lon_multiplier
      else
        lat_multiplier /= 10
        lon_multiplier /= 10
        lat += grid_lat.to_i * lat_multiplier
        lon += grid_lon.to_i * lon_multiplier
      end
    end

    [ (lat - 90).round(6), (lon - 180).round(6) ]
  end

  def self.to_maidenhead(lat, lon, precision = 5)
    locator = ''

    lat = lat.to_f + 90
    lon = lon.to_f + 180

    # Calculate the field
    lat = (lat / 10) + 0.0000001
    lon = (lon / 20) + 0.0000001
    locator += n2l(lon.floor).upcase + n2l(lat.floor).upcase
    precision -= 1

    # Calculate the remaining values
    precision.times do |counter|
      if (counter % 2) == 0
        lat = (lat - lat.floor) * 10
        lon = (lon - lon.floor) * 10
        locator += "#{lon.floor}#{lat.floor}"
      else
        lat = (lat - lat.floor) * 24
        lon = (lon - lon.floor) * 24
        locator += n2l(lon.floor) + n2l(lat.floor)
      end
    end

    locator
  end

  private

  def self.l2n(letter)
    letter.downcase.ord - 97
  end

  def self.n2l(number)
    (number + 97).chr
  end
end
