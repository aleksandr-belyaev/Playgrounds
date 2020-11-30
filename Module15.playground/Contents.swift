enum HttpError: Error {
    case badRequest400
    case notFound404
    case internalServerError500
}

var currentError = HttpError.badRequest400

do {
    if HttpError.badRequest400 == currentError {
        throw HttpError.badRequest400
    }
    if HttpError.notFound404 == currentError {
        throw HttpError.notFound404
    }
    if HttpError.internalServerError500 == currentError {
        throw HttpError.internalServerError500
    }
} catch HttpError.badRequest400 {
    print("400 Bad Request")
} catch HttpError.notFound404 {
    print("404 Not Found")
} catch HttpError.internalServerError500 {
    print("500 Internal Server Error")
}


func testServer() throws {
    if HttpError.badRequest400 == currentError {
        throw HttpError.badRequest400
    }
    if HttpError.notFound404 == currentError {
        throw HttpError.notFound404
    }
    if HttpError.internalServerError500 == currentError {
        throw HttpError.internalServerError500
    }
}

do {
    try testServer()
} catch HttpError.badRequest400 {
    print("400 Bad Request")
} catch HttpError.notFound404 {
    print("404 Not Found")
} catch HttpError.internalServerError500 {
    print("500 Internal Server Error")
}

//последние три задания сформуированы очень непонятно, прошу сделать поправку на это = )
func isEqualPrint<T: AnyObject, E: AnyObject> (a: T, b: E) {
    if a === b {
        print("Yes")
    } else {
        print("No")
    }
}

enum TypeErrors: Error {
    case equals
    case different
}

func isEqualThrow<T: AnyObject, E: AnyObject> (a: T, b: E) throws {
    if a === b {
        throw TypeErrors.equals
    } else {
        throw TypeErrors.different
    }
}

func isEqual<T, E> (first: T, second: E) -> Bool where T: AnyObject, T: Equatable, E: AnyObject, E: Equatable {
    if first === second {
        if first == second as! T {
            return true
        }
    } else {
        do {
            return first == second as! T
        } catch TypeErrors.different {
            return false
        }
    }
    return false
}

