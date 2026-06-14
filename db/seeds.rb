user = User.find_or_create_by!(email: "paulo@email.com") do |u|
  u.name = "Paulo"
end

user.tasks.find_or_create_by!(title: "Configurar projeto") do |t|
  t.description = "Setup inicial do Rails"
end

user.tasks.find_or_create_by!(title: "Aprender Active Record") do |t|
  t.description = "Estudar associations e scopes"
end

user.tasks.find_or_create_by!(title: "Fazer deploy") do |t|
  t.description = "Publicar o app"
end
