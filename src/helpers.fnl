(fn prompt [prompt]
  (io.write prompt)
  (io.read))

(fn first [xs]
  (. xs 1))

(fn rest [xs]
  (let [xs [(unpack xs)]]
    (table.remove xs 1)
    xs))

(fn iter->list [iter]
  (let [list []]
    (each [v iter]
      (table.insert list v))
    list))

(fn split [s sep]
  (let [anti-sep-pat (.. "([^" sep "]*)")
        sep-pat (.. sep anti-sep-pat)
        first (string.match s anti-sep-pat)
        rest (string.gsub s anti-sep-pat "" 1)
        result (iter->list (string.gmatch rest sep-pat))]
    (table.insert result 1 first)
    result))

(fn contains? [xs x]
  (var contained false)
  (each [_ y (ipairs xs)]
    (when (= y x)
      (set contained true)))
  contained)

{: prompt
 : first
 : rest
 : iter->list
 : split
 : contains?}
