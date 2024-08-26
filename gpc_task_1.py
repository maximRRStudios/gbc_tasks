"""
Task 1
Например:  [1,3,1,2,4,1,2,13].
Нужно преобразовать его в список из элементов, которые встречаемся в нем не
более 2-х раз. Каждое третье и последующее вхождение из него убрать.
Исходный порядок должен быть сохранен.
"""


def process_list(source_list: list) -> list:
    """
    Список только с 2 повторениями
    """
    result = []
    for item in source_list:
        if result.count(item) <= 2 - 1: # т.к. count c нуля начинает если список пуст 
            result.append(item)
    return result


if __name__ == '__main__':
    src = [1,3,1,2,4,1,2,13]
    print(process_list(src))
