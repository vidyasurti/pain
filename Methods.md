# Methods

----------


### What is gendered pain?
General definition of pain: Severe or mild physical and emotional 
discomfort
Definition of gendered pain: Pain associated with societal 
constructs of gender binary

<<<<<<< Updated upstream

=======
Use empty elements: one single tag < ... />
>>>>>>> Stashed changes

### Elements:
1. Amplifier
Explanation: surrounding characters who influence the experienced 
pain
Example: `<amp></amp>`

2. Inflicter 
-Explanation: the character who is causing or inflicting the pain
-Example: `<inf></inf>`

3. Receiver
-Explanation: The character who is experiencing or recieving the 
pain 
-Example: `<rec></rec>`


### Attributes: level 1
*= attribute only modifies the “receiving” element
1. Gender-
-Explanation: Binary gender of character involved in pain
<<<<<<< Updated upstream
-Example: `<amp/inf/rec  gender=“0”> `
-Boolean value: 0 → man, 1→ woman

2. *Emotional-
-Explanation: Pain causing mental/ emotional anguish
-Example: `<amp/inf/rec em=“0”>`
-Boolean value: 0→is not emotional pain, 1→is physical pain

3. *Physical-
-Explanation: Physical/bodily symptoms that amplify discomfort
-Example: `<amp/inf/rec phys="0">`
-Boolean value: 0 → is not physical pain, 1 → is physical pain
-If physical pain:
Cause = “violence”, “infection”, …

4. Normative values?
-Explanation: Whether the character specified generally follows 
Greek normative values
-Example: `<inf norm=“1”>`
=======
-Example: `<amp/inf/rec  gender=“man/woman”> `


2. *Emotional-
-Explanation: Pain causing mental/ emotional anguish
-Example: `<amp/inf/rec type="em">`
-Boolean value: 0→is not emotional pain, 1→is emotional pain

3. *Physical-
-Explanation: Physical/bodily symptoms that amplify discomfort
-Example: `<amp/inf/rec type="phys">`
-If physical pain:
Cause = “violence”, “infection”, …
 
(If both em and phys pain, then type= "em" "phys") 

4. Normative values-
-Explanation: Whether the character specified generally follows 
Greek normative values
-Example: `<inf norm=“yes/no">`
>>>>>>> Stashed changes
-Boolean value: 0 → does not follow normative values (not socially
accepted character), 1 → does follow normative values (socially 
accepted character)




