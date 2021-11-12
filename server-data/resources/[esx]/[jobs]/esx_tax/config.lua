Config = {}

-- Bank Tax Brackets
Config.HoboClassLimit  =  0
Config.PoorClassLimit  =  50000
Config.LowerClassLimit  =  150000
Config.LowerMiddleClassLimit = 250000
Config.MiddleClassLimit = 500000
Config.UpperMiddleClassLimit = 1000000
Config.LowerHigherClassLimit =  3000000
Config.HigherClassLimit =  6000000
Config.UpperHigherClassLimit =  12000000

-- Bank Tax Deductions (Multiplier)
Config.HoboClassTax  =  0.0
Config.PoorClassTax  =  0.0125
Config.LowerClassTax  =  0.025
Config.LowerMiddleClassTax = 0.0375
Config.MiddleClassTax =  0.05
Config.UpperMiddleClassTax =  0.0625
Config.LowerHigherClassTax = 0.075
Config.HigherClassTax =  0.0875
Config.UpperHigherClassTax = 0.1

-- Car Tax Deductions - i.e $100 tax for each car
Config.CarTax = 250

-- Tax Interval
Config.Second = 1000
Config.Minute = 60 * Config.Second
Config.Hour = 60 * Config.Minute

-- Tax Interval
Config.TaxInterval = 15 * Config.Minute -- i.e every hour