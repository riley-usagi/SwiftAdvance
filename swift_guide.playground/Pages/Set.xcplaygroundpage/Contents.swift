//: [Назад](@previous)
import Foundation
//: ## Коллекции (Set / Коллекция уникальных данных)
//: Элементы в данной коллекции не могут повторяться.
//: Если вы попытаетесь добавить в коллекцию элемент, который уже в ней есть, то ничего не произойдёт.
//: Так же как и Словарь, данный тип коллекции не гарантирует сохранения порядка элементов.
var santaPoringDrop: Set<String>  = ["Apple", "Candy", "Candy Cane", "Santa Hat", "Santa Poring Card"]
var nineTailDrop: Set<String>     = ["Candy Cane", "Royal Jelly", "Old Blue Box", "Dead Branch", "Glass Bead", "Something alien"]
//: Проверка на то,со держит ли коллекция указанный элемент.
santaPoringDrop.contains("Candy")
//: Добавление и удаление элемента.
nineTailDrop.insert("Rough Oridecon")
nineTailDrop.remove("Something alien")
//: Подсчёт элементов и проверка на пустоту коллекции.
santaPoringDrop.count
nineTailDrop.isEmpty
//: Объединение уникальных коллекций. Повторные эелементы удаляются.
santaPoringDrop.union(nineTailDrop)
//: Пересечение коллекций.
nineTailDrop.intersection(santaPoringDrop)
//: Вычитание коллекций. Остаются только те элементы первой коллекции, которых нет во второй.
santaPoringDrop.subtracting(nineTailDrop)
//: Только неповторяющиеся элементы коллекций.
santaPoringDrop.symmetricDifference(nineTailDrop)

santaPoringDrop.dropFirst()
nineTailDrop.dropLast()
//: Домашнее задание
//: Создате пару уникальных коллекций и произведите над ними все вышеописанные операции.

//: [Вперёд](@next)
