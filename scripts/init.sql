CREATE SCHEMA IF NOT EXISTS dogpedia;
ALTER DATABASE postgres SET search_path TO dogpedia,public;


CREATE TABLE dog_breed (
    id varchar(150) primary key,
    short_description varchar(150),
    long_description varchar(1024)
);

CREATE TABLE breed_image (
    pk serial primary key,
    image_path varchar(255) not null,
    alt_text varchar(255),
    breed_id varchar(150) references dog_breed(id)
);

CREATE TABLE characteristic (
    id varchar(50) primary key,
    char_description varchar(255)
);

CREATE TABLE breed_characteristic (
    characteristic_pk varchar(50) references characteristic(id),
    breed_id varchar(150) references dog_breed(id),
    CONSTRAINT breed_characteristic_pk PRIMARY KEY (characteristic_pk, breed_id)  -- explicit pk
);

INSERT INTO characteristic(id) values ('friendly');
INSERT INTO characteristic(id) values ('energetic');
INSERT INTO characteristic(id) values ('trainable');
INSERT INTO characteristic(id) values ('loyal');
INSERT INTO characteristic(id) values ('intelligent');
INSERT INTO characteristic(id) values ('versatile');
INSERT INTO characteristic(id) values ('protective');
INSERT INTO characteristic(id) values ('devoted');
INSERT INTO characteristic(id) values ('family-friendly');
INSERT INTO characteristic(id) values ('charming');
INSERT INTO characteristic(id) values ('playful');
INSERT INTO characteristic(id) values ('adaptable');
INSERT INTO characteristic(id) values ('gentle');
INSERT INTO characteristic(id) values ('affectionate');
INSERT INTO characteristic(id) values ('courageous');
INSERT INTO characteristic(id) values ('dependable');
INSERT INTO characteristic(id) values ('elegant');
INSERT INTO characteristic(id) values ('hypoallergenic');
INSERT INTO characteristic(id) values ('curious');
INSERT INTO characteristic(id) values ('vocal');
INSERT INTO characteristic(id) values ('strong');
INSERT INTO characteristic(id) values ('obedient');
INSERT INTO characteristic(id) values ('vivacious');
INSERT INTO characteristic(id) values ('adventurous');
INSERT INTO characteristic(id) values ('pampered');
INSERT INTO characteristic(id) values ('patient');
INSERT INTO characteristic(id) values ('lively');
INSERT INTO characteristic(id) values ('stubborn');
INSERT INTO characteristic(id) values ('brave');
INSERT INTO characteristic(id) values ('enduring');
INSERT INTO characteristic(id) values ('graceful');
INSERT INTO characteristic(id) values ('powerful');
INSERT INTO characteristic(id) values ('alert');
INSERT INTO characteristic(id) values ('sturdy');
INSERT INTO characteristic(id) values ('confident');
INSERT INTO characteristic(id) values ('active');
INSERT INTO characteristic(id) values ('spirited');
INSERT INTO dog_breed (id, short_description, long_description)
values ('Labrador Retriever', 'A friendly and energetic breed, known for its loyalty and trainability.', 'The Labrador Retriever is one of the most popular dog breeds in the United States. They are known for their friendly and outgoing nature. Labs are highly trainable and often used as service dogs. They love to play and need regular exercise. Their coat requires minimal maintenance, but they do shed.');
INSERT INTO breed_image (image_path, breed_id) values ('labrador-retriever-1', 'Labrador Retriever');
INSERT INTO breed_image (image_path, breed_id) values ('labrador-retriever-2', 'Labrador Retriever');
INSERT INTO breed_image (image_path, breed_id) values ('labrador-retriever-3', 'Labrador Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Labrador Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('energetic', 'Labrador Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('trainable', 'Labrador Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('loyal', 'Labrador Retriever');

INSERT INTO dog_breed (id, short_description, long_description)
values ('German Shepherd', 'An intelligent and versatile breed, often used in police and military work.', 'German Shepherds are known for their intelligence and versatility. They excel in many roles, including police and military work, due to their obedience and protective nature. They require regular exercise and mental stimulation. German Shepherds are loyal and form strong bonds with their families, but they can be wary of strangers.');
INSERT INTO breed_image (image_path, breed_id) values ('german-shephard-1', 'German Shepherd');
INSERT INTO breed_image (image_path, breed_id) values ('german-shephard-2', 'German Shepherd');
INSERT INTO breed_image (image_path, breed_id) values ('german-shephard-3', 'German Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'German Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('versatile', 'German Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('loyal', 'German Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('protective', 'German Shepherd');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Golden Retriever', 'A friendly and devoted breed, great with families.', 'Golden Retrievers are known for their friendly and tolerant attitude. They are highly intelligent and versatile, excelling in obedience training. They are great family pets, known for their devotion to their owners. Golden Retrievers need regular exercise to maintain their fitness. They love to play and are excellent with children.');
INSERT INTO breed_image (image_path, breed_id) values ('golden-retriever-1', 'Golden Retriever');
INSERT INTO breed_image (image_path, breed_id) values ('golden-retriever-2', 'Golden Retriever');
INSERT INTO breed_image (image_path, breed_id) values ('golden-retriever-3', 'Golden Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Golden Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('devoted', 'Golden Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'Golden Retriever');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('family-friendly', 'Golden Retriever');

INSERT INTO dog_breed (id, short_description, long_description)
values ('French Bulldog', 'A small and charming breed with a playful and adaptable nature.', 'French Bulldogs have gained immense popularity due to their compact size and affectionate nature. They are known for their distinctive bat-like ears and stocky build. While they are playful and friendly, they don''t require a lot of exercise, making them suitable for apartment living. Frenchies are great companions and get along well with children and other pets.');
INSERT INTO breed_image (image_path, breed_id) values ('french-bulldog-1', 'French Bulldog');
INSERT INTO breed_image (image_path, breed_id) values ('french-bulldog-2', 'French Bulldog');
INSERT INTO breed_image (image_path, breed_id) values ('french-bulldog-3', 'French Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('charming', 'French Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('playful', 'French Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('adaptable', 'French Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'French Bulldog');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Bulldog', 'A gentle and affectionate breed, known for its loose, wrinkly skin.', 'Bulldogs are characterized by their loose, wrinkly skin, pushed-in nose, and stocky build. Despite their somewhat intimidating appearance, they are among the gentlest of dogs. They are very affectionate and dependable and have become a popular choice for families. Bulldogs are great with children and are known for their courage and excellent guarding capabilities. They require minimal grooming but need regular check-ups for potential health issues.');
INSERT INTO breed_image (image_path, breed_id) values ('bulldog-1', 'Bulldog');
INSERT INTO breed_image (image_path, breed_id) values ('bulldog-2', 'Bulldog');
INSERT INTO breed_image (image_path, breed_id) values ('bulldog-3', 'Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('gentle', 'Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('affectionate', 'Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('courageous', 'Bulldog');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('dependable', 'Bulldog');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Poodle', 'An intelligent and elegant breed, known for its curly, hypoallergenic coat.', 'Poodles are highly intelligent and graceful dogs, known for their curly, hypoallergenic coats. They come in standard, miniature, and toy sizes, catering to a wide variety of living situations. Poodles excel in obedience training and are enthusiastic performers in dog sports. Their friendly nature makes them excellent family pets, and their hypoallergenic coat is a plus for allergy sufferers. Regular grooming is essential to keep their coat in good condition.');
INSERT INTO breed_image (image_path, breed_id) values ('poodle-1', 'Poodle');
INSERT INTO breed_image (image_path, breed_id) values ('poodle-2', 'Poodle');
INSERT INTO breed_image (image_path, breed_id) values ('poodle-3', 'Poodle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'Poodle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('elegant', 'Poodle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('hypoallergenic', 'Poodle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Poodle');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Beagle', 'A small to medium-sized breed, known for its incredible sense of smell and tracking ability.', 'Beagles are small to medium-sized dogs with a great sense of smell and tracking instincts. They were originally bred for hunting small game due to their keen sense of smell and stamina. Beagles are friendly and curious, making them great companions for families. They have a lot of energy and require regular exercise. Their short coat is easy to care for, but they are known for their tendency to bark and howl.');
INSERT INTO breed_image (image_path, breed_id) values ('beagle-1', 'Beagle');
INSERT INTO breed_image (image_path, breed_id) values ('beagle-2', 'Beagle');
INSERT INTO breed_image (image_path, breed_id) values ('beagle-3', 'Beagle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('curious', 'Beagle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('energetic', 'Beagle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Beagle');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('vocal', 'Beagle');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Rottweiler', 'A robust and powerful breed, known for its loyalty and protective nature.', 'Rottweilers are robust, powerful dogs with a great deal of strength, agility, and endurance. They are known for their loyalty and protective nature, making them excellent guard dogs. Rottweilers require consistent, positive training from an early age and thrive on physical and mental challenges. They are generally good-natured, obedient, and are eager to work. Their coat is easy to maintain, requiring regular brushing.');
INSERT INTO breed_image (image_path, breed_id) values ('rottweiler-1', 'Rottweiler');
INSERT INTO breed_image (image_path, breed_id) values ('rottweiler-2', 'Rottweiler');
INSERT INTO breed_image (image_path, breed_id) values ('rottweiler-3', 'Rottweiler');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('loyal', 'Rottweiler');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('protective', 'Rottweiler');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('strong', 'Rottweiler');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('obedient', 'Rottweiler');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Yorkshire Terrier', 'A small and vivacious breed, known for its long, silky coat.', 'Yorkshire Terriers, often called Yorkies, are small in size but big in personality. They are known for their long, silky coat and are often considered to be quite pampered. Despite their petite size, they are adventurous, active, and love attention. Yorkies are very affectionate with their owners and can make excellent watchdogs. They require regular grooming to maintain their coat''s condition.');
INSERT INTO breed_image (image_path, breed_id) values ('yorkshire-terrier-1', 'Yorkshire Terrier');
INSERT INTO breed_image (image_path, breed_id) values ('yorkshire-terrier-2', 'Yorkshire Terrier');
INSERT INTO breed_image (image_path, breed_id) values ('yorkshire-terrier-3', 'Yorkshire Terrier');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('vivacious', 'Yorkshire Terrier');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('affectionate', 'Yorkshire Terrier');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('adventurous', 'Yorkshire Terrier');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('pampered', 'Yorkshire Terrier');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Boxer', 'A medium to large-sized breed, known for its playful and energetic nature.', 'Boxers are medium to large-sized dogs with a strong and muscular build. They are known for their playful and energetic nature, as well as their patience and protective instincts. Boxers are excellent with children and make great family pets. They are intelligent and eager to learn but can be stubborn at times. Regular exercise and consistent training are important for this breed.');
INSERT INTO breed_image (image_path, breed_id) values ('boxer-1', 'Boxer');
INSERT INTO breed_image (image_path, breed_id) values ('boxer-2', 'Boxer');
INSERT INTO breed_image (image_path, breed_id) values ('boxer-3', 'Boxer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('playful', 'Boxer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('energetic', 'Boxer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('protective', 'Boxer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('patient', 'Boxer');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Dachshund', 'A small breed with a distinctive long body and short legs, known for its lively personality.', 'Dachshunds, also known as ''wiener dogs,'' are recognized for their distinctive long bodies and short legs. They have a playful and curious nature, making them charming companions. Dachshunds can be stubborn, requiring patient and consistent training. They are known for their bravery and can be quite vocal. Due to their unique body structure, it''s important to monitor their exercise to avoid back problems.');
INSERT INTO breed_image (image_path, breed_id) values ('dachshund-1', 'Dachshund');
INSERT INTO breed_image (image_path, breed_id) values ('dachshund-2', 'Dachshund');
INSERT INTO breed_image (image_path, breed_id) values ('dachshund-3', 'Dachshund');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('lively', 'Dachshund');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('playful', 'Dachshund');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('stubborn', 'Dachshund');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('brave', 'Dachshund');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Siberian Husky', 'A medium to large-sized breed known for its endurance and willingness to work.', 'Siberian Huskies are medium to large-sized dogs known for their remarkable endurance and willingness to work. They have a thick double coat, erect triangular ears, and distinctive markings. Huskies are friendly and gentle but also alert and outgoing. They''re not the best watchdogs since they tend to be friendly with everyone. Huskies require regular, vigorous exercise and enjoy activities like running and hiking.');
INSERT INTO breed_image (image_path, breed_id) values ('siberian-husky-1', 'Siberian Husky');
INSERT INTO breed_image (image_path, breed_id) values ('siberian-husky-2', 'Siberian Husky');
INSERT INTO breed_image (image_path, breed_id) values ('siberian-husky-3', 'Siberian Husky');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('enduring', 'Siberian Husky');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Siberian Husky');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('gentle', 'Siberian Husky');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('energetic', 'Siberian Husky');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Great Dane', 'A giant breed, known for its gentle nature and towering height.', 'Great Danes are known for their immense size and gentle nature. They are often referred to as ''gentle giants'' due to their friendly and affectionate demeanor. Despite their size, they are graceful and require regular exercise to stay in shape. Great Danes are great with children and get along well with other animals. They need space to move around and should be trained gently but with consistency.');
INSERT INTO breed_image (image_path, breed_id) values ('great-dane-1', 'Great Dane');
INSERT INTO breed_image (image_path, breed_id) values ('great-dane-2', 'Great Dane');
INSERT INTO breed_image (image_path, breed_id) values ('great-dane-3', 'Great Dane');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('gentle', 'Great Dane');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Great Dane');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('graceful', 'Great Dane');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('affectionate', 'Great Dane');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Doberman Pinscher', 'A powerful and intelligent breed, known for its loyalty and guard dog abilities.', 'Doberman Pinschers are powerful and athletic dogs, known for their intelligence and loyalty. They are often used as guard dogs due to their alert and fearless nature. Dobermans are loyal to their owners and can be great family pets when trained and socialized properly. They require regular exercise to stay fit and healthy and thrive on mental stimulation.');
INSERT INTO breed_image (image_path, breed_id) values ('doberman-pinscher-1', 'Doberman Pinscher');
INSERT INTO breed_image (image_path, breed_id) values ('doberman-pinscher-2', 'Doberman Pinscher');
INSERT INTO breed_image (image_path, breed_id) values ('doberman-pinscher-3', 'Doberman Pinscher');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('powerful', 'Doberman Pinscher');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'Doberman Pinscher');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('loyal', 'Doberman Pinscher');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('alert', 'Doberman Pinscher');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Australian Shepherd', 'A smart and work-oriented breed, known for its herding skills.', 'Australian Shepherds are intelligent and energetic dogs with a strong herding and guarding instinct. They are versatile and easily trained, excelling in various dog sports. Aussies are loyal companions and have a protective nature. They require a lot of physical exercise and mental stimulation to stay happy and healthy. Their coat is of medium length and requires regular grooming.');
INSERT INTO breed_image (image_path, breed_id) values ('australian-shephard-1', 'Australian Shepherd');
INSERT INTO breed_image (image_path, breed_id) values ('australian-shephard-2', 'Australian Shepherd');
INSERT INTO breed_image (image_path, breed_id) values ('australian-shephard-3', 'Australian Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'Australian Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('energetic', 'Australian Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('loyal', 'Australian Shepherd');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('protective', 'Australian Shepherd');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Cavalier King Charles Spaniel', 'A small and elegant breed, known for its affectionate nature and beautiful coat.', 'Cavalier King Charles Spaniels are known for their affectionate nature and elegant appearance. They have a silky, smooth coat and a gentle expression. Cavaliers are adaptable and get along well with children and other pets. They are curious and playful, yet also enjoy relaxing with their owners. Regular grooming is required to maintain their coat, and they should be monitored for health issues typical of the breed.');
INSERT INTO breed_image (image_path, breed_id) values ('cavalier-king-charles-spaniel-1', 'Cavalier King Charles Spaniel');
INSERT INTO breed_image (image_path, breed_id) values ('cavalier-king-charles-spaniel-2', 'Cavalier King Charles Spaniel');
INSERT INTO breed_image (image_path, breed_id) values ('cavalier-king-charles-spaniel-3', 'Cavalier King Charles Spaniel');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('affectionate', 'Cavalier King Charles Spaniel');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('elegant', 'Cavalier King Charles Spaniel');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('playful', 'Cavalier King Charles Spaniel');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('curious', 'Cavalier King Charles Spaniel');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Shih Tzu', 'A small but sturdy breed, known for its long, flowing coat and friendly personality.', 'Shih Tzus are small, sturdy dogs known for their long, flowing coat and distinctive facial features. They have a friendly and affectionate personality, making them great companions. Despite their small size, they are quite confident and can have a stubborn streak. Shih Tzus are adaptable to various living situations and do well in apartments. Regular grooming is necessary to keep their coat in good condition.');
INSERT INTO breed_image (image_path, breed_id) values ('shih-tzu-1', 'Shih Tzu');
INSERT INTO breed_image (image_path, breed_id) values ('shih-tzu-2', 'Shih Tzu');
INSERT INTO breed_image (image_path, breed_id) values ('shih-tzu-3', 'Shih Tzu');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Shih Tzu');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('sturdy', 'Shih Tzu');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('confident', 'Shih Tzu');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('affectionate', 'Shih Tzu');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Pembroke Welsh Corgi', 'A small and intelligent breed, known for its short stature and herding ability.', 'Pembroke Welsh Corgis are small but intelligent and active dogs. They are known for their short legs and long body, which were ideal for herding cattle and sheep. Corgis are friendly and playful, making them great companions. They are also known for their loyalty and alertness. Regular exercise is important for this breed, as well as consistent training to manage their strong herding instinct.');
INSERT INTO breed_image (image_path, breed_id) values ('pembroke-welsh-corgi-1', 'Pembroke Welsh Corgi');
INSERT INTO breed_image (image_path, breed_id) values ('pembroke-welsh-corgi-2', 'Pembroke Welsh Corgi');
INSERT INTO breed_image (image_path, breed_id) values ('pembroke-welsh-corgi-3', 'Pembroke Welsh Corgi');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'Pembroke Welsh Corgi');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('active', 'Pembroke Welsh Corgi');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('friendly', 'Pembroke Welsh Corgi');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('loyal', 'Pembroke Welsh Corgi');

INSERT INTO dog_breed (id, short_description, long_description)
values ('Miniature Schnauzer', 'A small breed with a distinctive beard and eyebrows, known for its spirited personality.', 'Miniature Schnauzers are small dogs known for their distinctive facial features, including a beard and eyebrows. They are spirited and energetic, with a friendly and obedient nature. Miniature Schnauzers are highly intelligent and trainable. They are good watchdogs and have a playful side, enjoying interactive games. Regular grooming is required to maintain their distinctive coat.');
INSERT INTO breed_image (image_path, breed_id) values ('miniature-schnauzer-1', 'Miniature Schnauzer');
INSERT INTO breed_image (image_path, breed_id) values ('miniature-schnauzer-2', 'Miniature Schnauzer');
INSERT INTO breed_image (image_path, breed_id) values ('miniature-schnauzer-3', 'Miniature Schnauzer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('spirited', 'Miniature Schnauzer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('energetic', 'Miniature Schnauzer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('intelligent', 'Miniature Schnauzer');
INSERT INTO breed_characteristic (characteristic_pk, breed_id) values ('playful', 'Miniature Schnauzer');

