# Four courses. 15 groups per course.

courses = Course.create([{ code: 'Miércoles Mañana' }, { code: 'Miércoles Noche' }, { code: 'Jueves Mañana' },  { code: 'Viernes Noche' }])

15.times{ |n| Group.create(:course => Course.first,  :name => n + 1) }
15.times{ |n| Group.create(:course => Course.second,  :name => n + 1) }
15.times{ |n| Group.create(:course => Course.third,  :name => n + 1) }
15.times{ |n| Group.create(:course => Course.fourth,  :name => n + 1) }
