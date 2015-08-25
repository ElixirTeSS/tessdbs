w = Workflow.first()

puts "Got workflow: #{w.id}"
puts "Contains element: #{ w.content['elements']['nodes'][0]['data']['id']}"

#w.content[:elements][:nodes].each do |n|
#  puts "Id: #{n[:data][:id]}"
#end

#"content->'elements'->'nodes'->'data'->'id' = ?", 'n0'
Workflow.where("content #>> '{elements,nodes,data,id}' = 'n0'").each do |r| # other searches can be included after the first {}
  puts "Got result: #{r.id}"
end
