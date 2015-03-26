import random


# pubic static List<string> GetDaysOfWeek() { }
def get_days_of_week():
    # var days = new List<string>() { ... }
    days = ['mon', 'tues', 'wed', 'thurs', 'fri', 'sat', 'sun']

    return days


# public static string GetWeather(string day) {}
def get_weather(day):
    reports = ['sunny', 'hot', 'cold', 'smokey', 'foggy']
    # index = random.randint() % len(reports)
    # return reports[index]
    return random.choice(reports)


def main():
    # List<string> days = GetDaysOfWeek()
    days = get_days_of_week()

    for d in days:
        r = get_weather(d)
        print("The weather on {} is {}.".format(d, r))


main()









