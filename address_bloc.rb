greeting=ARGV[0]
ARGV.shift
ARGV.each do |name|
  p "#{greeting} #{name}"
end
