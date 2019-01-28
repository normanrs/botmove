class Botmove
  attr_reader :dir,
              :fb,
              :lr

  def initialize
    @dir = [:f, :l, :b, :r]
    @fb  = 0
    @lr  = 0
  end

  def l
    @dir.rotate!
  end

  def r
    @dir.rotate!(-1)
  end

  def g
    if @dir[0] == :f
      @fb += 1
    elsif @dir[0] == :l
      @lr -= 1
    elsif @dir[0] == :b
      @fb -= 1
    elsif @dir[0] == :r
      @lr += 1
    else
      p 'Something went wrong'
    end
  end

  def returns_to_origin(text)
    commands = (text.downcase.split('')).map { |x| x.to_sym }
    commands.each do|d|
      self.send d
    end
  end

  def coords
    [@fb, @lr]
  end

end
