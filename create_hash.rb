require 'json'

class DataGenerator

  attr_accessor(:result_array, :data_hash)

  def create_hash
    data_hash = {}
    amount = (rand * 1000).floor
    data_hash[:date] = time_rand
    data_hash[:turnover] = amount
    data_hash[:direct_costs] = (amount / 100 * (80 + rand * 5)).floor
    data_hash
  end

  def print
    @result_array = []
    @result_array = 5000.times.collect { create_hash }
    @result_array.to_json
    File.open("data.json", 'w') { |file| file.write(@result_array.to_json) }
  end

  def time_rand(from = Time.local(2014,1,1), to = Time.local(2014,12,31))
    Time.at(from + rand * (to.to_f - from.to_f))
  end

end

result = DataGenerator.new
result.print

