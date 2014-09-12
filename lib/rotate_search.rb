def bi_search(query, list)
  count = list.count
  index = (count / 2).to_i
  elem = list[index]
  return true if elem == query
  return false if count <= 1

  if query < elem
    bi_search(query, list[0..(index - 1)])
  elsif query > elem
    bi_search(query, list[(index + 1)..-1])
  else
    true
  end
end

def rotate_search(query, list)
  count = list.count
  index = (count / 2).to_i
  elem = list[index]
  return true if elem == query
  return false if count <= 1
  first = list.first
  last = list.last
  left = list[0..(index - 1)]
  right = list[(index + 1)..-1]

  if first <= last
    bi_search(query, list)
  elsif first <= elem
    if first <= query && query <= elem
      bi_search(query, left)
    else
      rotate_search(query, right)
    end
  elsif elem <= last
    if elem <= query && query <= last
      bi_search(query, right)
    else
      rotate_search(query, left)
    end
  end
end
