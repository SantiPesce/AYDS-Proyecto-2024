# frozen_string_literal: true

require 'csv'
require 'json'

def csv_to_hash(file_name)
  array_of_hashes = []
  CSV.foreach(file_name, headers: true) do |row|
    hash = {}
    row.each do |header, value|
      hash[header] = value
    end
    array_of_hashes << hash
  end
  array_of_hashes
end

file_name = '/home/juan/Escritorio/Periodic_Table_of_Elements.csv' # reemplaza esto con el nombre de tu archivo
hashes = csv_to_hash(file_name)

File.open('elementos.txt', 'w') do |f|
  f.write(JSON.pretty_generate(hashes))
end
