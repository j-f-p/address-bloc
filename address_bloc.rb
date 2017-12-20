if ARGV.length==0
  p "Hi"
else
  greeting=ARGV[0]
  if ARGV.length==1
    p greeting
  else
    ARGV.shift
    ARGV.each do |name|
      p "#{greeting} #{name}"
    end
  end
end
