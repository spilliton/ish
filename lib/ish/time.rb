module Ish
  module Time

    def ish(opts={})
      Ish.fuzzify_time(self, opts)
    end

  end
end