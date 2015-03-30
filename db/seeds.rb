# Four courses. 15 groups per course.

courses = Course.create([
  { code: 'mm', description: 'Miércoles Mañana' },
  { code: 'mn', description: 'Miércoles Noche' },
  { code: 'jm', description: 'Jueves Mañana' },
  { code: 'vn', description: 'Viernes Noche' }
])

15.times{ |n| Group.create(:course => Course.first, :code => n + 1) }
15.times{ |n| Group.create(:course => Course.second, :code => n + 1) }
15.times{ |n| Group.create(:course => Course.third, :code => n + 1) }
15.times{ |n| Group.create(:course => Course.fourth, :code => n + 1) }
