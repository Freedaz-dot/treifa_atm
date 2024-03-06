

ATM = {
    hashatm = {
        {model = -870868698}, 
        {model = -1126237515}, 
        {model = -1364697528}, 
        {model = 506770882}
    },

    ItemName = "drill", -- item name to use the atm / nom de l'item pour utiliser l'atm
    ATMDistance = 3.0, -- distance to use the atm / distance pour utiliser l'atm
    Moneyorblack = true, -- si c'est de l'argent noir ou non si c'est true c'est de l'argent noir si c'est false c'est de l'argent propre / if it's black money or not if it's true it's black money if it's false it's clean money
    MoneyToGive = 1000, -- argent a donner / money to give
    numberCops = 0, -- nombre de flics necessaire pour pouvoir forcer un atm / number of cops needed to force an atm
    CopsJobName = "police", -- nom du job flic / name of the cop job
    Notifnotenoughcops = "Pas assez de flics en ville", -- notif si pas assez de flics / notify if not enough cops
    NotifPoliceAlertPolice = "Un individu est en train de voler un ATM", -- notif pour les flics si un atm est forcé / notify for cops if atm is forced
}


LaserDrill = {
    ['animations'] = {
        {'intro', 'bag_intro', 'intro_drill_bit'},
        {'drill_straight_start', 'bag_drill_straight_start', 'drill_straight_start_drill_bit'},
        {'drill_straight_end_idle', 'bag_drill_straight_idle', 'drill_straight_idle_drill_bit'},
        {'drill_straight_fail', 'bag_drill_straight_fail', 'drill_straight_fail_drill_bit'},
        {'drill_straight_end', 'bag_drill_straight_end', 'drill_straight_end_drill_bit'},
        {'exit', 'bag_exit', 'exit_drill_bit'},
    },
    ['scenes'] = {}
}