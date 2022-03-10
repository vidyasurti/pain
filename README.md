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
|



