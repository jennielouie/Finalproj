User.create({name: 'Aaron', email: 'a@a.com', password: '111111'})
User.create({name: 'Brian', email: 'b@b.com', password: '111111'})
User.create({name: 'Cece', email: 'c@c.com', password: '111111'})


Project.create({projtitle:'first project', author:'first author', notes:'first notes'})
Project.create({projtitle:'second project', author:'second author', notes:'second notes'})
Project.create({projtitle:'third project', author:'third author', notes:'third notes'})
UserProject.create({user_id: '1', project_id: '1'})
UserProject.create({user_id: '2', project_id: '2'})
UserProject.create({user_id: '3', project_id: '3'})
UserProject.create({user_id: '1', project_id: '4'})
UserProject.create({user_id: '2', project_id: '3'})
UserProject.create({user_id: '3', project_id: '1'})

