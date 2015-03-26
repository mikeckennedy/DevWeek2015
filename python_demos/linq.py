
class Person:
    def __init__(self, name, age, hobbies):
        self.hobbies = hobbies
        self.age = age
        self.name = name

people = [
    Person('Ted', 27, ['Sleeping']),
    Person('Jeff', 40, ['Biking', 'Surfing']),
    Person('Michael', 41, ['Biking', 'Rock climbing']),
    Person('Zoe', 30, ['Swimming']),
]

bikers = (
    b.name
    for b in people
    if 'Biking' in b.hobbies
)

print(list(bikers))










