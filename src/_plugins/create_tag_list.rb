Jekyll::Hooks.register :site, :post_read do |site|
  tally = Hash.new { |h, k| h[k] = [] }

  site.posts.docs.each do |p|
    p.data["tags"].each { |t|
      tally[t] = tally[t].insert(tally[t].length, p)
    }
  end

  site.data["tag_tally"] = tally

  puts tally
end