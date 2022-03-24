# Gendered Pain in Greek Tragedy: Markup Methods

----------


## What is gendered pain?
<p>General definition of pain: Severe or mild physical and emotional 
discomfort</P>

<p>Definition of gendered pain: Pain associated with societal 
constructs of gender binary</p>

<p>For our markup, we are going to use a singular type of 
empty element to indicate all pain events/mentions of pain,
and we will put multiple attributes inside it.</P>

Example: `<painStart attribute="value"/>text<painEnd/>`

## Attributes:
*=optional element

### Receiver attributes

These attributes are relevant to the character who is experiencing or recieving the 
pain.

#### painType

A character's pain will be denoted as emotional, physical,
or both at the same time.

Values: "em" | "phys" | "both"

Example: `<painStart painType="em"/>`

#### rec

The values of this attribute are the names of the receivers of pain.

Example: `<painStart rec="Medea"/>`

#### recGen

Denotes the gender of the receiver(s) of pain.

Values: "man" | "woman" | "mix"

Example: `<painStart recGen="woman"/>`

#### recNorm

Denotes whether or not a receiver of pain is socially accepted in Greek society.

Values: "yes" | "no"

Example: `<painStart recNorm="no"/>`

#### recRel*

Denotes the relation of the receiver of pain to the inflicter of pain.

Example: `<painStart recRel="children"/>Medea hurt her children.<painEnd/>`

### Inflicter attributes

These attributes describe the character who is causing or inflicting the pain.

#### inf*

The values of this attribute are the names of the inflicters of pain. 

Example: `<painStart inf="Heracles"/>`

#### infGen*

Denotes the gender of the inflicter(s) of pain.

Values: "man" | "woman" | "mix"

Example: `<painStart infGen="woman"/>`

#### infNorm*

Denotes whether or not an inflicter of pain is socially accepted in Greek society.

Values: "yes" | "no"

Example: `<painStart infNorm="yes"/>`

#### infRel*

Denotes the relation of the inflicter of pain to the receiver.

Example: `<painStart infRel="mother"/>Medea hurt her children.<painEnd/>`