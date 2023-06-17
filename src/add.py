import random 

def sum_nums(x,y):
    x + y

def sum_random_numbers(iterations):
    random.seed(1234)
    for it in range(iterations):
        x = random.random()
        y = random.random()
        sum_nums(x,y)

if __name__ == '__main__':
    sum_random_numbers(10**8)
