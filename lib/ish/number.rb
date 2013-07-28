module Ish
  module Number

    def ish(opts={})
      Ish.fuzzify(self, opts)
    end

  end
end 
