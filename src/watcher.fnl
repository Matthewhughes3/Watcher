(local {: prompt : first : rest : iter->list : split : contains?} (require :helpers))
(local argparse (require :argparse))
(local uv (require :luv))

(fn watch [path files cb]
  (let [event (uv.new_fs_event)]
    (uv.fs_event_start
      event
      path
      {}
      (fn [err filename events]
        (if err
          (error err)
          (when (contains? files filename)
            (cb filename events)))))
    event))

(fn run [path files cmd args stdio]
  (watch
    path
    files
    (fn [_ _]
      (uv.spawn
        cmd
        {:stdio stdio
         :args args}
        (fn [_ _])))))

(fn parser []
  (let [parser (argparse "watcher" "Watch files and react to changes")]
    (: parser :option "-p --path" "Path to watch")
    (: parser :option "-f --files" "Files to watch")
    (: parser :option "-c --command" "Command to run on file change")
    (: parser :option "-s --stdio" "Show stdio from command in terminal")
    parser))

(fn main []
  (let [{: path : files : command : stdio} (: (parser) :parse)
        path (or path (prompt "Path to watch: "))
        files (split (or files (prompt "Space-separated files to watch: ")) " ")
        cmd-parts (split (or command (prompt "Command to run on file change: ")) " ")
        cmd (first cmd-parts)
        args (rest cmd-parts)]
    (run path files cmd args stdio)
    (uv.run)))

(main)
