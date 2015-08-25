w = Workflow.first()

puts "Got workflow: #{w.id}"

#w.content[:elements][:nodes].each do |n|
#  puts "Id: #{n[:data][:id]}"
#end

Workflow.where({:'content.elements.nodes.data.id' => 'n0'}).each do |r| # other searches can be included after the first {}
  puts "Got result: #{r.id}"
end
