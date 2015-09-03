w = Workflow.first()

puts "Got workflow: #{w.id}"
puts "Contains element: #{ w.content['elements']['nodes'][0]['data']['id']}"

# I couldn't work this out, and so with the assistance of stack overflow I have used raw SQL.
# This should be OK as long as we watch out for SQL injection. 

query = "select * from workflows js,json_array_elements(content->'elements'->'nodes') as node where node->'data'->>'id' = 'n0';"
results = Workflow.find_by_sql(query)
results.each do |r|
  puts "Got result: #{r.id}"
end
