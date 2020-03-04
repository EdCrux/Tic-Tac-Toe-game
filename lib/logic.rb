module Logic
  def self.winner(arr)
    3.times do |ite|
      return true if rows(arr, ite)
      return true if columns(arr, ite)
    end
    return true if tl_rb(arr) || tr_lb(arr)

    false
  end

  def self.rows(arr, ite)
    (arr[ite * 3] == arr[(ite * 3) + 1]) && (arr[ite * 3] == arr[(ite * 3) + 2])
  end

  def self.columns(arr, ite)
    (arr[ite] == arr[ite + 3]) && (arr[ite] == arr[ite + 6])
  end

  def self.tl_rb(arr)
    ((arr[0] == arr[4]) && (arr[0] == arr[8]))
  end

  def self.tr_lb(arr)
    ((arr[2] == arr[4]) && (arr[2] == arr[6]))
  end
end
