Position = Struct.new :x, :y, :direction do
  def to_s
    to_a.join(',')
  end
end
