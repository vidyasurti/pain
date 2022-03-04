# Methodology

## removing notes
removed all notes by looking up `<note` and manually removing all 43 instances of notes by matching the end tags and removing the elements from the beginning of the start tag to the end of the end tag
removed 43 notes elements
## removing milestones
removed all milestone elements by looking up `<milestone[^<>]+>` since they are all empty elements and replacing them with nothing
In total, removed 303 milestone elements
## removing gap elements
removed all gap elements by looking up `<gap[^<>]+>` and replacing it with nothing
In libation bearers, there was only 1 of these elements.

## THINGS I NOTICED
* perhaps removing all `<p>` elements would be productive in helping document markup and to prevent overlapping tags
* I also noticed that all div2 elements have 1 child - should we remove?

### how to remove all \<p> and \</p> wrapper tags
remove  all the `<p>` and `</p>` wrapper tags by looking up `</?p>` and replacing it with nothing
this allows us to have overlapping pain wrapper elements
### how to remove all \<div2> wrappers
remove all `<div2>` and `</div2>` wrappers by looking up `</?div2>` and replacing it with nothing

## marking pain elements
In the document titled "LibationBearers_XML-noNotes" the pain elements are children of 

## decisions I made about markup
* when referring to the couple, I included the gender of the person who is most important in the play according to who drives the plot forward more and is more important to the story
* The normative value of the character is stagnant for each character throughout the play, the normative value is specifically to describe overall how the character is in the play
* sometimes, the pain wrapper will have two rec elements of the same person because they receive two kinds of pain in the same event
* since the inf element isn't required, I didn't include it unless the inflictor was explicitly mentioned: should we keep this?
* I think that there can be two relations to the receiver of pain from inflictor, but I wrote it as only one type of relationship for each infliction of pain
* 