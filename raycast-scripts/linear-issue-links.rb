#!/usr/bin/ruby

# @raycast.schemaVersion 1
# @raycast.title Format Linear Issue Links
# @raycast.mode silent
# @raycast.icon 🔗
# @raycast.description Replace Linear issue URLs and IDs with Markdown links

# Clipboard examples
#   AI-123
#     → [AI-123](https://linear.app/issue/AI-123)
#   https://linear.app/supabase/issue/AI-123/example
#     → [AI-123](https://linear.app/supabase/issue/AI-123/example)
#
# Existing Markdown links and other URLs stay unchanged.

require 'open3'

text, status = Open3.capture2('pbpaste')
abort 'Could not read the clipboard' unless status.success?

pattern = %r{\[[^\]\n]*\]\([^\s)]*\)|https://linear\.app/(?:[^\s/]+/)?issue/([A-Za-z][A-Za-z0-9]*-\d+)(?:/[^\s<>()\[\]]*[A-Za-z0-9/_-])?|https?://[^\s<>()\[\]]+|(?<![\w-])([A-Z][A-Z0-9]*-\d+)(?![\w-])}
count = 0
formatted = text.gsub(pattern) do |match|
  url_id, bare_id = $1, $2
  if url_id || bare_id
    count += 1
    id = url_id || bare_id
    url = url_id ? match : "https://linear.app/issue/#{id}"
    "[#{id}](#{url})"
  else
    match
  end
end

if count.zero?
  puts 'No unlinked Linear issue URLs or IDs found'
else
  IO.popen(['pbcopy'], 'w') { |clipboard| clipboard.write(formatted) }
  abort 'Could not update the clipboard' unless $?.success?
  puts "Formatted #{count} Linear issue link#{'s' if count != 1}"
end
