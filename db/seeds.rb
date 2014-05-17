# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ title: 'Chicago' }, { title: 'Copenhagen' }])
#   Mayor.create(title: 'Emanuel', city: cities.first)

#Movie.delete_all

movies_arr=[
{title: "Avatar", year: 2009, gross: 760_505_847 },
{title: "Titanic", year: 1997, gross:  658_672_302 },
{title: "The Avengers", year: 2012, gross: 623_279_547 },
{title: "The Dark Knight", year: 2008, gross:  533_316_061 },
{title: "Star Wars: Episode I - The Phantom Menace", year: 1999, gross:  474_544_677 },
{title: "Star Wars", year: 1977, gross:  460_935_665 },
{title: "The Dark Knight Rises", year: 2012, gross:  448_130_642 },
{title: "Shrek 2", year: 2004 , gross: 43_647_1036 },
{title: "E.T. the Extra-Terrestrial", year: 1982, gross: 434_949_459}
]

#Movie.create(movies_arr)

movies = Movie.all 
url = "http://www.omdbapi.com"

movies_arr.each do |movie|  
  
  actor_arr=[]
  title = movie[:title].gsub(" ", "+")
  movie_data = JSON.parse(HTTParty.get(url + "/?t=" + title + "&y=" + movie[:year].to_s))
  actor_arr = movie_data["Actors"].split(", ")
  actor_arr.each do |actor|
    new_actor = Actor.create(name: actor)
    #movie.actors << new_actor
  end
end





# Rank  Title USA Box Office
# 1.  Avatar (2009) $760,505,847
# 2.  Titanic (1997)  $658,672,302
# 3.  The Avengers (2012) $623,279,547
# 4.  The Dark Knight (2008)  $533,316,061
# 5.  Star Wars: Episode I - The Phantom Menace (1999)  $474,544,677
# 6.  Star Wars (1977)  $460,935,665
# 7.  The Dark Knight Rises (2012)  $448,130,642
# 8.  Shrek 2 (2004)  $436,471,036
# 9.  E.T. the Extra-Terrestrial (1982) $434,949,459
# 10. The Hunger Games: Catching Fire (2013)  $424,645,577
# 11. Pirates of the Caribbean: Dead Man's Chest (2006) $423,032,628
# 12. The Lion King (1994)  $422,783,777
# 13. Toy Story 3 (2010)  $414,984,497
# 14. Iron Man 3 (2013) $408,992,272
# 15. The Hunger Games (2012) $407,999,255
# 16. Spider-Man (2002) $403,706,375
# 17. Jurassic Park (1993)  $402,348,347
# 18. Transformers: Revenge of the Fallen (2009)  $402,076,689
# 19. Frozen (2013/I) $400,447,148
# 20. Harry Potter and the Deathly Hallows: Part 2 (2011) $380,955,619
# 21. Finding Nemo (2003) $380,838,870
# 22. Star Wars: Episode III - Revenge of the Sith (2005) $380,262,555
# 23. The Lord of the Rings: The Return of the King (2003)  $377,019,252
# 24. Spider-Man 2 (2004) $373,377,893
# 25. The Passion of the Christ (2004)  $370,270,943
# 26. Despicable Me 2 (2013)  $368,049,635
# 27. Transformers: Dark of the Moon (2011) $352,358,779
# 28. The Lord of the Rings: The Two Towers (2002)  $340,478,898
# 29. Spider-Man 3 (2007) $336,530,303
# 30. Alice in Wonderland (2010/I)  $334,185,206
# 31. Forrest Gump (1994) $329,691,196
# 32. Shrek the Third (2007)  $320,706,665
# 33. Transformers (2007) $318,759,914
# 34. Iron Man (2008) $318,298,180
# 35. Harry Potter and the Sorcerer's Stone (2001)  $317,557,891
# 36. Indiana Jones and the Kingdom of the Crystal Skull (2008) $317,011,114
# 37. The Lord of the Rings: The Fellowship of the Ring (2001)  $313,837,577
# 38. Iron Man 2 (2010) $312,057,433
# 39. Star Wars: Episode II - Attack of the Clones (2002) $310,675,583
# 40. Pirates of the Caribbean: At World's End (2007) $309,404,152
# 41. Star Wars: Episode VI - Return of the Jedi (1983) $309,125,409
# 42. Independence Day (1996) $306,124,059
# 43. Pirates of the Caribbean: The Curse of the Black Pearl (2003) $305,388,685
# 44. Skyfall (2012)  $304,360,277
# 45. The Hobbit: An Unexpected Journey (2012)  $303,001,229
# 46. Harry Potter and the Half-Blood Prince (2009) $301,956,980
# 47. The Twilight Saga: Eclipse (2010) $300,523,113
# 48. The Twilight Saga: New Moon (2009)  $296,623,634
# 49. Harry Potter and the Deathly Hallows: Part 1 (2010) $294,980,434
# 50. The Sixth Sense (1999)  $293,501,675
# 51. Up (2009) $292,979,556
# 52. Inception (2010)  $292,568,851
# 53. The Twilight Saga: Breaking Dawn - Part 2 (2012)  $292,298,923
# 54. Harry Potter and the Order of the Phoenix (2007)  $292,000,866
# 55. The Chronicles of Narnia: The Lion, the Witch and the Wardrobe (2005) $291,709,845
# 56. Man of Steel (2013) $291,021,565
# 57. Star Wars: Episode V - The Empire Strikes Back (1980) $290,158,751
# 58. Harry Potter and the Goblet of Fire (2005)  $289,994,397
# 59. Monsters, Inc. (2001) $289,907,418
# 60. Home Alone (1990) $285,761,243
# 61. The Matrix Reloaded (2003)  $281,492,479
# 62. The Twilight Saga: Breaking Dawn - Part 1 (2011)  $281,275,991
# 63. Meet the Fockers (2004) $279,167,575
# 64. The Hangover (2009) $277,313,371
# 65. Gravity (2013)  $274,084,951
# 66. Monsters University (2013)  $268,488,329
# 67. Shrek (2001)  $267,652,016
# 68. The Amazing Spider-Man (2012) $262,030,663
# 69. Harry Potter and the Chamber of Secrets (2002)  $261,970,615
# 70. The Incredibles (2004)  $261,437,578
# 71. How the Grinch Stole Christmas (2000) $260,031,035
# 72. Jaws (1975) $260,000,000
# 73. The Hobbit: The Desolation of Smaug (2013)  $258,355,354
# 74. Star Trek (2009)  $257,704,099
# 75. I Am Legend (2007)  $256,386,216
# 76. The Blind Side (2009) $255,950,375
# 77. The Hangover Part II (2011) $254,455,986
# 78. The Lego Movie (2014) $253,666,490
# 79. Despicable Me (2010)  $251,501,645
# 80. Batman (1989) $251,188,924
# 81. Night at the Museum (2006)  $250,863,268
# 82. Men in Black (1997) $250,147,615
# 83. Harry Potter and the Prisoner of Azkaban (2004) $249,358,727
# 84. Captain America: The Winter Soldier (2014)  $246,043,328
# 85. Toy Story 2 (1999)  $245,823,397
# 86. Cars (2006) $244,052,771
# 87. Bruce Almighty (2003) $242,589,580
# 88. Raiders of the Lost Ark (1981)  $242,374,454
# 89. Twister (1996)  $241,688,385
# 90. My Big Fat Greek Wedding (2002) $241,437,427
# 91. Pirates of the Caribbean: On Stranger Tides (2011)  $241,063,875
# 92. Fast & Furious 6 (2013) $238,673,370
# 93. Ghostbusters (1984) $238,632,124
# 94. Shrek Forever After (2010)  $238,371,987
# 95. Brave (2012)  $237,282,182
# 96. Oz the Great and Powerful (2013)  $234,903,076
# 97. Beverly Hills Cop (1984)  $234,760,500
# 98. X-Men: The Last Stand (2006)  $234,360,014
# 99. War of the Worlds (2005)  $234,277,056
# 100.  Cast Away (2000)  $233,630,478
# 101.  The Lost World: Jurassic Park (1997)  $229,074,524
# 102.  Star Trek Into Darkness (2013)  $228,756,232
# 103.  Signs (2002)  $227,965,690
# 104.  Hancock (2008)  $227,946,274
# 105.  The Bourne Ultimatum (2007) $227,225,045
# 106.  Rush Hour 2 (2001)  $226,138,454
# 107.  WALL·E (2008) $223,806,889
# 108.  National Treasure: Book of Secrets (2007) $219,961,501
# 109.  Alvin and the Chipmunks: The Squeakquel (2009)  $219,613,391
# 110.  Mrs. Doubtfire (1993) $219,200,000
# 111.  Beauty and the Beast (1991) $218,967,620
# 112.  Ted (2012)  $218,628,680
# 113.  King Kong (2005)  $218,051,260
# 114.  Ghost (1990)  $217,631,306
# 115.  The Da Vinci Code (2006)  $217,536,138
# 116.  How to Train Your Dragon (2010) $217,387,997
# 117.  Aladdin (1992)  $217,350,219
# 118.  Alvin and the Chipmunks (2007)  $217,326,336
# 119.  Madagascar 3: Europe's Most Wanted (2012) $216,366,733
# 120.  Saving Private Ryan (1998)  $216,119,491
# 121.  Mission: Impossible II (2000) $215,397,307
# 122.  Kung Fu Panda (2008)  $215,395,021
# 123.  X2 (2003) $214,948,780
# 124.  The Lorax (2012)  $213,949,505
# 125.  Austin Powers in Goldmember (2002)  $213,079,163
# 126.  Back to the Future (1985) $210,609,762
# 127.  300 (2006)  $210,592,590
# 128.  Fast Five (2011)  $209,805,005
# 129.  Mission: Impossible - Ghost Protocol (2011) $209,364,921
# 130.  Wedding Crashers (2005) $209,218,368
# 131.  Sherlock Holmes (2009)  $209,019,489
# 132.  Charlie and the Chocolate Factory (2005)  $206,456,431
# 133.  Ratatouille (2007)  $206,435,493
# 134.  Thor: The Dark World (2013) $206,360,018
# 135.  Austin Powers: The Spy Who Shagged Me (1999)  $205,399,422
# 136.  Batman Begins (2005)  $205,343,774
# 137.  Terminator 2: Judgment Day (1991) $204,843,350
# 138.  The Exorcist (1973) $204,565,000
# 139.  World War Z (2013)  $202,351,611
# 140.  The Mummy Returns (2001)  $202,007,640
# 141.  Armageddon (1998) $201,573,391
# 142.  Tangled (2010)  $200,807,262
# 143.  Superman Returns (2006) $200,069,408
# 144.  Gone with the Wind (1939) $198,655,278
# 145.  Pearl Harbor (2001) $198,539,855
# 146.  Monsters vs. Aliens (2009)  $198,332,128
# 147.  Happy Feet (2006) $197,992,827
# 148.  Indiana Jones and the Last Crusade (1989) $197,171,806
# 149.  Ice Age: Dawn of the Dinosaurs (2009) $196,573,705
# 150.  Ice Age: The Meltdown (2006)  $195,329,763
# 151.  Madagascar (2005) $193,136,719
# 152.  Toy Story (1995)  $191,796,233
# 153.  Cars 2 (2011) $191,450,875
# 154.  Twilight (2008/I) $191,449,475
# 155.  Men in Black II (2002)  $190,418,803
# 156.  Wreck-It Ralph (2012) $189,412,677
# 157.  Gladiator (2000)  $187,670,866
# 158.  Sherlock Holmes: A Game of Shadows (2011) $187,573,200
# 159.  The Croods (2013) $187,165,546
# 160.  The Day After Tomorrow (2004) $186,739,919
# 161.  Mr. & Mrs. Smith (2005) $186,336,103
# 162.  Snow White and the Seven Dwarfs (1937)  $184,925,485
# 163.  Dances with Wolves (1990) $184,208,848
# 164.  Batman Forever (1995) $184,031,112
# 165.  The Fugitive (1993) $183,875,760
# 166.  Ocean's Eleven (2001) $183,405,771
# 167.  The Simpsons Movie (2007) $183,132,370
# 168.  What Women Want (2000)  $182,805,123
# 169.  The Perfect Storm (2000)  $182,618,434
# 170.  Lincoln (2012)  $182,204,440
# 171.  Liar Liar (1997)  $181,395,380
# 172.  Grease (1978) $181,360,000
# 173.  Jurassic Park III (2001)  $181,166,115
# 174.  Thor (2011) $181,015,141
# 175.  Mission: Impossible (1996)  $180,965,237
# 176.  Planet of the Apes (2001) $180,011,740
# 177.  Madagascar: Escape 2 Africa (2008)  $179,982,968
# 178.  X-Men Origins: Wolverine (2009) $179,883,016
# 179.  Indiana Jones and the Temple of Doom (1984) $179,870,271
# 180.  Top Gun (1986)  $179,767,866
# 181.  Men in Black 3 (2012) $179,020,854
# 182.  Pretty Woman (1990) $178,406,268
# 183.  Hitch (2005/I)  $177,575,142
# 184.  Night at the Museum: Battle of the Smithsonian (2009) $177,243,721
# 185.  Tootsie (1982)  $177,200,000
# 186.  Rise of the Planet of the Apes (2011) $176,740,650
# 187.  Captain America: The First Avenger (2011) $176,636,816
# 188.  The Polar Express (2004)  $176,610,096
# 189.  The Karate Kid (2010) $176,591,618
# 190.  There's Something About Mary (1998) $176,483,808
# 191.  Ice Age (2002)  $176,387,405
# 192.  The Bourne Supremacy (2004) $176,049,130
# 193.  Crocodile Dundee (1986) $174,635,000
# 194.  Home Alone 2: Lost in New York (1992) $173,585,516
# 195.  Elf (2003)  $173,381,405
# 196.  National Treasure (2004)  $173,005,002
# 197.  Rain Man (1988) $172,825,435
# 198.  Air Force One (1997)  $172,620,724
# 199.  Apollo 13 (1995)  $172,071,312
# 200.  TRON: Legacy (2010) $172,051,787
# 201.  The Matrix (1999) $171,383,253
# 202.  Tarzan (1999) $171,085,177
# 203.  True Grit (2010)  $171,031,347
# 204.  A Beautiful Mind (2001) $170,708,996
# 205.  Chicago (2002)  $170,684,505
# 206.  The Help (2011) $169,705,587
# 207.  Bridesmaids (2011/I)  $169,076,745
# 208.  Quantum of Solace (2008)  $168,368,427
# 209.  Wild Hogs (2007)  $168,213,584
# 210.  3 Men and a Baby (1987) $167,780,960
# 211.  Casino Royale (2006)  $167,007,184
# 212.  Meet the Parents (2000) $166,225,040
# 213.  2012 (2009/I) $166,112,167
# 214.  Robin Hood: Prince of Thieves (1991)  $165,500,000
# 215.  Kung Fu Panda 2 (2011)  $165,230,261
# 216.  Hannibal (2001) $165,091,464
# 217.  Catch Me If You Can (2002)  $164,435,221
# 218.  The Proposal (2009/I) $163,947,053
# 219.  Big Daddy (1999)  $163,479,795
# 220.  The Sound of Music (1965) $163,214,286
# 221.  Clash of the Titans (2010)  $163,192,114
# 222.  Batman Returns (1992) $162,831,698
# 223.  Django Unchained (2012) $162,804,648
# 224.  A Bug's Life (1998) $162,792,677
# 225.  The Pursuit of Happyness (2006) $162,586,036
# 226.  Grown Ups (2010)  $162,001,186
# 227.  The Waterboy (1998) $161,487,252
# 228.  Ice Age: Continental Drift (2012) $161,317,423
# 229.  Shark Tale (2004) $160,762,022
# 230.  Die Another Day (2002)  $160,201,106
# 231.  The Sting (1973)  $159,600,000
# 232.  The Heat (2013/I) $159,578,352
# 233.  The Firm (1993) $158,348,400
# 234.  The Longest Yard (2005) $158,115,031
# 235.  X-Men (2000)  $157,299,717
# 236.  Scary Movie (2000)  $156,997,084
# 237.  Fatal Attraction (1987) $156,645,693
# 238.  What Lies Beneath (2000)  $155,370,362
# 239.  The Mummy (1999)  $155,247,825
# 240.  Snow White and the Huntsman (2012)  $155,111,815
# 241.  Fast & Furious (2009) $155,022,220
# 242.  Over the Hedge (2006) $155,019,340
# 243.  Fantastic Four (2005/I) $154,695,569
# 244.  Horton Hears a Who! (2008)  $154,529,187
# 245.  Who Framed Roger Rabbit (1988)  $154,222,492
# 246.  Beverly Hills Cop II (1987) $153,665,036
# 247.  Jerry Maguire (1996)  $153,620,822
# 248.  Scooby-Doo (2002) $153,288,182
# 249.  101 Dalmatians (1961) $153,000,000
# 250.  Sex and the City (2008) $152,637,269
# 251.  Runaway Bride (1999)  $152,149,590
# 252.  The Amazing Spider-Man 2 (2014) $151,360,994
# 253.  Rambo: First Blood Part II (1985) $150,415,432
# 254.  We're the Millers (2013)  $150,368,971
# 255.  Terminator 3: Rise of the Machines (2003) $150,350,192
# 256.  G.I. Joe: The Rise of Cobra (2009)  $150,167,630
# 257.  American Hustle (2013)  $150,117,807
# 258.  Puss in Boots (2011)  $149,234,747
# 259.  Les Misérables (2012) $148,775,460
# 260.  Knocked Up (2007) $148,734,225
# 261.  Little Fockers (2010) $148,383,780
# 262.  Megamind (2010) $148,337,537
# 263.  Hotel Transylvania (2012) $148,313,048
# 264.  Talladega Nights: The Ballad of Ricky Bobby (2006)  $148,213,377
# 265.  Gremlins (1984) $148,170,000
# 266.  Gran Torino (2008)  $148,085,755
# 267.  As Good as It Gets (1997) $147,637,474
# 268.  Lethal Weapon 2 (1989)  $147,253,986
# 269.  X-Men: First Class (2011) $146,405,371
# 270.  Paul Blart: Mall Cop (2009) $146,336,178
# 271.  True Lies (1994)  $146,282,411
# 272.  Lilo & Stitch (2002)  $145,771,527
# 273.  Divergent (2014)  $145,202,818
# 274.  American Pie 2 (2001) $145,096,820
# 275.  Taken (2008/I)  $145,000,989
# 276.  The Santa Clause (1994) $144,833,357
# 277.  The Great Gatsby (2013) $144,812,796
# 278.  I, Robot (2004) $144,795,350
# 279.  Lethal Weapon 3 (1992)  $144,731,527
# 280.  The Fast and the Furious (2001) $144,512,310
# 281.  Doctor Dolittle (1998)  $144,156,464
# 282.  Mamma Mia! (2008) $143,704,210
# 283.  Rio (2011)  $143,618,384
# 284.  Juno (2007) $143,492,840
# 285.  Marley & Me (2008)  $143,151,473
# 286.  The Smurfs (2011) $142,614,158
# 287.  The Jungle Book (1967)  $141,843,612
# 288.  The Chronicles of Narnia: Prince Caspian (2008) $141,614,023
# 289.  Animal House (1978) $141,600,000
# 290.  Pocahontas (1995) $141,600,000
# 291.  A Few Good Men (1992) $141,340,178
# 292.  Slumdog Millionaire (2008)  $141,319,195
# 293.  xXx (2002)  $141,204,016
# 294.  Rush Hour (1998)  $141,153,686
# 295.  Cowboys & Aliens (2011) $140,555,209
# 296.  The Blair Witch Project (1999)  $140,530,114
# 297.  Deep Impact (1998)  $140,459,099
# 298.  Look Who's Talking (1989) $140,088,813
# 299.  Rush Hour 3 (2007)  $140,080,850
# 300.  Stuart Little (1999)  $140,015,224
# 301.  The Rocky Horror Picture Show (1975)  $139,876,417
# 302.  Taken 2 (2012)  $139,852,971
# 303.  Sister Act (1992) $139,610,000
# 304.  The Matrix Revolutions (2003) $139,259,759
# 305.  The Santa Clause 2 (2002) $139,225,854
# 306.  The King's Speech (2010)  $138,795,342
# 307.  Cheaper by the Dozen (2003) $138,614,544
# 308.  21 Jump Street (2012) $138,447,667
# 309.  Bad Boys II (2003)  $138,396,624
# 310.  Good Will Hunting (1997)  $138,339,411
# 311.  Platoon (1986)  $137,963,328
# 312.  A Christmas Carol (2009)  $137,850,096
# 313.  Dinosaur (2000) $137,748,063
# 314.  The Conjuring (2013)  $137,387,272
# 315.  Click (2006)  $137,340,146
# 316.  The Green Mile (1999) $136,801,374
# 317.  Ransom (1996) $136,448,821
# 318.  101 Dalmatians (1996) $136,182,161
# 319.  Godzilla (1998/I) $136,023,813
# 320.  Argo (2012) $136,019,448
# 321.  Chicken Little (2005) $135,381,507
# 322.  Teenage Mutant Ninja Turtles (1990) $135,270,000
# 323.  Patch Adams (1998)  $135,014,968
# 324.  The Godfather (1972)  $134,821,952
# 325.  Wanted (2008) $134,568,845
# 326.  Live Free or Die Hard (2007)  $134,520,804
# 327.  The Incredible Hulk (2008)  $134,518,390
# 328.  Identity Thief (2013) $134,455,175
# 329.  Superman (1978) $134,218,018
# 330.  Ride Along (2014) $134,141,530
# 331.  The Rock (1996) $134,006,721
# 332.  Anger Management (2003) $133,756,285
# 333.  Grown Ups 2 (2013)  $133,668,525
# 334.  Mission: Impossible III (2006)  $133,382,309
# 335.  Angels & Demons (2009)  $133,375,846
# 336.  Troy (2004) $133,228,348
# 337.  Alvin and the Chipmunks: Chipwrecked (2011) $133,103,929
# 338.  The Wolverine (2013)  $132,550,960
# 339.  Bringing Down the House (2003)  $132,541,238
# 340.  The Departed (2006) $132,373,442
# 341.  Hulk (2003) $132,122,995
# 342.  Silver Linings Playbook (2012)  $132,088,910
# 343.  Minority Report (2002)  $132,014,112
# 344.  Fantastic 4: Rise of the Silver Surfer (2007) $131,920,333
# 345.  The Last Airbender (2010) $131,564,731
# 346.  Lara Croft: Tomb Raider (2001)  $131,144,183
# 347.  The Silence of the Lambs (1991) $130,727,000
# 348.  Honey, I Shrunk the Kids (1989) $130,724,200
# 349.  The Flintstones (1994)  $130,512,915
# 350.  Get Smart (2008)  $130,313,314
# 351.  American Gangster (2007)  $130,127,620
# 352.  American Beauty (1999)  $130,058,047
# 353.  An Officer and a Gentleman (1982) $129,795,554
# 354.  Lethal Weapon 4 (1998)  $129,734,803
# 355.  The Nutty Professor (1996)  $128,769,345
# 356.  The Ring (2002) $128,579,698
# 357.  Borat: Cultural Learnings of America for Make Benefit Glorious Nation of Kazakhstan (2006)  $128,505,958
# 358.  Close Encounters of the Third Kind (1977) $128,300,000
# 359.  Robots (2005) $128,200,012
# 360.  Coming to America (1988)  $128,152,301
# 361.  Crouching Tiger, Hidden Dragon (2000) $128,067,808
# 362.  Shutter Island (2010) $127,968,405
# 363.  Rocky IV (1985) $127,900,000
# 364.  Enchanted (2007)  $127,706,877
# 365.  The Curious Case of Benjamin Button (2008)  $127,490,802
# 366.  Sweet Home Alabama (2002) $127,214,072
# 367.  Dumb & Dumber (1994)  $127,175,354
# 368.  2 Fast 2 Furious (2003) $127,083,765
# 369.  Super 8 (2011)  $126,975,169
# 370.  The World Is Not Enough (1999)  $126,930,660
# 371.  My Best Friend's Wedding (1997) $126,805,112
# 372.  Smokey and the Bandit (1977)  $126,737,428
# 373.  Sleepless in Seattle (1993) $126,670,704
# 374.  Bee Movie (2007)  $126,597,121
# 375.  Anchorman 2: The Legend Continues (2013)  $126,527,201
# 376.  Prometheus (2012/I) $126,464,904
# 377.  Mr. Deeds (2002)  $126,203,320
# 378.  Safe House (2012) $126,149,655
# 379.  The Truman Show (1998)  $125,603,360
# 380.  Erin Brockovich (2000)  $125,548,685
# 381.  Ocean's Twelve (2004) $125,531,634
# 382.  Tomorrow Never Dies (1997)  $125,332,007
# 383.  Terminator Salvation (2009) $125,320,003
# 384.  Charlie's Angels (2000) $125,305,545
# 385.  Lone Survivor (2013)  $125,069,696
# 386.  The Vow (2012)  $125,014,030
# 387.  Life of Pi (2012) $124,976,634
# 388.  Cloudy with a Chance of Meatballs (2009)  $124,870,275
# 389.  The Devil Wears Prada (2006)  $124,732,962
# 390.  Something's Gotta Give (2003) $124,590,960
# 391.  Traffic (2000)  $124,107,476
# 392.  City Slickers (1991)  $124,033,791
# 393.  The Birdcage (1996) $123,986,682
# 394.  Good Morning, Vietnam (1987)  $123,922,370
# 395.  Nutty Professor II: The Klumps (2000) $123,307,945
# 396.  Rango (2011)  $123,207,194
# 397.  Rocky III (1982)  $122,823,200
# 398.  G.I. Joe: Retaliation (2013)  $122,512,052
# 399.  Clear and Present Danger (1994) $122,012,710
# 400.  The Hunt for Red October (1990) $122,012,643
# 401.  The Bodyguard (1992)  $121,945,720
# 402.  Wayne's World (1992)  $121,697,350
# 403.  The Bourne Identity (2002)  $121,468,960
# 404.  Superbad (2007) $121,463,226
# 405.  Speed (1994)  $121,248,145
# 406.  50 First Dates (2004) $120,776,832
# 407.  Mulan (1998)  $120,618,403
# 408.  Inglourious Basterds (2009) $120,523,073
# 409.  Seabiscuit (2003) $120,147,445
# 410.  Four Christmases (2008) $120,136,047
# 411.  Van Helsing (2004)  $120,025,245
# 412.  The Mask (1994) $119,938,730
# 413.  Cloudy with a Chance of Meatballs 2 (2013)  $119,793,567
# 414.  I Now Pronounce You Chuck & Larry (2007)  $119,684,970
# 415.  Hook (1991) $119,654,900
# 416.  Walk the Line (2005)  $119,518,352
# 417.  Blazing Saddles (1974)  $119,500,000
# 418.  G-Force (2009)  $119,420,252
# 419.  Total Recall (1990) $119,412,921
# 420.  On Golden Pond (1981) $119,285,432
# 421.  The Other Guys (2010) $119,219,978
# 422.  Fahrenheit 9/11 (2004)  $119,078,393
# 423.  Hairspray (2007)  $118,823,091
# 424.  The Break-Up (2006) $118,683,135
# 425.  Lemony Snicket's A Series of Unfortunate Events (2004)  $118,627,117
# 426.  Back to the Future Part II (1989) $118,500,000
# 427.  The Sum of All Fears (2002) $118,471,320
# 428.  Salt (2010) $118,311,368
# 429.  Blades of Glory (2007)  $118,153,533
# 430.  Basic Instinct (1992) $117,727,224
# 431.  Now You See Me (2013/I) $117,698,894
# 432.  Big Momma's House (2000)  $117,559,438
# 433.  Die Hard 2 (1990) $117,541,000
# 434.  Horrible Bosses (2011)  $117,528,646
# 435.  Rocky (1976)  $117,235,247
# 436.  Jackass 3D (2010) $117,224,271
# 437.  Ocean's Thirteen (2007) $117,144,465
# 438.  The Wolf of Wall Street (2013)  $116,866,727
# 439.  Double Jeopardy (1999)  $116,735,231
# 440.  8 Mile (2002) $116,724,075
# 441.  S.W.A.T. (2003) $116,643,346
# 442.  Lee Daniels' The Butler (2013/I)  $116,631,310
# 443.  Green Lantern (2011)  $116,593,191
# 444.  Notting Hill (1999) $116,006,080
# 445.  The Towering Inferno (1974) $116,000,000
# 446.  Ghost Rider (2007)  $115,802,596
# 447.  You've Got Mail (1998)  $115,731,542
# 448.  Remember the Titans (2000)  $115,648,585
# 449.  District 9 (2009) $115,646,235
# 450.  The Karate Kid, Part II (1986)  $115,103,979
# 451.  American Graffiti (1973)  $115,000,000
# 452.  Big (1988)  $114,968,774
# 453.  Dodgeball: A True Underdog Story (2004) $114,324,072
# 454.  The Village (2004)  $114,195,633
# 455.  Bolt (2008) $114,053,579
# 456.  Wild Wild West (1999) $113,745,408
# 457.  Magic Mike (2012) $113,709,992
# 458.  Rio 2 (2014)  $113,662,132
# 459.  The Addams Family (1991)  $113,502,246
# 460.  The Patriot (2000)  $113,330,342
# 461.  The Bourne Legacy (2012)  $113,165,635
# 462.  The Pacifier (2005) $113,006,880
# 463.  Dr. Dolittle 2 (2001) $112,950,721
# 464.  It's Complicated (2009) $112,703,470
# 465.  Spy Kids (2001) $112,692,062
# 466.  Ghostbusters II (1989)  $112,494,738
# 467.  Face/Off (1997) $112,225,777
# 468.  The Hangover Part III (2013)  $112,186,625
# 469.  One Flew Over the Cuckoo's Nest (1975)  $112,000,000
# 470.  Twins (1988)  $111,936,400
# 471.  Spy Kids 3-D: Game Over (2003)  $111,760,631
# 472.  Doctor Zhivago (1965) $111,722,000
# 473.  Enemy of the State (1998) $111,544,445
# 474.  The Last Samurai (2003) $111,110,575
# 475.  Valentine's Day (2010/I)  $110,476,776
# 476.  Tropic Thunder (2008) $110,416,702
# 477.  Fun with Dick and Jane (2005) $110,332,737
# 478.  Freaky Friday (2003)  $110,222,438
# 479.  The Grudge (2004) $110,175,871
# 480.  Scary Movie 3 (2003)  $110,000,082
# 481.  Bedtime Stories (2008)  $109,993,847
# 482.  The Little Mermaid (1989) $109,859,444
# 483.  Star Trek IV: The Voyage Home (1986)  $109,713,132
# 484.  Crocodile Dundee II (1988)  $109,306,210
# 485.  The 40-Year-Old Virgin (2005) $109,243,478
# 486.  Couples Retreat (2009)  $109,176,215
# 487.  Mr. Peabody & Sherman (2014)  $108,923,914
# 488.  A Time to Kill (1996) $108,706,165
# 489.  Black Hawk Down (2001)  $108,638,745
# 490.  Terms of Endearment (1983)  $108,423,489
# 491.  Ace Ventura: When Nature Calls (1995) $108,360,000
# 492.  The Princess Diaries (2001) $108,244,774
# 493.  Superman II (1980)  $108,200,000
# 494.  Hop (2011)  $108,012,170
# 495.  Pulp Fiction (1994) $107,930,000
# 496.  Paranormal Activity (2007)  $107,917,283
# 497.  Epic (2013) $107,515,297
# 498.  Watchmen (2009) $107,503,316
# 499.  A League of Their Own (1992)  $107,458,785
# 500.  Batman & Robin (1997) $107,285,004
# 501.  Captain Phillips (2013) $107,100,855
# 502.  Black Swan (2010) $106,952,327
# 503.  Miss Congeniality (2000)  $106,807,667
# 504.  Chicken Run (2000)  $106,793,915
# 505.  Analyze This (1999) $106,694,016
# 506.  GoldenEye (1995)  $106,635,996
# 507.  Indecent Proposal (1993)  $106,614,100
# 508.  Driving Miss Daisy (1989) $106,593,296
# 509.  Love Story (1970) $106,400,000
# 510.  Kramer vs. Kramer (1979)  $106,300,000
# 511.  300: Rise of an Empire (2014) $106,170,469
# 512.  The Italian Job (2003)  $106,126,012
# 513.  Every Which Way But Loose (1978)  $105,918,400
# 514.  How to Lose a Guy in 10 Days (2003) $105,807,520
# 515.  Porky's (1982)  $105,500,000
# 516.  The First Wives Club (1996) $105,444,419
# 517.  Interview with the Vampire: The Vampire Chronicles (1994) $105,264,608
# 518.  George of the Jungle (1997) $105,263,257
# 519.  Robin Hood (2010) $105,219,735
# 520.  Phenomenon (1996) $104,632,573
# 521.  The Graduate (1967) $104,397,102
# 522.  The Chronicles of Narnia: The Voyage of the Dawn Treader (2010) $104,383,624
# 523.  The Princess and the Frog (2009)  $104,374,107
# 524.  American Wedding (2003) $104,354,205
# 525.  Daddy Day Care (2003) $104,148,781
# 526.  Road to Perdition (2002)  $104,054,514
# 527.  Paranormal Activity 3 (2011)  $104,007,828
# 528.  Journey 2: The Mysterious Island (2012) $103,812,241
# 529.  Dick Tracy (1990) $103,738,726
# 530.  Rise of the Guardians (2012)  $103,400,692
# 531.  Dreamgirls (2006) $103,338,338
# 532.  Nine to Five (1980) $103,290,500
# 533.  Just Go with It (2011)  $103,028,109
# 534.  Scream (1996) $103,001,286
# 535.  The Expendables (2010)  $102,981,571
# 536.  Jaws 2 (1978) $102,922,376
# 537.  Bambi (1942)  $102,797,150
# 538.  The General's Daughter (1999) $102,678,089
# 539.  The Aviator (2004)  $102,608,827
# 540.  Daredevil (2003)  $102,543,518
# 541.  The Girl with the Dragon Tattoo (2011)  $102,515,793
# 542.  In the Line of Fire (1993)  $102,314,283
# 543.  Butch Cassidy and the Sundance Kid (1969) $102,308,900
# 544.  Mary Poppins (1964) $102,300,000
# 545.  The Mummy: Tomb of the Dragon Emperor (2008)  $102,176,165
# 546.  Jackass Presents: Bad Grandpa (2013)  $101,978,840
# 547.  Pacific Rim (2013)  $101,785,482
# 548.  American Pie (1999) $101,736,215
# 549.  Journey to the Center of the Earth (2008) $101,702,060
# 550.  Gone in Sixty Seconds (2000)  $101,643,008
# 551.  Maverick (1994) $101,631,272
# 552.  Sleeping with the Enemy (1991)  $101,580,000
# 553.  Stir Crazy (1980) $101,500,000
# 554.  This Is the End (2013)  $101,470,202
# 555.  Scream 2 (1997) $101,334,374
# 556.  Eraser (1996) $101,228,120
# 557.  The Prince of Egypt (1998)  $101,217,900
# 558.  Unforgiven (1992) $101,157,447
# 559.  Eagle Eye (2008)  $101,111,837
# 560.  Con Air (1997)  $101,087,161
# 561.  Sleepy Hollow (1999)  $101,068,340
# 562.  Contact (1997)  $100,853,835
# 563.  The Pelican Brief (1993)  $100,768,056
# 564.  Charlie's Angels: Full Throttle (2003)  $100,685,880
# 565.  Vanilla Sky (2001)  $100,614,858
# 566.  The Rugrats Movie (1998)  $100,491,683
# 567.  Airport (1970)  $100,489,150
# 568.  Step Brothers (2008)  $100,468,793
# 569.  Due Date (2010) $100,448,498
# 570.  Dr. Seuss' The Cat in the Hat (2003)  $100,446,895
# 571.  Million Dollar Baby (2004)  $100,422,786
# 572.  Casper (1995) $100,328,194
# 573.  Bad Teacher (2011)  $100,292,856
# 574.  Evan Almighty (2007)  $100,289,690
# 575.  Shakespeare in Love (1998)  $100,241,322
# 576.  Jumanji (1995)  $100,200,000
# 577.  Yogi Bear (2010)  $100,169,068
# 578.  Se7en (1995)  $100,125,340
# 579.  The Hunchback of Notre Dame (1996)  $100,117,603
# 580.  Parenthood (1989) $100,050,000
# 581.  You Don't Mess with the Zohan (2008)  $100,018,837
# 582.  Die Hard: With a Vengeance (1995) $100,012,500
# 583.  Collateral (2004) $100,003,492









