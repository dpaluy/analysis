require 'config/environment'
require 'lib/progressbar'
#require 'time'
#require 'date'
require 'lib/array'

def merge_time(data)
  result = []
  grouped = (data.group_by { |v| Time.parse(v[0]).strftime("%H:%M") }).sort
  grouped.each do |v|
    t = v[0]
    average_value = (v[1].map {|val| val[1].to_f}).mean.round(2) 
    grouped_value = [t, average_value]
    result << grouped_value
  end
    
  result
end
  
def load_records(filename, quote)
  counter = 0
  total = %x{wc -l #{filename}}.split.first.to_i
  pbar = ProgressBar.new("#{total} records", total)
  f = File.basename(filename)
  day = f[0,8]
  puts "Loading #{filename}\n"
  data = []
  File.open(filename, 'r').each_line { |line|
    time, value = line.strip.split(',') unless line.empty?
    data << [time, value]
  }
    
  records = merge_time(data)
 
  records.each do |record|
    value = Value.new(:quote_id => quote.id, :value => record[1], :timestamp => DateTime.parse("#{day} #{record[0]}") )
    if value.save!
      counter += 1
    else
      puts "Error D=#{record[0]} V=#{value.inspect}"
    end
    pbar.inc
  end
  pbar.finish
  puts "#{counter} records added!"
end

namespace :loader do
  desc "Load Records"
  task :records, [:location, :quote] do |t, args|
    if args.location.nil? || args.quote.nil?
      puts args.inspect
      puts "Usage: rake loader:records[directory, quote]"
      exit
    end
    dir = args.location.chomp('/')
    path = "#{dir}/**/*.csv"
    filelist = Dir[path].sort
    
    quote = Quote.find_by_name args.quote
    raise "Quote #{args.quote} is missing" if quote.nil?
    filelist.each {|f| load_records(f, quote)} 
  end  
end

