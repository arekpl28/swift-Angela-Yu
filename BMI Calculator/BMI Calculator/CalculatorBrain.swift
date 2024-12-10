import UIKit

struct CalculatorBrain {
    var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
  
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more food", color: .blue)
        } else if bmiValue < 25 {
            bmi = BMI(
                value: bmiValue,
                advice: "Fit as a fiddle",
                color: .systemGreen
            )
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less food", color: .red)
        }
    }

    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Something went wrong"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
