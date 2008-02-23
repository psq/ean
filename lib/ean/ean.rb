# UPC-A
# 12 numeric values
# GTIN-12

# EAN-13
# 13 numeric values
# GTIN-13

# UPC-E
# 12 numeric values, suppressed 0s 
# GTIN-12

# EAN-8
# 8 numeric values

module EAN
  def generate_check_digit
    numbers = self.to_s.gsub(/[\D]+/, "").split(//)

    checksum = 0
    case numbers.length
    when 7
      0.upto(numbers.length-1) do |i| checksum += numbers[i].to_i * ((i-1)%2*3 +i%2) end
    when 11
      0.upto(numbers.length-1) do |i| checksum += numbers[i].to_i * ((i-1)%2*3 +i%2) end
    when 12
      0.upto(numbers.length-1) do |i| checksum += numbers[i].to_i * (i%2*3 +(i-1)%2) end
    when 13
      0.upto(numbers.length-1) do |i| checksum += numbers[i].to_i * ((i-1)%2*3 +i%2) end
    else
      0
    end

    return ((10 - checksum % 10)%10).to_s
  end

  def upc?
    numbers = self.to_s.gsub(/[\D]+/, "").split(//)

    checksum = 0
    case numbers.length
    when 8
      0.upto(numbers.length-2) do |i| checksum += numbers[i].to_i * ((i-1)%2*3 +i%2) end
    when 12
      0.upto(numbers.length-2) do |i| checksum += numbers[i].to_i * ((i-1)%2*3 +i%2) end
    when 13
      0.upto(numbers.length-2) do |i| checksum += numbers[i].to_i * (i%2*3 +(i-1)%2) end
    when 14
      0.upto(numbers.length-2) do |i| checksum += numbers[i].to_i * ((i-1)%2*3 +i%2) end
    else
      0
    end

    return numbers[-1].to_i == (10 - checksum % 10)%10
  end

  def to_gtin
    numbers = self.to_s.gsub(/[\D]+/, "")
    case numbers.length
    when 8
      '000000'+numbers
    when 12
      '00'+numbers
    when 13
      '0'+numbers
    when 14
      numbers
    else
      '00000000000000'
    end
  end

end

class String
  include EAN
end