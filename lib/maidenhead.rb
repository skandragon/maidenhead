##
# Easily convert between latitude and longitude coordinates the the Maidenhead
# Locator System coordinates.
class Maidenhead
  #
  # Verify that the provided Maidenhead locator string is valid.
  #
  def self.valid_maidenhead?(location)
    return false unless location.is_a?String
    return false unless location.length >= 2
    return false unless (location.length % 2) == 0

    length = location.length / 2
    length.times do |counter|
      grid = location[counter * 2, 2]
      if (counter == 0)
        return false unless grid =~ /[a-rA-R]{2}/
      elsif (counter % 2) == 0
        return false unless grid =~ /[a-xA-X]{2}/
      else
        return false unless grid =~ /[0-9]{2}/
      end
    end

    true
  end

  #
  # Convert from a Maidenhead locator string to latitude and longitude.
  # Location may be between 1 and 5 grids in size (2 to 10 characters).
  # Longer values may work, but accuracy is not guaranteed as latitude
  # and longitude values returned are rounded ot 6 decimal places.
  #
  # For each grid, an arbitrary but repeatable latitude and longitude
  # is returned.
  def self.to_latlon(location)
    maidenhead = Maidenhead.new
    maidenhead.locator = location
    maidenhead.latlon
  end

  def pad_locator
    length = @locator.length / 2
    while (length < 5)
      if (length % 2) == 1
        @locator += '55'
      else
        @locator += 'LL'
      end
      length = @locator.length / 2
    end
  end

  def convert_part_to_latlon(counter, divisor)
    grid_lon = @locator[counter * 2, 1]
    grid_lat = @locator[counter * 2 + 1, 1]

    @lat += l2n(grid_lat) * 10.0 / divisor
    @lon += l2n(grid_lon) * 20.0 / divisor
  end

  def locator=(location)
    unless Maidenhead.valid_maidenhead?(location)
      raise ArgumentError.new("Location is not a valid Maidenhead Locator System string")
    end

    @locator = location
    @lat = -90.0
    @lon = -180.0

    pad_locator

    convert_part_to_latlon(0, 1)
    convert_part_to_latlon(1, 10)
    convert_part_to_latlon(2, 10 * 24)
    convert_part_to_latlon(3, 10 * 24 * 10)
    convert_part_to_latlon(4, 10 * 24 * 10 * 24)
  end

  def latlon
    [ @lat.round(6), @lon.round(6) ]
  end

  #
  # Convert from latitude and longitude to a Maidenhead locator string.
  # Latitude should be between -90 and 90, and longitude should be between
  # -180 and 180.  Precision defaults to 5 blocks, which returns 10 characters.
  # More precise coordinates may work, but accuracy is not guaranteed.
  def self.to_maidenhead(lat, lon, precision = 5)
    maidenhead = Maidenhead.new
    maidenhead.lat = lat
    maidenhead.lon = lon
    maidenhead.precision = precision
    maidenhead.locator
  end

  def lat=(pos)
    @lat = pos.to_f
  end

  def lat
    @lat
  end

  def lon=(pos)
    @lon = pos.to_f
  end

  def lon
    @lon
  end

  def precision=(value)
    @precision = value
  end

  def precision
    @precision
  end

  def locator
    @locator = ''

    lat = @lat + 90.0
    lon = @lon + 180.0
    precision = @precision

    # Calculate the field
    lat = (lat / 10) + 0.0000001
    lon = (lon / 20) + 0.0000001
    @locator += n2l(lon.floor).upcase + n2l(lat.floor).upcase
    precision -= 1

    # Calculate the remaining values
    precision.times do |counter|
      if (counter % 2) == 0
        lat = (lat - lat.floor) * 10
        lon = (lon - lon.floor) * 10
        @locator += "#{lon.floor}#{lat.floor}"
      else
        lat = (lat - lat.floor) * 24
        lon = (lon - lon.floor) * 24
        @locator += n2l(lon.floor) + n2l(lat.floor)
      end
    end

    @locator
  end

  private

  def l2n(letter)
    if letter =~ /[0-9]+/
      letter.to_i
    else
      letter.downcase.ord - 97
    end
  end

  def n2l(number)
    (number + 97).chr
  end
end
