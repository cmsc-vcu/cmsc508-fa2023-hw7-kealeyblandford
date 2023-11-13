# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills(id, name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE Table skills (
    skills_id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL DEFAULT '(default description)',
    tag varchar(255) NOT NULL,
    url varchar(255),
    time_commitment varchar(255),
    primary key (skills_id)
);

# SELECT * FROM skills;

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, name, description, tag, url, time_commitment) values
    (1, 'mind reading', 'ability to read minds without needing cerebro', 'Skill 1', 'mindreading.com', '10+ years'),
    (2, 'coding', 'can type on computer to make it do stuff', 'Skill 2', 'code.com', '2 years'),
    (3, 'piano', 'can play a cool little song', 'Skill 3', 'piano.com', '1 week'),
    (4, 'ice skating', 'able to do a triple axel twice', 'Skill 4', 'iceskating.com', '1 year'),
    (5, 'force using', 'able to use the force without turning to the dark side', 'Skill 5', 'usetheforce.com', '5 years'),
    (6, 'dance', 'can stay on beat', 'Skill 6', 'dancedancerevolution.com', '8 years'),
    (7, 'public speaking', 'ability to not cry or stutter when talking in front of 1,000 people', 'Skill 7', 'publicspeaking.com', '6 months'),
    (8, 'crocheting', 'ablility to make a big and soft blanket for me', 'Skill 8', 'crocheting.com', '8 months');

# SELECT * FROM skills;

# Section 4
# Create people(id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255) NOT NULL,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined date default (current_date) NOT NULL,
    primary key (people_id)
);

# SELECT * from people;

# Section 5
# Populate people with ten people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio) values
    (1, 'Kealey', 'Person 1', 'kealey@gmail.com', 'linkedin.kealey.com', 'headshot.kealey.com', 'itskealey', 'the best person'),
    (2, 'Kiwi', 'Person 2', 'kiwi@gmail.com', 'linkedin.kiwi.com', 'headshot.kiwi.com', 'itskiwi', 'the second best person'),
    (3, 'Kelso', 'Person 3', 'kelso@gmail.com', 'linkedin.kelso.com', 'headshot.kelso.com', 'itskelso', 'the third best person'),
    (4, 'Keals', 'Person 4', 'keals@gmail.com', 'linkedin.keals.com', 'headshot.keals.com', 'itskeals', 'the fouth best person'),
    (5, 'Kyle', 'Person 5', 'kyle@gmail.com', 'linkedin.kyle.com', 'headshot.kyle.com', 'itskyle', 'the fifth best person'),
    (6, 'Kevin', 'Person 6', 'kevin@gmail.com', 'linkedin.kevin.com', 'headshot.kevin.com', 'itskevin', 'the sixth best person'),
    (7, 'Kelly', 'Person 7', 'kelly@gmail.com', 'linkedin.kelly.com', 'headshot.kelly.com', 'itskelly', 'the seventh best person'),
    (8, 'Kelsey', 'Person 8', 'kelsey@gmail.com', 'linkedin.kelsey.com', 'headshot.kelsey.com', 'itskelsey', 'the eighth best person'),
    (9, 'Kaylee', 'Person 9', 'kaylee@gmail.com', 'linkedin.kaylee.com', 'headshot.kaylee.com', 'itskaylee', 'the nineth best person'),
    (10, 'Cosmo', 'Person 10', 'cosmo@gmail.com', 'linkedin.cosmo.com', 'headshot.cosmo.com', 'itscosmo', 'the tenth best person');

# SELECT * from people;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int auto_increment,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date default (current_date),
    primary key (peopleskills_id),
    foreign key (skills_id) references skills (skills_id) on delete cascade,
    foreign key (people_id) references people (people_id),
    unique (skills_id, people_id)
);

# SELECT * from peopleskills;

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (people_id, skills_id) values
    (1,1),
    (1,3),
    (1,6),
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);

# SELECT * FROM peopleskills;
# SELECT count(*) FROM peopleskills;

# joined table of people and their skills
# SELECT
#     name,
#     count(*)
# FROM
#     peopleskills a
#     INNER JOIN people b ON (a.people_id=b.people_id)
#     INNER JOIN skills c on (a.skills_id=c.skills_id)
# GROUP BY
#     name
# ;

# DELETE FROM skills where skills_id=3;

# table of people with no skills
# SELECT
#     last_name
# FROM
#     people a
#         LEFT JOIN peopleskills b ON (a.people_id=b.people_id)
# WHERE
#     b.people_id is NULL
# ;

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    role_id int PRIMARY KEY,
    name varchar(255),
    sort_priority int
);

# SELECT * from roles;

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (role_id, name, sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# SELECT * FROM roles;

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int auto_increment PRIMARY KEY,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date default (current_date) NOT NULL,
    foreign key (people_id) references people (people_id),
    foreign key (role_id) references roles (role_id)
);

# SELECT * FROM peopleroles;

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id) values
    (1,2),
    (2,5),
    (2,6),
    (3,2),
    (3,4),
    (4,3),
    (5,3),
    (6,2),
    (6,1),
    (7,1),
    (8,1),
    (8,4),
    (9,2),
    (10,2),
    (10,1);

# SELECT * FROM peopleroles;

# SELECT
#     *
# FROM
#    peopleroles a
#     INNER JOIN people b ON (a.people_id=b.people_id)
#     INNER JOIN roles c on (a.role_id=c.role_id)
# ;