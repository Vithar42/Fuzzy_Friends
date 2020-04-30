# Fuzzy_Friends
A Fuzzy Logic Based system to determine where some one rates on a friend scale

# Shiny Application
I orginially used matlabs Fuzzy Logic Toolbox to build a Mamdani System.  It is worth being clear this was on the whole be poorly done.  In this repository I'm converting that old set of matlab files into a R Shiny document, so the questions can be answered and results provided live.


# Orginial Email describing the matlab work I created to a friend
This is wholly unnecessary, but done primarily for entertainment purposes.  Also, I have a work thing that I think a fuzzy process might be worth considering, so this is also an exercise in exploring the fuzzy inference process.

To pick a starting point we need to identify what our potential outputs are going to be.  [I'm starting with the 6 groups from this](https://thewisesloth.com/tag/quantifying-friendship/) article.

1. Best Friend
1. Official Friend
1. Allies
1. Regular Acquaintance
1. Loose Acquaintance
1. Stranger
1. loose Adversary
1. Regular Adversary
1. Attacker
1. Official Enemy
1. Nemesis

I added 7 through 11 as they are not part of the article, but nothing says we can't have negative friendships.  I plan for the system to be symmetrical around the Neutral point of Stranger.

I orginially used matlabs Fuzzy Logic Toolbox to build a Mamdani System.  It is worth being clear this was on the whole be poorly done.  In this repository I'm converting that old set of matlab files into a R Shiny document, so the questions can be answered and results provided live.

Now, before we can assign a potential friend on our 9 point scale, we need to develop what criteria will go into our system.  Fuzzy Logic would have us set inputs, then rules for fuzzifying the inputs, the defuzzification process, to output a crisp result.  For our simplicity, our inputs should be things we can ask questions on a Likert-type scale.

1. How frequent do you interact (0-10)
1. How positive/negative are your general interactions (-5 to 5)
1. Do you like this person (-1 to 1)
1. How much of this person's life story do you know? (0-10)
1. Would this person steal from you? (0-5)
1. How much do you trust this person to act in your best interest? (-5 to 5) (-5 you trust this person to actively act against you, 5 you have total trust in the person)
1. How big a loan could you see giving this person (-5 to -5) (-5 they owe you money you want back but don't expect to see, 0 being 0, 5 being over $20k)
1. Given the need for a loan, how large of a gift could you see sharing with this person in need. (0-10) (0 being 0, 10 being over $20k)
1. Do you and this person have a history of shared sacrifices? (-5 to 5) (-5 this person has actively worked to not reciprocate sacrifices or force sacrifices from you, 0 being none, 5 being numerous and significant events)
1. How much do you value this person's opinion on your personal life? (0-10)
1. How willing are you to interact about unpleasant personal situations with this person? (-5 to 5) (-5 being serious concern they would use it against you, 5 being totally open and willing)
1. How emotionally invested do you feel with this person. (-5 top 5) (-5 being you have strong negative emotions, and 5 being you have deep emotional ties)

I was shooting for 10, but 12 isn't to many I supose.  So, these are the criteria I'm defining for friends.  20 would be to many, but feel free to suggest changes to this list, ether adjustments or additions.  I'll summarize each input as 1 word:
1. Frequency (0-10)
 - 3 standard triangle functions covering: 
 - Never, Sometimes, and Often.
  
1. Positivity (-5 to 5)
 - 2 standard triangle functions covering: 
 - Unpleasant and Pleasant

1. Like (0-1)
 - 2 standard triangle functions covering: No and Yes

1. Story (0-10)
 - 3 Gaussian functions (cause the look cooler than triangle functions) covering: 
 - Don't know anything, Know a little, and Know it all.

1. Thef (0-5)
 - 3 trapezoidal functions (just to be different) covering: 
 - No, Maybe, and Definitely

1. Trust (-5 to 5)
 - 2 standard triangle functions covering: 
 - Untrustworthy, Neutral, and Trustworthy

1. Loans (-5 to 5)
 - 3 dsigm functions (difference between two sigmoidal membership functions), it had a plesent and smooth look. covers; 
 - Scammer, meh, and Cosigner

1. Gifts (0-10)
 - 3 Gaussian functions (cause the look cooler than triangle functions) covering: 
 - Never, Small, and Large

1. Sacrifices (-5 to 5)
 - 2 standard triangle functions covering: 
 - Forced and Joint

1. Opinion (0-10)
 - 3 Guasing2 functions (longer and flatter peak, didn't want to not use one) covering: 
 - Don't Care, might have value, Important 

1. Personal (-5 to 5)
 - a mix of zmf, smf, and gaussian functions, it looks like it makes sense, covering: 
 - Will Abuse, meh, and Open and Willing.

1. Emotional (-5 to 5)
 - 3 standard triangle functions covering: 
 - Strong Dislike, None, and Vested

We have to define our 12 output options with similar member functions.  
For simplicity I went with 12 triangle functions. All rules must end with only one output.
Best Friend, Official Friend, Allies, Regular Acquaintance, Loose Acquaintance, Stranger, loose Adversary, Regular Adversary, Attacker, Official Enemy, Nemesis
We can change any of the membership functions, and can use our own custom functions.  The only rule is that for the range defined (0-10, -5 to 5) the function outputs a value of 0 to 1. (can be any range we want)

Next we need rules to fuzzify our inputs. This is a sort of linguistic game that maps our inputs to our "rules" for the fuzzy/defuzzy process.  Compressing the inputs into single words is for simplicity, but part of the linguistic game that will follow.  Before we can actually start the game (I lost the game) we needed to define some membership functions for our output.  Since we have done that, we can start combining the words used as best we would like to define friendship.  So a rule must have at least 1 input and 1 output. A simple example is number 1.  The number (1) that follows the "rule" is the weighting, we can make rules very important, or not very important.  We don't need to hit all the member functions, and we don't need to hit all the inputs, but of course then why have that input.

1. If (Frequency is Never) then (Friendship is stranger) (1)
1. If (Positivity is pleasant) and (Like is Yes) and (Story is not Don't Know Anything) then (Friendship is Loose Acquaintance) (1)
1. If (Theft is Definitely) and (Personal is Will Abuse) then (Friendship is Attacker) (2)
1. More to come...
