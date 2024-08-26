"""
Task 2
Дана строка s: str и список слов dictionary: List[str].
Нужно найти слово максимальной длины из dictionary, которое можно получить 
удалением некоторого количества элементов из s. Если таких слов несколько, 
то нужно вернуть то, которое имеет минимальный лексиграфический порядок.
s = “abcpldpseplae”, dictionary = [‘ale’, ‘apple’, ‘monkey’, ‘sgfh’] -> ‘apple’’
"""


def find_longest_word(letters, words):
    """
    отдает длинное слово
    """
    result = []
    for letter in words:
        if all(elem in [*letters] for elem in [*letter]):
            result.append(letter)
    result.sort()
    return [item for item in result if len(item) == len(max(result, key=len))][0]


if __name__ == '__main__':
    src_letters = "abcpldpseplaey"
    src_words = ['ale', 'apple', 'monkey', 'sgfh', 'apply', 'appla', 'app']
    print(find_longest_word(src_letters, src_words))
