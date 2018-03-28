GLOBAL_LIST_EMPTY(skills)

var/const/SKILL_NONE = 1
var/const/SKILL_BASIC = 2
var/const/SKILL_ADEPT = 3
var/const/SKILL_EXPERT = 4
var/const/SKILL_PROF = 5

var/const/SKILL_MIN = 1 // Min skill value selectable
var/const/SKILL_MAX = 5 // Max skill value selectable
var/const/SKILL_DEFAULT = 4 //most mobs will default to this

/decl/hierarchy/skill
	var/ID = "none"					// ID of this skill. Needs to be unique.
	name = "None" 				// Name of the skill. This is what the player sees.
	var/desc = "Placeholder skill" 	// Generic description of this skill.

   	// Names for different skill values, in order from 1 up.
	var/level_names = list( "Unskilled",
							"Basic",
							"Trained",
							"Experienced",
							"Professional")

	// Descriptions for different values.
	var/desc_levels = list( "Unskilled"			= "Unskilled Description",
							"Basic"				= "Basic Description",
							"Trained"			= "Trained Description",
							"Experienced"		= "Experienced Description",
							"Professional"		= "Professional Description")

//Do not attempt to get_decl any of these except /decl/hierarchy/skill from decls_repository. Use the children variable or GLOB.skills instead.
/decl/hierarchy/skill/New(var/full_init = TRUE)
	..(full_init)
	if(full_init)
		if(!GLOB.skills.len)
			for(var/decl/hierarchy/skill/C in children)
				GLOB.skills += C.children
		else
			log_error("<span class='warning'>Warning: multiple instances of /decl/hierarchy/skill have been created!</span>")

/decl/hierarchy/skill/dd_SortValue()
	return ID

/decl/hierarchy/skill/organizational
	name = "Organizational"
	ID	 = "1"

/decl/hierarchy/skill/general
	name = "General"
	ID	 = "2"

/decl/hierarchy/skill/service
	name = "Service"
	ID	 = "service"

/decl/hierarchy/skill/security
	name = "Security"
	ID	 = "security"

/decl/hierarchy/skill/engineering
	name = "Engineering"
	ID	 = "engineering"

/decl/hierarchy/skill/research
	name = "Research"
	ID	 = "research"

/decl/hierarchy/skill/medical
	name = "Medical"
	ID	 = "medical"

// ONLY SKILL DEFINITIONS BELOW THIS LINE
// Category: Organizational

/decl/hierarchy/skill/organizational/management
	ID = "management"
	name = "Leadership"
	desc = "Your ability to manage and command other crew members."
	desc_levels = list( "Unskilled"			= "You know a little about management, but you have a lot of flaws and little experience. You are likely to micromanage, lose track of people, or generally muck things up. Handling a major crisis is probably beyond your ability.",
						"Basic"				= "You have recieved basic leadership training, but have little experience actually managing people. You can come up with good organizational strategies, but won't know what to do when they fall apart in a crisis.",
						"Trained"			= "You're a good commander. You know how to coordinate the efforts of a large group of people effectively. You'll still be thrown off in a crisis, but you'll probably get through it.",
						"Experienced"		= "You're a highly experienced commander. In addition to just doing your job, you know how to inspire love, loyalty or fear, and you handle crises smoothly and efficiently.",
						"Professional"		= "You are an excellent commander. You are listened to instinctively, and can navigate your people through anything thrown at you.")

/decl/hierarchy/skill/organizational/bureaucracy
	ID = "bureaucracy"
	name = "Bureaucracy"
	desc = "Your ability to write and complete paperwork, navigate complex organiztions, and understand laws and regulations."
	desc_levels = list( "Unskilled"			= "You can usually fill out basic paperwork, if with a few errors. You have a vague understanding of the law, gleaned mostly from the news and personal experience.",
						"Basic"				= "You are familiar with the paperwork needed to do your job, and can navigate it well. You have some understanding of the law as it applies to you and those around you.",
						"Trained"			= "You can navigate most paperwork thrown at you, even if you are unfamiliar with it. You have a good working understanding of the law and any regulations or procedures relevant to you.",
						"Experienced"		= "With your experience, you can easily create paperwork for any eventuality, and write reports which are clear and understandable. Your have an excellent knowledge of the law, possibly including formal legal training.",
						"Professional"		= "You can make paperwork dance to your bidding, and navigate the most byzantine bureaucratic structures with ease and familiarity. Your reports are works of literature. Your knowledge of the law is both broad and intimate, and you may be certified to practice law.")

/decl/hierarchy/skill/organizational/finance
	ID = "finance"
	name = "Finance"
	desc = "Your ability to manage money and investments."
	desc_levels = list( "Unskilled"			= "Your understanding of money starts and ends with personal finance. While you are able to perform basic transactions, you get lost in the details, and can find yourself ripped off on occation.",
						"Basic"				= "You have some limited understanding of financial transactions, and will generally be able to keep accurate records. You have little experience with investment, and managing large sums of money will likely go poorly for you.",
						"Trained"			= "You are good at managing accounts, keeping records, and arranging transactions. You have some familiarity with mortgages, insurance, stocks, and bonds, but may be stumped when facing more complicated financial devices.",
						"Experienced"		= "With your experience, you are familiar with any financial entities you may run across, and are a shrewd judge of value. More often than not, investments you make will pan out well.",
						"Professional"		= "You have an excellent knowledge of finance, will often make brilliant investments, and have an instinctive feel for interstellar economics. Financial instruments are weapons in your hands. You likely have professional experience in the finance industry.")

// Category: General

/decl/hierarchy/skill/general/EVA
	ID = "EVA"
	name = "Extra-vehicular activity"
	desc = "This skill describes your skill and knowledge of space-suits and working in vacuum."
	desc_levels = list( "Unskilled"			= "You have basic safety training common to people who work in space: You know how to put on and seal your internals, and you can probably struggle into a space suit if you really need to, though you'll be clumsy at it. You're still prone to mistakes that may leave you trying to breathe vacuum.",
						"Basic"				= "You have had thorough basic training in EVA operations, and are unlikely to make novice mistakes. However, you have little experience working in vacuum.",
						"Trained"			= "You can comfortably use a space suit and do so regularly in the course of your work. Checking your internals is second nature to you, and you don't panic in an emergency.",
						"Experienced"		= "You can use all kinds of space suits, including specialized versions. Your years of experience in EVA keep you from being disoriented in space, and you have experience using a jetpack to move around.",
						"Professional"		= "You are just as much at home in a vacuum as in atmosphere. You probably do your job almost entirely EVA.")

/decl/hierarchy/skill/general/mech
	ID = "mech"
	name = "Exosuit Operation"
	desc = "Describes your experience and understanding of operating heavy machinery, which includes mechs and other large exosuits. Used in piloting mechs."
	desc_levels = list( "Unskilled"			= "You know what a mech is, and if you see one you can recognize which type it is. If your department uses exosuits, you know roughly what their capabilities are. If you were to get into one, you'd have about fifty-fifty odds of getting it moving in the direction you wanted it to go.",
						"Basic"				= "You can drive an exosuit safely, but you specialize in only one type of mech that your department regularly uses. You're not an expert and you fumble the controls sometimes, but you're going where you want to go and you're pretty sure you know what those buttons do.",
						"Trained"			= "You are quite comfortable using the type of exosuit you're most familiar with. You may spend entire shifts piloting one, and you're familiar with its functions. You can do basic maintenance. You can use most types of exosuits, unless they're very exotic or specialized.",
						"Experienced"		= "You can use any type of mech comfortably and automatically. To you, a mech is more like a second skin than a vehicle. You can maintain, repair, and probably build exosuits.",
						"Professional"		= "You are a professional exosuit technician, and are well-versed in construction and maintenance procedures. You can design and construct exosuits suitable for any needs.")

/decl/hierarchy/skill/general/pilot
	ID = "pilot"
	name = "Piloting"
	desc = "Describes your experience and understanding of piloting spacecraft, from small and short-range pods to corvette sized vessels."
	desc_levels = list( "Unskilled"			= "You know what a spacecraft is, and you might have an abstract understanding of the differences between various ships. If your department is involved in the use of spacecraft, you know roughly what their capabilities are. You might be able to fly a spacecraft in a videogame. If you were to take the Helm of a smaller vessel, you might be able to move it with proper guidance.",
						"Basic"				= "You can pilot a small, short-range craft safely, but larger ships are out of your area of expertise. You are by no means an expert, and probably don't have much training. Skills of this level are typical for deck crew.",
						"Trained"			= "You are a trained pilot, and can safely operate anything from a small craft to a corvette. You can spend extended periods of time piloting a spacecraft, and you're versed in the abilities of different ships, and what makes them function. You can do basic maintenance on smaller vessels, and perform most basic maneuvers. You can use armed spacecraft. You can make basic calculations relating to piloting. Skills of this level are typical for newer pilots. You have probably recieved formal piloting training.",
						"Experienced"		= "You are an experienced pilot, and can safely take the helm of many types of craft. You could probably live in a spacecraft, and you're very well versed in essentially everything related to space-faring vessels. Not only can you fly a ship, but you can perform difficult maneuvers, and make most calculations related to piloting a spacecraft. You can maintain a ship. Skills of this level are typical for very experienced pilots. You have recieved formal piloting training.",
						"Professional"		= "Not only are you an exceptional pilot, but you have mastered peripheral functions such as stellar navigation and bluespace jump plotting. You have experience performing complex maneuvers, managing squadrons of small craft, and operating in hostile environments.")

/decl/hierarchy/skill/general/hauling
	ID = "hauling"
	name = "Manual Labor"
	desc = "Your ability to perform tasks requiring great strength, dexterity, or endurance."
	desc_levels = list( "Unskilled"			= "You are not used to manual labor, tire easily, and are likely not in great shape. Extended heavy labor may be dangerous for you.",
						"Basic"				= "You have some familiarity with manual labor, and are in reasonable physical shape. Tasks requiring great dexterity or strength may still elude you.",
						"Trained"			= "You have suffient strength and dexterity for even very strenuous tasks, and can work for a long time without tiring.",
						"Experienced"		= "You have experience with heavy work in trying physical conditions, and are in excellent shape. You visit the gym frequently.",
						"Professional"		= "In addition to your excellent strength and endurance, you have a lot of experience with the specific physical demands of your job. You may have competitive experience with some form of athletics.")

/decl/hierarchy/skill/general/computer
	ID = "computer"
	name = "Information Technology"
	desc = "Describes your understanding of computers, software and communication. Not a requirement for using computers, but definitely helps. Used in telecommunications and programming of computers and AIs."
	desc_levels = list( "Unskilled"			= "You know how to use the computers and communication devices that you grew up with. You can use a computer console, a handheld or wall-mounted radio, and your headset, as well as your PDA. You know what an AI is, but you may see them as either \"people made of silicon\" or \"only machines\"; you know they have to obey their laws, but you don't know much about how or why they work.",
						"Basic"				= "You know the basics of programming, but you're not very good at it and couldn't do it professionally. You have a pretty good idea of what makes AIs tick. You understand how information is stored in a computer, and you can fix simple computer problems. You're computer-literate, but you still make mistakes. If you tried to subvert the AI, you might make mistakes in wording your new laws.",
						"Trained"			= "At this level, you're probably working with computers on a daily basis. You understand and can repair the telecommunications network. Your understanding of AI programming and psychology lets you fix problems with the AIs or cyborgs--or create problems, if you so desire. You can program computers and AIs and change their laws effectively.",
						"Experienced"		= "You have years of experience with computer networks, AI systems, telecommunications, and sysadmin tasks. You know the systems used on a daily basis intimately, and can diagnose complex problems.",
						"Professional"		= "People are probably starting to wonder whether you might be a computer yourself. Computer code is your first language; you relate to AIs as easily as (probably more easily than) organics. You could build a telecommunications network from the ground up.")

// Category: Service

/decl/hierarchy/skill/service/botany
	ID = "botany"
	name = "Botany"
	desc = "Describes how good a character is at growing and maintaining plants."
	desc_levels = list( "Unskilled"			= "You know next to nothing about plants. While you can attempt to plant, weed, or harvest, you are just as likely to kill the plant instead.",
						"Basic"				= "You've done some gardening. You can water, weed, fertilize, plant, and harvest, and you can recognize and deal with pests. You may be a hobby gardener.",
						"Trained"			= "You are proficient at botony, and can grow plants for food or oxygen production. Your plants will generally survive and prosper, though you are unfamilliar with more exotic varieties.",
						"Experienced"		= "You're a botanist or farmer, growing crops on large scales or doing botanical research. You know the basics of manipulating plant genes.",
						"Professional"		= "You're a specialized botanist. You can care for even the most exotic, fragile, or dangerous plants, and you can create custom hybrids and modified strains.")

/decl/hierarchy/skill/service/cooking
	ID = "cooking"
	name = "Cooking"
	desc = "Describes a character's skill at preparing meals and other consumable goods. This includes mixing alcoholic beverages."
	desc_levels = list( "Unskilled"			= "You barely know anything about cooking, and stick to vending machines when you can. The microwave is a device of black magic to you, and you avoid it when possible.",
						"Basic"				= "You can make simple meals and do the cooking for your family. Things like spaghetti, grilled cheese, or simple mixed drinks are your usual fare.",
						"Trained"			= "You can make most meals while following instructions, and they generally turn out well. You have some experience with hosting, catering, and/or bartending.",
						"Experienced"		= "You can cook professionally, keeping an entire crew fed easily. Your food is tasty and you don't have a problem with tricky or complicated dishes. You can be depended on to make just about any commonly-served drink.",
						"Professional"		= "Not only are you good at cooking and mixing drinks, but you can manage a kitchen staff and cater for special events. You can safely prepare exotic foods and drinks that would be poisonous if prepared incorrectly.")

// Category: Security

/decl/hierarchy/skill/security/combat
	ID = "combat"
	name = "Close Combat"
	desc = "This skill describes your training in hand-to-hand combat or melee weapon usage. While expertise in this area is rare in the era of firearms, experts still exist among athletes."
	desc_levels = list( "Unskilled"			= "You can throw a punch or a kick, but it'll knock you off-balance. You're inexperienced and have probably never been in a serious hand-to-hand fight. In a fight, you might panic and run, grab whatever's nearby and blindly strike out with it, or (if the other guy is just as much of a beginner as you are) make a fool out of yourself.",
						"Basic"				= "You either have some experience with fistfights, or you have some training in a martial art. You can handle yourself if you really have to, and if you're a security officer, can handle a stun baton at least well enough to get the handcuffs onto a criminal.",
						"Trained"			= "You have had close-combat training, and can easily defeat unskilled opponents. Close combat may not be your specialty, and you don't engage in it more than needed, but you know how to handle yourself in a fight.",
						"Experienced"		= "You're good at hand-to-hand combat. You've trained explicitly in a martial art or as a close combatant as part of a military or police unit. You can use weaponry competently and you can think strategically and quickly in a melee. You're in good shape and you spend time training.",
						"Professional"		= "You specialize in hand-to-hand combat. You're well-trained in a practical martial art, and in good shape. You spend a lot of time practicing. You can take on just about anyone, use just about any weapon, and usually come out on top. You may be a professional athlete or special forces member.")

/decl/hierarchy/skill/security/weapons
	ID = "weapons"
	name = "Weapons Expertise"
	desc = "This skill describes your expertise with and knowledge of weapons. A low level in this skill implies knowledge of simple weapons, for example flashes. A high level in this skill implies knowledge of complex weapons, such as unconfigured grenades, riot shields, pulse rifles or bombs. A low-medium level in this skill is typical for security officers, a high level of this skill is typical for special agents and soldiers."
	desc_levels = list( "Unskilled"			= "You know how to recognize a weapon when you see one. You can probably use pepper spray or a flash, though you might fumble and turn them on yourself by mistake. You're likely to shoot yourself in the foot or forget to take the safety off. Your lack of training may make you more dangerous to your allies than your enemies.",
						"Basic"				= "You know how to handle weapons safely, and you're comfortable using simple weapons. Your aim is decent and you can usually be trusted not to do anything stupid with a weapon you are familiar with, but your training isn't automatic yet and your performance will degrade in high-stress situations.",
						"Trained"			= "You have had extnensive weapons training, or have used weapons in combat. You are familiar with most types of weapons and can use them in a pinch. You have an understanding of tactics, and can be trusted to stay calm under fire.",
						"Experienced"		= "You've used firearms and other ranged weapons in a high-stress situation, and your skills have become automatic. You spend time practicing at the firing range. Your aim is good. You can maintain and repair your weaponry. You may have military or police experience and you probably carry a weapon on the job.",
						"Professional"		= "You are an exceptional shot with a variety of weapons, from simple to exotic. You can depend on hitting not just your target, but a specific part of your target, such as shooting someone in the leg. You use a weapon as naturally as though it were a part of your own body. You may be a professional marksman of some kind. You probably know a good deal about tactics, and you may have designed or modified your own weaponry.")

/decl/hierarchy/skill/security/forensics
	ID = "forensics"
	name = "Forensics"
	desc = "Describes your skill at performing forensic examinations and identifying vital evidence. Does not cover analytical abilities, and as such isn't the only indicator for your investigation skill. Note that in order to perform autopsy, the surgery skill is also required."
	desc_levels = list( "Unskilled"			= "You know that detectives solve crimes. You may have some idea that it's bad to contaminate a crime scene, but you're not too clear on the details.",
						"Basic"				= "You know how to avoid contaminating a crime scene. You know how to use the tools of the trade (scanner, computer database, and so forth), and you can conduct an interview with a witness or a suspect.",
						"Trained"			= "You have had training in policework, and have some experience in the field. You can follow procedure and process evidence, though your lack of practice may make it difficult to arrive at a definitive conclusion.",
						"Experienced"		= "You're a police officer, pathologist, or detective. You can secure a crime scene, gather evidence, interview witnesses, and put two and two together to get an arrest. If you're trained in anatomy, you can perform an autopsy.",
						"Professional"		= "You specialize in criminal investigations. Your ability to gather and analyze evidence has been honed through intensive schooling, years of practice, or most likely both. You can organize a manhunt or draw a criminal into a trap, and though you're behind the scenes and may never even see the criminal, your skills make the difference between an unsolved crime and a convicted criminal.")

// Category: Engineering

/decl/hierarchy/skill/engineering/construction
	ID = "construction"
	name = "Construction"
	desc = "Your ability to construct various buildings, such as walls, floors, tables and so on. Note that constructing devices such as APCs additionally requires the Electronics skill. A low level of this skill is typical for janitors, a high level of this skill is typical for engineers."
	desc_levels = list( "Unskilled"			= "You can move furniture, assemble or disassemble chairs and tables (sometimes they even stay assembled), bash your way through a window, open a crate, or pry open an unpowered airlock. You can recognize and use basic hand tools and inflatable barriers, though not very well.",
						"Basic"				= "You can dismantle or build a wall or window, build furniture, redecorate a room, and replace floor tiles and carpeting. You can safely use a welder without burning your eyes, and using hand tools is second nature to you.",
						"Trained"			= "You can build, repair, or dismantle most things, but will occasionally make mistakes and have things not come out the way you expected.",
						"Experienced"		= "You know how to seal a breach, rebuild broken piping, and repair major damage. You know the basics of structural engineering.",
						"Professional"		= "You are a construction worker or engineer. You could pretty much rebuild the installation or ship from the ground up, given supplies, and you're efficient and skilled at repairing damage.")

/decl/hierarchy/skill/engineering/electrical
	ID = "electrical"
	name = "Electrical Engineering"
	desc = "This skill describes your knowledge of electronics and the underlying physics. A low level of this skill implies you know how to lay out wiring and configure powernets, a high level of this skill is required for working complex electronic devices such as circuits or bots."
	desc_levels = list( "Unskilled"			= "You know that electrical wires are dangerous and getting shocked is bad; you can see and report electrical malfunctions such as broken wires or malfunctioning APCs. You can change a light bulb, and you know how to replace a battery or charge up the equipment you normally use.",
						"Basic"				= "You can do basic wiring; you can lay cable for solars or the engine. You can repair broken wiring and build simple electrical equipment like light fixtures or APCs. You know the basics of circuits and understand how to protect yourself from electrical shock. You can probably hack a vending machine.",
						"Trained"			= "You can repair and build electrical equipment and do so on a regular basis. You can troubleshoot an electrical system and monitor the installation power grid. You can probably hack an airlock.",
						"Experienced"		= "You can repair, build, and diagnose any electrical devices with ease. You know your way around APCs, SMES units, and monitoring software, and take apart or hack most objects.",
						"Professional"		= "You are an electrical engineer or the equivalent. You can design, upgrade, and modify electrical equipment and you are good at maximizing the efficiency of your power network. You can hack anything on the installation you can deal with power outages and electrical problems easily and efficiently.")

/decl/hierarchy/skill/engineering/atmos
	ID = "atmos"
	name = "Atmospherics"
	desc = "Describes your knowledge of piping, air distribution and gas dynamics."
	desc_levels = list( "Unskilled"			= "You know that the air monitors flash orange when the air is bad and red when it's deadly. You know that a flashing fire door means danger on the other side. You know that some gases are poisonous, that pressure has to be kept in a safe range, and that most creatures need oxygen to live. You can use a fire extinguisher or deploy an inflatable barrier.",
						"Basic"				= "You know how to read an air monitor, how to use an air pump, how to analyze the atmosphere in a space, and how to help seal a breach. You can lay piping and work with gas tanks and canisters. If you work with the engine, you can set up the cooling system. You can use a fire extinguisher easily and place inflatable barriers so that they allow convenient access and airtight breach containment.",
						"Trained"			= "You can run the atmospherics system. You know how to monitor the air quality across the installation detect problems, and fix them. You're trained in dealing with fires, breaches, and gas leaks, and may have exosuit or fire gear training.",
						"Experienced"		= "Your atmospherics experience lets you find, diagnose, and fix breaches efficiently. You can manage complex atmospherics systems without fear of making mistakes, and are proficient with all monitoring and pumping equipment at your disposal.",
						"Professional"		= "You are an atmospherics specialist. You monitor, modify, and optimize the installation atmospherics system, and you can quickly and easily deal with emergencies. You can modify atmospherics systems to do pretty much whatever you want them to. You can easily handle a fire or breach, and are proficient at securing an area and rescuing civilians, but you're equally likely to have simply prevented it from happening in the first place.")

/decl/hierarchy/skill/engineering/engines
	ID = "engines"
	name = "Engines"
	desc = "Describes your knowledge of the various engine types common on space stations, such as the PACMAN, singularity, supermatter or RUST engine."
	desc_levels = list( "Unskilled"			= "You know that \"delamination\" is a bad thing and that you should stay away from the singularity. You know the engine provides power, but you're unclear on the specifics. If you were to try to set up the engine, you would need someone to talk you through every detail--and even then, you'd probably make deadly mistakes.",
						"Basic"				= "You know the basic theoretical principles of engine operation. You can try to set up the engine by yourself, but you are likely to need some assistance and supervision, otherwise you are likely to make mistakes. You are fully capable of running a PACMAN-type generator.",
						"Trained"			= "You can set up the engine, and you probably won't botch it up too badly. You know how to protect yourself from radiation in the engine room. You can read the engine monitors and keep the engine going. An engine malfunction may stump you, but you can probably work out how to fix it... let's just hope you do so quickly enough to prevent serious damage.",
						"Experienced"		= "You have years of experience with engines, and can set them up quickly and reliably. You're familiar with engine types other than the one you work with. ",
						"Professional"		= "Your engine is your baby and you know every minute detail of its workings. You can optimize the engine and you probably have your own favorite custom setup. You could build an engine from the ground up. When things go wrong, you know exactly what has happened and how to fix the problem. You can safely handle singularities and supermatter.")

// Category: Research

/decl/hierarchy/skill/research/devices
	ID = "devices"
	name = "Complex Devices"
	desc = "Describes the ability to assemble complex devices, such as computers, circuits, printers, robots or gas tank assemblies (bombs). Note that if a device requires electronics or programming, those skills are also required in addition to this skill."
	desc_levels = list( "Unskilled"			= "You know how to use the technology that was present in whatever society you grew up in. You know how to tell when something is malfunctioning, but you have to call tech support to get it fixed.",
						"Basic"				= "You use and repair high-tech equipment in the course of your daily work. You can fix simple problems, and you know how to use a circuit printer or autolathe. You can build simple robots such as cleanbots and medibots.",
						"Trained"			= "You can build or repair an exosuit or cyborg chassis, use a protolathe and destructive analyzer, and build prosthetic limbs. You can safely transfer an MMI or posibrain into a cyborg chassis.",
						"Experienced"		= "You have years of experience building or reverse-engineering complex devices. Your use of the lathes and destructive analyzers is efficient and methodical. You can design contraptions to order, and likely sell those designs at a profit.",
						"Professional"		= "You are an inventor or researcher. You can design, build, and modify equipment that most people don't even know exists. You are at home in the lab and the workshop and you've never met a gadget you couldn't take apart, put back together, and replicate.")

/decl/hierarchy/skill/research/science
	ID = "science"
	name = "Science"
	desc = "Your experience and knowledge with scientific methods and processes."
	desc_levels = list( "Unskilled"			= "You know what science is and probably have a vague idea of the scientific method from your high school science classes.",
						"Basic"				= "You keep up with scientific discoveries. You know a little about most fields of research. You've learned basic laboratory skills. You may read about science as a hobby; or you may be working in a field related to science and have learned about science that way. You could design a simple experiment.",
						"Trained"			= "You are a scientist, perhaps a graduate student or post-graduate researcher. You can design an experiment, analyze your results, publish your data, and integrate what you've learned with the research of other scientists. Your laboratory skills are reliable, and you know how to find information you need when you research a new scientific topic.",
						"Experienced"		= "You are a junior researcher. You can formulate your own questions, use the tools at hand to test your hypotheses, and investigate entirely new phenomena. You likely have a track record of success in publishing your conclusions and attracting funding.",
						"Professional"		= "You are a professional researcher, and you have made multiple new discoveries in your field. Your experiments are well-designed. You are known as an authority in your specialty and your papers often appear in prestigious journals. You may be coordinating the research efforts of a team of scientists, and likely know how to make your findings appealing to investors.")

// Category: Medical

/decl/hierarchy/skill/medical/medical
	ID = "medical"
	name = "Medicine"
	desc = "Covers an understanding of the human body and medicine. At a low level, this skill gives a basic understanding of applying common types of medicine, and a rough understanding of medical devices like the health analyzer. At a high level, this skill grants exact knowledge of all the medicine available on the installation, as well as the ability to use complex medical devices like the body scanner or mass spectrometer."
	desc_levels = list( "Unskilled"			= "You know basic first aid, such as how to apply a bandage or ointment to an injury. You can use an autoinjector designed for civilian use, probably by reading the directions printed on it. You can tell when someone is badly hurt and needs a doctor; you can see whether someone has a badly broken bone, is having trouble breathing, or is unconscious. You may not be able to tell the difference between unconscious and dead.",
						"Basic"				= "You've taken a first-aid training, nursing, or EMT course. You can stop bleeding, do CPR, apply a splint, take someone's pulse, apply trauma and burn treatments, and read a handheld health scanner. You probably know that Dylovene helps poisoning and Dexalin helps people with breathing problems; you can use a syringe or start an IV. You've been briefed on the symptoms of common emergencies like a punctured lung, appendicitis, alcohol poisoning, or broken bones, and though you can't treat them, you know that they need a doctor's attention. You can recognize most emergencies as emergencies and safely stabilize and transport a patient.",
						"Trained"			= "You are an experienced EMT, an experienced nurse, or a medical resident. You know how to treat most illnesses and injuries, though exotic illnesses and unusual injuries may still stump you. You have probably begun to specialize in some sub-field of medicine. In emergencies, you can think fast enough to keep your patients alive, and even when you can't treat a patient, you know how to find someone who can. You probably have some skill in genetics, virology, and surgery, if only to the extent of being able to create an antibody, do a cloning scan, or assist a surgeon in the operating room. You can use a full-body scanner, and you know something's off about a patient with an alien parasite or cortical borer.",
						"Experienced"		= "You are a senior nurse or paramedic, or a practicing doctor. You know how to use all of the medical devices available to treat a patient. Your deep knowledge of the body and medications will let you diagnose and come up with a course of treatment for most ailments.",
						"Professional"		= "You are an experienced doctor. You've seen almost everything there is to see when it comes to injuries and illness and even when it comes to something you haven't seen, you can apply your wide knowledge base to put together a treatment. In a pinch, you can do just about any medicine-related task, but your specialty, whatever it may be, is where you really shine.")

/decl/hierarchy/skill/medical/anatomy
	ID = "anatomy"
	name = "Anatomy"
	desc = "Gives you a detailed insight of the human body. A high skill in this is required to perform surgery. This skill may also help in examining alien biology."
	desc_levels = list( "Unskilled"			= "You know what organs, bones, and such are, and you know roughly where they are. You know that someone who's badly hurt or sick may need surgery.",
						"Basic"				= "You've taken an anatomy class and you've spent at least some time poking around inside actual people. You know where everything is, more or less. You could assist in surgery, if you have the required medical skills. If you have the forensics knowledge, you could perform an autopsy. If you really had to, you could probably perform basic surgery such as an appendectomy, but you're not yet a qualified surgeon and you really shouldn't--not unless it's an emergency. If you're a xenobiologist, you know how to take out slime cores.",
						"Trained"			= "You have some training in anatomy. Diagnosing broken bones, damaged ligaments, shrapnel wounds, and other trauma is straightforward for you. You can splint limbs with a good chance of success, operate a defibrilator competently, and perform CPR well. Surgery is still outside your training.",
						"Experienced"		= "You're a surgical resident, or an experienced medical doctor. You can put together broken bones, fix a damaged lung, patch up a liver, or remove an appendix without problems. But tricky surgeries, with an unstable patient or delicate manipulation of vital organs like the heart and brain, are at the edge of your ability, and you prefer to leave them to specialized surgeons. You can recognize when someone's anatomy is noticeably unusual. You're trained in working with several species, but you're probably better at surgery on your own species.",
						"Professional"		= "You are an experienced surgeon. You can handle anything that gets rolled, pushed, or dragged into the OR, and you can keep a patient alive and stable even if there's no one to assist you. You can handle severe trauma cases or multiple organ failure, repair brain damage, and perform heart surgery. By now, you've probably specialized in one field, where you may have made new contributions to surgical technique. You can detect even small variations in the anatomy of a patient--even a changeling probably wouldn't slip by your notice, provided you could get one on the operating table.")

/decl/hierarchy/skill/medical/virology
	ID = "virology"
	name = "Virology"
	desc = "This skill implies an understanding of microorganisms and their effects on humans."
	desc_levels = list( "Unskilled"			= "You know that diseases are contagious; you've probably heard you should wash your hands to stop their spread. You know that if you're sick, you can go to Medical and get treatment.",
						"Basic"				= "You know how viruses work, and you can use the machinery in the virology lab to analyze a virus or create an antibody. You know the principles of quarantine and you know how to keep a virus from spreading. You know that spaceacillin will help the body fight off a virus. However, you're not specialized in virology, and you probably don't have a whole lot of experience in dealing with viruses. If you are a medical doctor, you know how to treat symptoms and keep sick patients stable.",
						"Trained"			= "You know the full process of creating antibodies for a viral strain. You will generally be able to contain an infection and see that it is treated quickly.",
						"Experienced"		= "You know how to analyze, modify, and cure viruses, and could probably do so even without most of the equipment in the virology lab. You know how to trigger mutations in a virus and how to isolate genes. If you really wanted to, you could create a deadly virus, provided you got lucky with the mutations.",
						"Professional"		= "You are a specialized virologist - either a medical doctor or a scientific researcher. You may be well-known in the field, having published in prestigious journals; or you may be a mad scientist working away in secret. You know how to use a virus as a tool or a weapon. You can cure any epidemic and if you wanted to, you could start one so deadly and contagious that your targets wouldn't know what hit them.")

/decl/hierarchy/skill/medical/chemistry
	ID = "chemistry"
	name = "Chemistry"
	desc = "Experience with mixing chemicals, and an understanding of what the effect will be. This doesn't cover an understanding of the effect of chemicals on the human body, as such the medical skill is also required for medical chemists."
	desc_levels = list( "Unskilled"			= "You know that chemists work with chemicals; you know that they can make medicine or poison or useful chemicals. You probably know what an element is and have a vague idea of what a chemical reaction is from some chemistry class in your high school days.",
						"Basic"				= "You can make basic chemicals or medication--things like space cleaner or anti-toxin. You have some training in safety and you won't blow up the lab... probably.",
						"Trained"			= "You can accurately measure out reagents, grind powders, and perform chemical reactions. You may still lose some product on occasion, but are unlikely to endanger yourself or those around you.",
						"Experienced"		= "You work as a chemist, or else you are a doctor with training in chemistry. If you are a research chemist, you can create most useful chemicals; if you are a pharmacist, you can make most medications. At this stage, you're working mostly by-the-book. You can weaponize your chemicals by making grenades, smoke bombs, and similar devices.",
						"Professional"		= "You specialized in chemistry or pharmaceuticals; you are either a medical researcher or professional chemist. You can create custom mixes and make even the trickiest of medications easily. You understand how your pharmaceuticals interact with the bodies of your patients. You are probably the originator of at least one new chemical innovation.")
