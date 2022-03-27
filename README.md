# Gendered Pain in Greek Tragedy

## Research questions and theoretical framework
We have a few research questions that guide our markup:
* How do depictions of pain in Greek Tragedies differ between men and women?
* Are depictions of experiencing and inflicting pain in greek tragedies distributed equally among men and women?


We are using a binary definition of gender. Additionally, we are looking at these greek tragedies in a vacuum, not looking at these tragedies in the context of preceding plays.


## Which greek tragedies and why
We are using four greek tragedies for our analysis:
* Libation Bearers
* Medea
* Philoctetes
* Women of Trachis

The first two plays, Libation Bearers and Medea, were selected because they depict women in pain. Philoctetes and Women of Trachis depict men in pain. This way, we have enough data to make conclusios about women's and men's pain. 

## What we hope to find out
We hope to find out how depictions of pain vary across gender and how greek tragedies portray inflicting pain across gender as well.

## Markup stretegy and significance
Since events of pain can span more than one speech or paragraph and create hierarchy problems, we do not use `<pain>` elements to wrap events of pain, but we use Trojan milestones `<painStart/>` and `<painEnd/>`. Each `painStart`  element starts at the beginning of an instance of pain being described or acted out in the greek tragedy. The attributes for each `painStart` are as follows;

| Attribute | Description |
| ----------| ----------- |
| rec | receiver, indicates the name of who is experiencing pain, *required in all* |
| recGen | gender of receiver, indicates the binary gender of the character who is experiencing pain, possible values are `man`, `woman`, and `mix` for a mixed group of individuals, *required in all* |
| recNorm | whether the character experiencing pain fits the general norms of Greek society, from the perspective of the original Greek audience of the tragedy; when a receiver of pain would not be socially accepted in Greek society, this value is `no` and otherwise `yes`, *required in all* |
| painType | the type of pain being experienced, possible values are `em` for emotional, `phys` for physical, and `both` for both kinds of pain at once in one event, *required in all* |
| inf | inflictor, the name of who is inflicting pain, in the case of a nonhuman inflictor this can only take the values of `disease` or `nature`*required when someone is inflicting pain, but not in all* |
| infGen | gender of inflictor, the gender of the person inflicting pain, possible values are `man`, `woman`, or `mix` for a mixed group of people, *required for all that have an inf*
| infNorm | whether the character inflicting pain fits the general norms of Greek society, from the perspective of the original Greek audience of the tragedy, when a receiver of pain would not be socially accepted in Greek society, this value is `no` and otherwise `yes`, *required for all that have an inf* |
| recRel | relation of receiver to inflictor, *required for all that have inf* |
| infRel | relation of inflictor to receiver,  *required for all that have inf*
| direct | whether the pain that is being inflicted is direct or not, possible values are `yes` if the pain is directly caused by the inflictor or `no` if the pain is indirectly caused; *required for all that have inf*
### Examples:
* `<painStart rec="Agamemnon" recGen="man" recNorm="yes" painType="both"
							recRel="husband" inf="Clytamnestra" infGen="woman" infNorm="no"
							infRel="wife"/>` OR
* `<painStart rec="society" recGen="mix"
							recNorm="yes" painType="both"/>`OR
* `<painStart rec="Electra" recGen="woman"
							recNorm="yes" painType="phys" inf = "disease"`							


