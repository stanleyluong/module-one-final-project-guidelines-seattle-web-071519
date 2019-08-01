class Game
    
    def relationship_status
        if rel.points == (90..99)
            puts "#{rel.npc.name} regards you as soulmate."
        elsif rel.points == (80..89)
            puts "#{rel.npc.name} looks upon you warmly."
        elsif rel.points == (70..79)
            puts "#{rel.npc.name} kindly considers you."
        elsif rel.points == (60..69)
            puts "#{rel.npc.name} judges you amiably."
        elsif rel.points == (50..59)
            puts "#{rel.npc.name} regards you indifferently."
        elsif rel.points == (40..49)
            puts "#{rel.npc.name} looks your way apprehensively."
        elsif rel.points == (30..39)
            puts "#{rel.npc.name} glowers at you dubiously."
        elsif rel.points == (20..29)
            puts "#{rel.npc.name} glares at you threateningly!"
        else 
            puts "#{rel.npc.name} scowls at you ready to attack!"
        end
    end

    
    def walk_into_a_bar
        puts "A familiar face at the bar greets you. \"Hey, long time no see! What was your name again?\""
        $name = STDIN.gets.chomp.capitalize
        user = User.find_by(username: $name)
        if user != nil
            puts "\"Oh yeah... #{$name}! Welcome Back!\""
        else 
            puts "Oh yeah... #{$name}! Nice to meet you!"
            user = User.create(username: $name)
        end

        puts "You look around the room and make eye contact with a hottie. Your friend notices and says, \"You should go talk to that hottie over there.\""

        npc = Npc.all.sample 
        puts "You see #{npc.name}"   
        
        rel = Relationship.find_by(user: user, npc: npc)
        # puts rel
        # puts rel.points

        if rel == nil
            puts "You've never met. Go introduce yourself."
            rel = Relationship.create(user: user, npc: npc, points: 50)
        else 
            relationship_status
        end

        go_over(rel)
    end

    def go_over(rel)
        
        puts "1) Go over and talk to #{rel.npc.name} 2) Run away."
        action = STDIN.gets.chomp
        if action == "1"
            puts "You start walking in #{rel.npc.name}'s direction when someone approaches them first. What do you do?"
            enter_conversation(rel)        
        elsif action == "2"
            puts "GAME OVER!" 
            puts "Fortune favors the bold. -Virgil"
        else 
            puts "Just be yourself."
            puts "Pick again"
            go_over(rel)
        end
    end

    def enter_conversation(rel)
        puts "1) Enter their conversation. 2) Sucker punch competition in the face."
        action = STDIN.gets.chomp
        if action == "1"
            puts "You say \"Looks like the party is over here!\""
            puts "The #{rel.npc.name} laughs and smiles. The competition frowns."
            rel.points += 10
            rel.save    
            relationship_status
            conversate(rel)
        elsif action == "2" 
            puts "The bouncers restrain you, beat you up, and throw you out into the alleyway."
            puts "\"Holding on to anger is like grasping a hot coal with the intent of throwing it at someone else; you are the one who gets burned.\" -Buddha" 
            puts "GAME OVER!"
            rel.points -= 27
            rel.save 
            relationship_status
            walk_into_a_bar(rel)
        else 
            puts "Just be yourself."
            puts "Pick again"
            enter_conversation(rel)
        end
    end

    def conversate(rel)
        puts "1) Use pickup line. 2) Insult."
        action = STDIN.gets.chomp
        if action == "1"
            puts "You say #{API.pickupline}"
            puts "#{rel.npc.name} is delighted. In the face of superior game, the competition surrenders and retreats."
            relationship_status
            introductions(rel)
        elsif action == "2"
            puts "GAME OVER!"
            puts "An injury is much sooner forgotten than an insult. -Philip Stanhope, 4th Earl of Chesterfield"
            relationship_status
            rel.points -= 25
            rel.save
            walk_into_a_bar(rel)
        else 
            puts "Just be yourself."
            puts "Pick again"
            conversate(rel)
        end
    end

    def introductions(rel)
        puts "1) Introduce yourself. 2) Ask for phone number."
        action = STDIN.gets.chomp
        if action == "1"
            puts "You say \"Hey I'm #{$name.capitalize}\""
            puts "#{rel.npc.name}  says \"Hey I'm #{rel.npc.name} . It's hot in here...\""
            rel.points += 10
            relationship_status
            rel.save
            step5
        elsif action == "2"
            puts "GAME OVER!"
            puts "\"Don't talk to strangers.\" -Mom & Dad"
            intro
        else 
            puts "Just be yourself."
            puts "Pick again"
            step4
        end
    end

    def step5
        
        puts "1) Offer to buy drink. 2) Shrug shoulders."
        action = STDIN.gets.chomp
        if action == "1"
            puts "You say \"Can I buy you a drink?\""
            puts "The hottie says \"Sure!\""
            puts "The bartender is busy in the crowded bar. He skips your turn and gives his attention to someone else."
            step6
        elsif action == "2"
            puts "GAME OVER!"
            puts "“The heart that gives, gathers.” Tao Te Ching"
            intro
        else 
            puts "Just be yourself."
            puts "Pick again"
            step5
        end
    end

    def step6
        puts "1) Stay cool. 2) Get angry."
        action = STDIN.gets.chomp
        if action == "1"
            puts "The bartender asks what the two of you would like to drink."
            puts "The hottie tells, \"I'll have a mimosa.\""
            step7
        elsif action == "2"
            puts "GAME OVER!"
            puts "The hottie gets embarassed by you and leaves."
            puts "Patience is not simply the ability to wait - it's how we behave while we're waiting. Joyce Meyer"
            intro
        else 
            puts "Just be yourself."
            puts "Pick again"
            step6
        end
    end

    def step7
        puts "1) Order two mimosas. 2) Order two AMFs."
        action = STDIN.gets.chomp
        if action == "1"
            puts "The bartender serves two mimosas."
            puts "The hottie says, \"Thanks!\""
            puts "The DJ starts playing \"Back That Azz Up\" by Juvenile. The hottie says \"This is my favorite song!\""
            step8
        elsif action == "2"
            puts "GAME OVER!"
            puts "The hottie takes the AMF and dumps it on your head."
            puts "The simple act of paying attention can take you a long way. Keanu Reeves"
            intro
        else 
            puts "Just be yourself."
            puts "Pick again"
            step7
        end
    end

    def step8
        puts "Hottie wants to dance but you're a terrible dancer."
        puts "1) Excuse yourself to go to the restroom. 2) Lead hottie to dance floor."
        action = STDIN.gets.chomp
        if action == "1"
            puts "GAME OVER!"
            puts "You go to the restroom and there is a huge line. When you return to the dance floor the hottie is dancing with someone else."
            puts "Bravery is being the only one who knows you're afraid. Franklin P. Jones  "   
            intro
        elsif action == "2"
            puts "The space between your bodies leaves no room for the Holy Spirit."
            puts "The hottie gazes into your eyes."
            step9
        else 
            puts "Just be yourself."
            puts "Pick again"
            step8
        end
    end

    def step9
        puts "1) Go for the kiss. 2) Hesitate."
        action = STDIN.gets.chomp
        if action == "1"
            puts "Your eyes close. Your lips meet. Everything else in the moment disappears."
            step10  
        elsif action == "2"
            puts "GAME OVER!"
            puts "The hottie looks away and says \"I have to go. Bye.\""
            puts "People, y'know, they either love us or they hate us; there's no middle ground. Ace Frehley"
            intro
        else 
            puts "\"Just be yourself.\""
            puts "Pick again"
            step9
        end
    end

    def step10
        puts "The lights turn on. The music stops. Friend of the hottie says \"Our Uber is here.\""
        puts "1) Grab hottie's arm and be possessive. 2) Ask for phone number."
        action = STDIN.gets.chomp
        if action == "1"
            puts "Hottie's friend punches you. The bouncers grab you and throw you into the dumpster in the alleyway."
            puts "If you love something let it go. If it comes back it's yours, and that's how you know. Christina Aguilera"
            puts "GAME OVER!"
        elsif action == "2"
            puts "VICTORY!"
            puts "You trade phone numbers with the hottie. The hottie gets into the Uber and leaves."
            puts "Play again?"
                input = STDIN.gets.chomp
                if input == "yes" || input ==  "y"
                    intro
                elsif input == "no" || input ==  "n"
                    puts "THE END"
                end   
        else 
            puts "Just be yourself."
            puts "Pick again"
            step10
        end
    end
end
