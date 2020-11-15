enum DriveMode {
    case manual
    case automatic
}

enum ClimateMode {
    case cooling
    case heating
    case off
}

enum Errors: Error {
    case isLost
    case lowBattery
    case brokenAutopilot
    case wrongWay
    case isHandOnSteeringWheel
}

struct CarSpecifications {
    let weightInKilos = 2108
    let lengthInMeters = 4.967
    let widthInMeters = 1.963
    let heightInMeters = 1.435
    let wheelbaseInMeters = 2.959
    let clearanceInMeters = 0.1549
    let trunkVolumeInLiters = 900
}

class CarFunctions {
    var isMusicPlaying = false
    var hatchOpeningDegree: UInt = 0
    var fanSpeed: UInt = 0
    var driveMode: DriveMode?
    var driverClimate: ClimateMode?
    
    var isGpsEnabled = false
    var isLost = false
    var lowBattery = false
    var brokenAutopilot = false
    var wrongWay = false
    var isHandOnSteeringWheel = true
    
    func autoDrive() throws {
        if isLost {
            throw Errors.isLost
        }
        if lowBattery {
            throw Errors.lowBattery
        }
        if brokenAutopilot {
            throw Errors.brokenAutopilot
        }
        if wrongWay {
            throw Errors.wrongWay
        }
        if !isHandOnSteeringWheel {
            throw Errors.isHandOnSteeringWheel
        }
        driveMode = DriveMode.automatic
    }
    
    func switchAutopilotOn() throws {
        do {
            try autoDrive()
        } catch Errors.isLost {
            print("Вы заблудились! Включаю GPS")
            isGpsEnabled = true
        } catch Errors.lowBattery {
            print("Батарея садится! Ближайшая станция подзарядки через 1 км 300 м, прокладываю маршрут")
        } catch Errors.brokenAutopilot {
            print("Режим автопилота поврежден. Переходим в режим ручного управления!")
        } catch Errors.wrongWay {
            print("Вы ушли с маршрута! Следуйте карте!")
        } catch Errors.isHandOnSteeringWheel {
            print("Во избежание непредвиденных ситуаций держите руки на руле и не отвлекайтесь от дороги даже со включенным автопилотом!")
        }
        if driveMode == DriveMode.automatic {
            print("Автопилот успешно включен! Помните о безопасности: не отвлекайтесь от дороги и держите руки на руле!")
        }
    }
    
    func playMusic() {
        switch isMusicPlaying {
        case false:
            print("Включаю вашу музыку")
        default:
            print("Музыка уже включена. Попробуйте сделать громче.")
        }
    }
    
    func switchHatch(percents: UInt) {
        if percents > 0 {
            print("Открываю люк на \(percents) процентов.")
        } else {
            print("Закрываю люк")
        }
        hatchOpeningDegree = percents
    }
    
    func chooseDriverClimateMode(climateMode: ClimateMode) {
        switch climateMode {
        case .cooling:
            print("Включаю кондиционер")
            fanSpeed = 3
        case .heating:
            print("Включаю обогрев салона, руля и сидения")
            fanSpeed = 5
        case .off:
            print("Выключаю обдув салона")
            fanSpeed = 0
        }
    }
}
