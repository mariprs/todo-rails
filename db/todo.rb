# adicionando a lista de listas
list_groups = [] # array de hashes

loop do
  puts "\n=== MENU ==="
  puts "1. Criar nova lista"
  puts "2. Adicionar tarefa à lista"
  puts "3. Marcar ou desmarcar tarefa"
  puts "4. Modificar lista"
  puts "5. Deletar lista"
  puts "6. Deletar tarefa"
  puts "7. Mostrar listas e tarefas"
  puts "8. Sair"
  puts "Escolha a sua ação -> "
  choice = gets.chomp.to_i
  case choice
  when 1 # criando nova lista
    puts "Digite o titulo da nova lista -> "
    title = gets.chomp
    puts "Digite o subtitulo da lista -> "
    subtitle = gets.chomp
    list_groups << { title: title, subtitle: subtitle, tasks: [] }
    puts "Lista criada com sucesso"
  when 2
    puts "Digite o título da lista que deseja adicionar uma tarefa -> "
    list_title = gets.chomp
    list = list_groups.find { |group| group[:title] == list_title }
    if list
      puts "Digite o titulo da tarefa"
      task_title = gets.chomp
      puts "Digite o subtitulo da tarefa"
      task_subtitle = gets.chomp
      list << { title: title, subtitle: subtitle, completed: false }
      puts "Tarefa adicionada"
    else 
      puts "Lista nao encontrada"
    end
  when 3
    puts "Digite o titulo da lista que deseja desmarcar ou marcar tarefa"
    list_title = gets.chomp
    list = list_groups.find { |group| group[:title] == list_title }
    if list
      puts "Digite o índice da tarefa que deseja marcar ou desmarcar "
      task_index = gets.chomp.to_i
      if task_index >= 0 && task_index < list[:tasks].size
        task = list[:tasks][task_index]
        task[:completed] = !task[:completed]
        status = task[:completed] ? "concluída" : "desmarcada"
        puts "Tarefa #{task[:title]} foi #{status}"
      else
        puts "Índice inválido"
      end
    else
      puts "Lista não encontrada"
    end
  when 4
    puts "Digite o titulo da lista que deseja modificar -> "
    list_title = gets.chomp
    list = list_groups.find  { |group| group[:title] == list_title }
    if list 
      puts "Digite o novo titulo -> "
      new_title = gets.chomp
      puts "Digite o novo subtitulo -> "
      new_subtitle = gets.chomp
      list[:title] = new_title
      list[:subtitle] = new_subtitle
      puts "Lista modificada"
    else 
      puts "Lista não encontrada"
    end
  when 5
    puts "Digite o índice da lista que deseja deletar"
    index = gets.chomp.to_i
    if index >= 0 && index < list_groups.size
      deleted_list = list_groups.delete_at(index)
      puts "Lista #{deleted_list[:title]} foi deletada"
    else
      puts "Lista não encontrada"
    end
  when 6
    puts "Digite o título da lista onde deseja deletar uma tarefa -> "
    list_title = gets.chomp
    list = list_groups.find { |group| group[:title] == list_title }
    if list
      puts "Digite o índice da tarefa que deseja deletar ->"
      task_index = gets.chomp.to_i
      if task_index >= 0 && task_index < list[:tasks].size
        deleted_task = list[:tasks].delete_at(task_index)
        puts "Tarefa #{deleted_task[:title]} deletada com sucesso"
      else 
        puts "Indice inválido"
      end
    else
      puts "Lista não encontrada"
    end
  when 7
    puts "\n === LISTAS E TAREFAS ==="
    list_groups.each_with_index do |group,index|
      puts "Lista #{index + 1}: #{group[:title]} - #{group[:subtitle]}"
      group[:tasks].each_with_index do |task, task_index|
        status = task[:completed]? "[X]": "[ ]"
        puts "Tarefa #{task_index + 1}: #{status} #{task[:title]} - #{task[:subtitle]}"
      end
    end
  when 8
    break
  else 
    puts "opção inválida"
  end
end
#       puts "Digite o subtitulo -> "
#       task_subtitle = gets.chomp
#       list[:tasks] << { title:task_title, subtitle: task_subtitle, completed: false }
#       puts "Tarefa adicionada"
#     else
#       puts "Lista naõ encontrada"
#     end
# puts "Título da lista"
# title = get.chomp
# puts "Subtitulo"
# subtitle = get.chomp

# list_groups << { title: title, subtitle: subtitle, tasks: [] }

# # adicionando to-do na lista
# puts "Digite o título da lista que deseja encontrar"
# list = list_groups.find { |group| group[:title] == list_title }

# if list
#   puts "Digite o título da tarefa -> "
#   task_title = gets.chomp
#   puts "Digite o subtítulo da tarefa -> "
#   task_subtitle = gets.chomp
#   list[:tasks] << { title: task_title, subtitle: task_subtitle, completed: false }
#   puts "Tarefa adicionada"
# else
#   puts "Lista não encontrada"
# end
# # marcando e desmarcando a tarefa da to-do
# puts "Digite o título da lista onde deseja marcar ou desmarcar -> "
# list_title = gets.chomp

# list = list_groups.find { |group| group[:title] == list_title }
# if list
#   puts "Digite o índice da tarefa que deseja marcar ou desmarcar (começa em 0)"
#   task_index = gets.chomp.to_i

#   if task_index >= 0 && task_index < list[:tasks].size
#     task = list[:tasks][task_index]
#     task[:completed] = !task[:completed]
#     status = task[:completed] ? "marcada como concluida" : "desmarcada"
#     puts "Tarefa #{task[:title]} foi #{status}"
#   else
#     puts "Índice inválido"
#   end
# else
#   puts "Lista não encontrada"
# end

# # modificando
# puts "Digite o título da lista que deseja modificar -> "
# list_title = gets.chomp
# list = list_groups.find { |group| group[:title] == list_title }
# if list
#   puts "Digite o novo título -> "
#   new_title = gets.chomp
#   puts "Digite o novo subtítulo -> "
#   new_subtitle = gets.chomp
#   list [:title] = new_title
#   list [:subtitle] = new_subtitle
#   puts "Lista modificada"
# else
#   puts "Lista não encontrada"
# end

# # vou precisar pegar o input e substituir de acordo com o índice

# # deletando um índice
# puts "digite o índice que deseja deletar -> "
# index = gets.chomp.to_i
# if index < list_groups.size
#   deleted_list = list_groups.delete_at(index)
#   puts "Lista #{deleted_list[:title]} deletada"
# else
#   puts "índice inválido"
# end

# # deletando uma tarefa
# puts "Digite o título da lista onde deseja deletar a tarefa -> "
# list_title = gets.chomp
# list = list_groups.find { |group| group[:title] == list_title }

# if list
#   puts "Digite o índice da tarefa que deseja deletar -> "
#   task_index = gets.chomp.to_i
#   if task_index < list[:tasks].size
#     deleted_task = list[:tasks].delete_at(task_index)
#     puts "Tarefa #{deleted_task[:title]} deletada"
#   else
#     puts "índice inválido"
#   end
# else
#     puts "lista não encontrada"
# end

# # como vou deletar por indice

# # iterando
# # a coisa mais simples, só referir a hash com um .each depois
# # When iterating over hashes, two placeholder variables are needed to represent each key/value pair.
# list_groups.each_with_index do |group,index|
#   puts "Lista #{index + 1}: #{group[:title]} - #{group[:subtitle]}"

#   group[:tasks].each_with_index do |task, task_index|
#     puts "Tarefa #{task_index + 1}: #{task[:subtitle]}"
#   end
# end
