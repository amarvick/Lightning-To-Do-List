({
	calculateBMI : function(component, event, helper) {
		var weight = component.find("weight").get("v.value");
        var height = component.find("height").get("v.value");
        
        var weightKg = (weight * 0.45);
        var heightM = (height * 0.025);
        
        var BMI = (weightKg / (heightM*heightM) );
       
        alert("Your BMI is: " + BMI);
        
        if (BMI < 18.5) {
            alert("You're underweight. Put on some pounds, thin mint!");
        }
        
        else if (BMI >= 18.5 && BMI <=25) {
            alert("Congratulations! You're a healthy person! Don't blow it!");
        }
        
        else if (BMI > 25 && BMI <=30) {
            alert("You're overweight. Careful, there - you're on the urge of not being able to ride on certain amusement park water slides.");
        }
        
        else if (BMI > 30) {
            alert("You're obese. Nice going hippo, I'm not impressed. Leave your parent's basement already!");
        }
	}
})