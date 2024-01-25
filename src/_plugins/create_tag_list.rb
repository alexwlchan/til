Jekyll::Hooks.register :site, :post_read do |site|
  tally = Hash.new { |h, k| h[k] = [] }

  site.posts.docs.each do |p|
    p.data["tags"].each { |t|
      tally[t] = tally[t].insert(tally[t].length, p)
    }
  end

  tally.each do |k, v|
    tally[k] = v.sort_by { |p| p.date }.reverse
  end

  site.data["tag_tally"] = tally
end