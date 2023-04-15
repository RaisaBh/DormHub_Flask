SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `dormhub` ;
CREATE SCHEMA IF NOT EXISTS `dormhub` DEFAULT CHARACTER SET latin1 ;
USE `dormhub` ;


-- Fix the start_time and end_time
CREATE TABLE IF NOT EXISTS `dormhub`.`WeeklySchedule`(
  `days_on_shift` DATE  NOT NULL, 
  `start_time`    VARCHAR(8) NOT NULL,
  `end_time`      VARCHAR(8) NOT NULL,
  `ra_id`         INTEGER  NOT NULL,
  PRIMARY KEY (`ra_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('1/24/2023', '8:04 PM','8:43 AM',1);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('1/14/2023','11:23 AM','10:41 AM',2);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('3/11/2023','12:43 AM','3:37 PM',3);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('11/24/2022','10:43 PM','5:43 PM',4);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('12/18/2022','9:43 AM','9:39 AM',5);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('10/9/2022','10:31 PM','6:11 PM',6);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('3/14/2023','3:36 AM','11:19 AM',7);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('2/9/2023','7:29 PM','4:11 AM',8);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('12/11/2022','6:22 PM','2:46 PM',9);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('4/10/2023','4:59 AM','9:06 PM',10);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('12/29/2022','7:26 PM','7:08 PM',11);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('10/9/2022','2:11 PM','1:57 AM',12);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('4/8/2023','10:02 AM','4:20 AM',13);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('2/4/2023','10:11 PM','3:04 PM',14);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('2/28/2023','8:10 PM','12:00 AM',15);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('10/30/2022','7:14 AM','1:43 AM',16);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('4/25/2023','9:25 AM','5:56 AM',17);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('11/9/2022','11:16 AM','7:12 AM',18);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('10/2/2022','10:25 PM','5:29 AM',19);
INSERT INTO `WeeklySchedule`(`days_on_shift`, `start_time`, `end_time`, `ra_id`) VALUES ('2/20/2023','8:32 AM','4:16 PM',20);

CREATE TABLE IF NOT EXISTS `dormhub`.`Attend`(
  `student_id` INTEGER  NOT NULL, 
  `event_id`   INTEGER  NOT NULL,
  PRIMARY KEY (`student_id`),
  FOREIGN KEY (`student_id`) REFERENCES `dormhub`.`Residents` (`student_id`),
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (1,13);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (2,6);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (3,9);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (4,3);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (5,8);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (6,9);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (7,13);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (8,14);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (9,7);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (10,13);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (11,16);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (12,19);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (13,10);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (14,12);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (15,2);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (16,7);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (17,2);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (18,6);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (19,11);
INSERT INTO `Attend`(`student_id`, `event_id`) VALUES (20,4);

CREATE TABLE IF NOT EXISTS `dormhub`.`Calendar`(
  `location`   VARCHAR(25) NOT NULL,
  `date`       DATE  NOT NULL,
  `event`      VARCHAR(413) NOT NULL,
  `student_id` INTEGER  NOT NULL,
  PRIMARY KEY (`student_id`),
  FOREIGN KEY (`student_id`) REFERENCES `dormhub`.`Residents` (`student_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('604 Buhler Avenue','9/19/2022','Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',20);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('763 Arrowood Drive','12/25/2022','Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',20);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('3 Dapin Point','1/24/2023','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.',14);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('9 Stang Avenue','9/14/2022','Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',18);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('06020 Rowland Drive','10/23/2022','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',20);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('985 Lawn Center','11/25/2022','Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',15);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('26148 1st Way','1/17/2023','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',15);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('0 Lighthouse Bay Junction','10/26/2022','Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',6);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('2492 Banding Pass','11/10/2022','Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',12);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('5336 Dorton Pass','2/26/2023','Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',12);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('71761 Talmadge Lane','10/11/2022','Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',20);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('0367 Holmberg Lane','10/18/2022','Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.',10);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('88 Shelley Road','3/25/2023','Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',10);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('49 Spenser Street','9/24/2022','Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.',10);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('12975 Fordem Avenue','9/25/2022','Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.',16);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('52323 Dapin Court','10/25/2022','Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.',11);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('609 Buell Court','1/16/2023','Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',7);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('895 Mandrake Alley','3/6/2023','Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.',16);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('99189 Surrey Point','11/3/2022','Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.',4);
INSERT INTO `Calendar`(`location`, `date`, `event`, `student_id`) VALUES ('4593 Forster Road','11/12/2022','Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.',11);


CREATE TABLE IF NOT EXISTS `dormhub`.`CalendarParticipants`(
  `student_id`   INTEGER  NOT NULL,
  `participants` VARCHAR(451) NOT NULL,
  PRIMARY KEY (`student_id`, `participants`)
  FOREIGN KEY (`student_id`) REFERENCES `dormhub`.`Residents` (`student_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (9,'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (5,'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (15,'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (14,'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (19,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (6,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (19,'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (9,'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (16,'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (7,'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (12,'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (18,'Mauris sit amet eros.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (7,'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (18,'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (17,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (17,'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (1,'Fusce posuere felis sed lacus.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (19,'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (6,'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.');
INSERT INTO `CalendarParticipants`(`student_id`, `participants`) VALUES (6,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.');

CREATE TABLE IF NOT EXISTS `dormhub`.`Chores`(
  `name`         VARCHAR(71) NOT NULL, 
  `deadline`     DATE  NOT NULL,
  `day_assigned` DATE  NOT NULL,
  `student_id`   INTEGER  NOT NULL,
  PRIMARY KEY (`student_id`),
  FOREIGN KEY (`student_id`) REFERENCES `dormhub`.`Residents` (`student_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('elementum ligula vehicula consequat morbi a','4/12/2023','3/5/2023',17);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('pellentesque at nulla suspendisse potenti cras','4/11/2023','10/29/2022',16);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('felis fusce posuere','11/27/2022','1/20/2023',13);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('eros vestibulum ac est lacinia nisi venenatis','9/13/2022','1/8/2023',12);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('vehicula consequat morbi a','1/15/2023','1/12/2023',1);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('magna vulputate luctus cum sociis natoque penatibus et','1/8/2023','4/11/2023',17);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean','4/1/2023','1/29/2023',5);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('pellentesque quisque','2/16/2023','10/19/2022',7);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('turpis eget','2/25/2023','3/8/2023',11);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('in faucibus orci luctus et ultrices posuere','4/22/2023','11/5/2022',9);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('cubilia curae nulla dapibus dolor vel est','9/25/2022','2/16/2023',8);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('commodo vulputate justo in blandit','12/10/2022','2/27/2023',12);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('libero convallis eget','3/15/2023','9/16/2022',6);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('consequat varius integer ac','2/5/2023','3/22/2023',4);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent','4/14/2023','10/20/2022',14);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('cursus vestibulum proin eu mi nulla','10/11/2022','2/14/2023',3);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('felis sed interdum venenatis turpis enim blandit','10/17/2022','2/19/2023',8);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('enim lorem ipsum dolor sit amet consectetuer adipiscing elit','9/8/2022','10/10/2022',13);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('libero ut massa volutpat convallis morbi odio odio elementum eu','10/30/2022','2/1/2023',11);
INSERT INTO `Chores`(`name`, `deadline`, `day_assigned`, `student_id`) VALUES ('arcu adipiscing molestie hendrerit at vulputate','2/12/2023','11/5/2022',20);


CREATE TABLE IF NOT EXISTS `dormhub`.`Events`(
  `event_id`    INTEGER  NOT NULL,
  `date`        DATE  NOT NULL,
  `location`    VARCHAR(12) NOT NULL,
  `last_name`   VARCHAR(9) NOT NULL,
  `middle_name` VARCHAR(9) NOT NULL,
  `first_name`  VARCHAR(8) NOT NULL,
  PRIMARY KEY (`event_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (1,'10/8/2022','Suite 39','Sannes','Erna','Yvor');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (2,'5/10/2022','Room 105','Cromarty','Sterne','Maye');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (3,'5/26/2022','PO Box 43283','Pletts','Chilton','Ermina');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (4,'4/12/2023','4th Floor','Vaulkhard','Rachel','Tisha');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (5,'4/18/2022','Room 1076','Campaigne','Beverly','Ricky');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (6,'10/18/2022','Apt 580','Josef','Del','Beverlie');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (7,'11/20/2022','Suite 96','Normand','Gian','Willow');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (8,'6/9/2022','Apt 1392','O''Riordan','Clint','Timmie');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (9,'11/2/2022','Apt 403','Canham','Eran','Danica');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (10,'3/8/2023','Room 1186','Sharman','Zonnya','Derek');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (11,'6/4/2022','11th Floor','Garrals','Erick','Alene');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (12,'2/23/2023','Room 1140','Treweke','Lishe','Tom');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (13,'2/14/2023','Apt 480','Flexman','Finn','Drucill');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (14,'10/22/2022','13th Floor','Petren','Florencia','Lucia');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (15,'4/28/2022','9th Floor','Blackater','Roderick','Caddric');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (16,'5/13/2022','Room 379','Samworth','Woody','Urbano');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (17,'12/25/2022','Suite 58','Horney','Hermina','Adair');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (18,'7/6/2022','6th Floor','Roth','Colas','Roxine');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (19,'9/26/2022','Apt 820','Pressland','Amalia','Hobie');
INSERT INTO `Events`(`event_id`, `date`, `location`, `last_name`, `middle_name`, `first_name`) VALUES (20,'8/27/2022','PO Box 69545','Seif','Brock','Robers');


​​CREATE TABLE IF NOT EXISTS `dormhub`.`EventParticipants`(
  `event_id`     INTEGER  NOT NULL, 
  `participants` VARCHAR(389) NOT NULL,
  PRIMARY KEY (`event_id`, `participants`),
  FOREIGN KEY (`event_id`) REFERENCES `dormhub`.`Events` (`event_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (19,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (9,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (3,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (12,'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (19,'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (16,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (6,'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (7,'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (4,'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (14,'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (4,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (13,'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (6,'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (14,'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (2,'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (8,'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (6,'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (11,'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (19,'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.');
INSERT INTO `EventParticipants`(`event_id`, `participants`) VALUES (7,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.');


CREATE TABLE SpotifyPlaylist(
  student_id INTEGER  NOT NULL 
  artist     VARCHAR(18) NOT NULL
  album      VARCHAR(10) NOT NULL
  genre      VARCHAR(31) NOT NULL
  song       VARCHAR(11) NOT NULL
  PRIMARY KEY (student_id),
  FOREIGN KEY (student_id) REFERENCES Residents (student_id)
);
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (8,'Reade Yesinov','montes','Crime|Mystery|Thriller','erat');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (13,'Sean Masedon','justo','Drama','in');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (18,'Dolf Haighton','suscipit','Comedy','aliquet');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (12,'Latia Dering','amet','Documentary','amet');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (1,'Maudie Rubbert','volutpat','Drama|Musical','in');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (15,'Troy Fairbank','ut','Comedy','faucibus');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (7,'Lanny Skeath','lectus','Comedy|Romance','tincidunt');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (3,'Joanna Timlett','mi','Action|Adventure|Comedy','nulla');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (14,'Cobbie Fassmann','sit','Comedy','luctus');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (16,'Deny McGeagh','nec','Comedy|Documentary','tempus');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (5,'Thacher Penhearow','sed','Drama|Romance|War','eros');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (9,'Cammy Melmeth','aliquam','Drama','eget');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (6,'Lynnette Pawling','magna','Animation|Children','suscipit');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (14,'Al Mazzia','in','Drama','suspendisse');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (8,'Kelsey Kingsbury','donec','Drama|Romance','sit');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (4,'Tyrone Gallyon','nulla','Horror|Sci-Fi|Thriller','metus');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (16,'Alicia Brandts','aliquet','Comedy','amet');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (7,'Elbertina Bryceson','elementum','Drama|Fantasy','in');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (3,'Jonis Grote','adipiscing','Comedy|Crime|Drama','in');
INSERT INTO SpotifyPlaylist(student_id,artist,album,genre,song) VALUES (9,'Roderic Defont','amet','Action|Adventure|Comedy|Romance','justo');


CREATE TABLE ResidentsRA(
   ra_id      INTEGER  NOT NULL PRIMARY KEY 
  ,student_id INTEGER  NOT NULL
  PRIMARY KEY (student_id),
  FOREIGN KEY (student_id) REFERENCES Residents (student_id)
);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (1,17);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (2,11);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (3,17);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (4,11);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (5,13);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (6,6);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (7,13);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (8,15);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (9,11);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (10,15);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (11,4);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (12,18);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (13,1);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (14,16);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (15,3);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (16,2);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (17,20);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (18,20);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (19,13);
INSERT INTO ResidentsRA(ra_id,student_id) VALUES (20,9);


CREATE TABLE Residents(
   student_id      INTEGER  NOT NULL PRIMARY KEY 
  ,rd_id           INTEGER  NOT NULL
  ,ra_id           INTEGER  NOT NULL
  ,email           VARCHAR(27) NOT NULL
  ,year            INTEGER  NOT NULL
  ,semester        VARCHAR(117) NOT NULL
  ,last_name       VARCHAR(12) NOT NULL
  ,middle_name     VARCHAR(8) NOT NULL
  ,first_name      VARCHAR(9) NOT NULL
  ,floor           INTEGER  NOT NULL
  ,building_number INTEGER  NOT NULL
  ,room_number     INTEGER  NOT NULL
  ,phone_number    VARCHAR(12) NOT NULL
  ,perm_address    VARCHAR(12) NOT NULL
  PRIMARY KEY (student_id),
  FOREIGN KEY (rd_id) REFERENCES ResidentDirector (rd_id),
  FOREIGN KEY (ra_id) REFERENCES Events (ra_id)
);
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (1,9,15,'hillingsworth0@live.com',2012,'turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus','Illingsworth','Veronike','Hasty',1,1,7895,'522-975-0695','Suite 89');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (2,1,13,'ideverick1@wunderground.com',1994,'adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue','Deverick','Inglis','Isadora',2,2,422,'174-371-9142','Suite 41');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (3,16,7,'rboothe2@hp.com',1987,'interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien','Boothe','Kiel','Raine',3,3,6,'610-183-5299','Apt 1228');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (4,4,16,'sjosefowicz3@guardian.co.uk',2006,'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus','Josefowicz','Kesley','Sawyere',4,4,97812,'647-583-6383','Apt 620');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (5,17,12,'glongbothom4@nifty.com',1999,'consequat in consequat ut nulla sed accumsan felis ut at dolor','Longbothom','Chariot','Gennie',5,5,67,'268-996-8385','Room 1139');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (6,9,11,'nschild5@dailymotion.com',2008,'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna','Schild','Rayna','Nixie',6,6,0569,'220-792-8377','Apt 441');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (7,15,9,'aguisler6@g.co',1997,'sit amet lobortis sapien sapien non mi integer ac neque duis','Guisler','Jess','Athena',7,7,3,'116-784-0704','Apt 1510');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (8,19,8,'jladbrooke7@jugem.jp',2003,'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed','Ladbrooke','Merle','Jason',8,8,91,'909-837-4002','Apt 36');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (9,11,17,'tlysaght8@youtube.com',1994,'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id','Lysaght','Sandie','Thatch',9,9,0505,'522-632-7898','18th Floor');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (10,12,15,'oshailer9@histats.com',2005,'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non','Shailer','Malena','Oliviero',10,10,779,'171-399-7934','12th Floor');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (11,11,8,'rbodycotea@arizona.edu',2010,'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia','Bodycote','Fleur','Remy',11,11,2,'258-526-5276','7th Floor');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (12,17,18,'proddersb@virginia.edu',2006,'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue','Rodders','Annice','Peg',12,12,8211,'105-863-6893','Apt 1698');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (13,7,14,'cdiessc@zimbio.com',2007,'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum','Diess','Tedda','Celestyna',13,13,06795,'750-122-8201','Apt 1077');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (14,9,13,'pseamond@sogou.com',2005,'suspendisse ornare consequat lectus in est risus auctor sed tristique in','Seamon','Ira','Patrice',14,14,077,'251-836-2458','Suite 73');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (15,15,4,'iacorye@wp.com',2003,'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo','Acory','Osmund','Inessa',15,15,04984,'676-523-0294','10th Floor');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (16,20,14,'gduffettf@cisco.com',2009,'nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac','Duffett','Gilbert','Goldie',16,16,19,'581-767-7952','Apt 818');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (17,6,7,'alacyg@va.gov',1990,'nulla nunc purus phasellus in felis donec semper sapien a','Lacy','Dev','Angel',17,17,983,'202-730-8450','Room 654');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (18,2,20,'hbroadheadh@ted.com',1996,'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat','Broadhead','Susana','Hasty',18,18,085,'672-876-2029','Room 346');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (19,10,18,'rwilflingeri@mysql.com',2008,'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent','Wilflinger','Haydon','Raynor',19,19,9421,'303-606-5553','Room 1803');
INSERT INTO Residents(student_id,rd_id,ra_id,email,year,semester,last_name,middle_name,first_name,floor,building_number,room_number,phone_number,perm_address) VALUES (20,16,14,'rtytj@mozilla.org',2004,'lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit','Tyt','Felicity','Reinaldos',20,20,621,'177-890-7462','PO Box 31407');


CREATE TABLE ResidentRoommates(
   student_id INTEGER  NOT NULL PRIMARY KEY 
  ,roommates  VARCHAR(125) NOT NULL
  PRIMARY KEY (student_id, roommates),
  FOREIGN KEY (student_id) REFERENCES Residents (student_id)
);
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (16,'lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (17,'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (4,'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (19,'duis bibendum morbi non quam nec dui luctus rutrum nulla tellus');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (4,'pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (11,'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (11,'nec sem duis aliquam convallis nunc proin at turpis a pede posuere');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (10,'nisl duis bibendum felis sed interdum venenatis turpis enim blandit');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (1,'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (6,'suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (1,'augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (20,'rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (17,'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (3,'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (11,'nulla facilisi cras non velit nec nisi vulputate nonummy maecenas');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (16,'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (15,'diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (6,'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (20,'odio consequat varius integer ac leo pellentesque ultrices mattis odio');
INSERT INTO ResidentRoommates(student_id,roommates) VALUES (7,'massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero');


CREATE TABLE GroceryList(
   event_id    INTEGER  NOT NULL PRIMARY KEY 
  ,date        DATE  NOT NULL
  ,location    VARCHAR(12) NOT NULL
  ,last_name   VARCHAR(9) NOT NULL
  ,middle_name VARCHAR(9) NOT NULL
  ,first_name  VARCHAR(8) NOT NULL
  PRIMARY KEY (student_id),
  FOREIGN KEY (student_id) REFERENCES Residents (student_id)
);
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Lucilia Bing,'47','32','11/9/2022','sapien','2');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Lizzie Haining,'14','81','11/19/2022','nam','20');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Gwenette Visick,'22','28','3/17/2023','sit','3');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Gena Sterricker,'51','98','3/3/2023','semper','8');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Miner McRobert,'76','98','10/10/2022','commodo','17');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Egan Bilovsky,'19','88','9/22/2022','quis','3');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Bordie Dowrey,'61','79','2/21/2023','lacinia','17');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Crystal Colthard,'91','14','3/30/2023','in','6');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Levon Lightman,'33','52','1/8/2023','erat','6');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Maximilien Atwel,'50','34','10/28/2022','sit','14');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Lanny Burfield,'27','5','1/20/2023','dictumst','11');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Tonnie Hebditch,'73','93','10/17/2022','ante','14');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Laura Ridley,'72','60','9/27/2022','curabitur','13');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Kingston Arsnell,'97','85','11/16/2022','nulla','13');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Nedi Adamiak,'71','74','2/1/2023','ligula','3');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Colleen Viall,'3','100','3/29/2023','erat','19');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Weston Mannooch,'77','2','11/20/2022','ipsum','16');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Dev Beauvais,'87','80','9/22/2022','eget','1');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Marian Spileman,'58','76','4/4/2023','porta','2');
INSERT INTO GroceryList(event_id,date,location,last_name,middle_name,first_name) VALUES (Kristian Delacour,'26','23','9/7/2022','eget','7');


CREATE TABLE ResidentDirector(
   email           VARCHAR(28) NOT NULL PRIMARY KEY
  ,start_date      DATE  NOT NULL
  ,last_name       VARCHAR(13) NOT NULL
  ,middle_name     VARCHAR(9) NOT NULL
  ,first_name      VARCHAR(9) NOT NULL
  ,building_number INTEGER  NOT NULL
  ,perm_address    VARCHAR(22) NOT NULL
  ,ra_id           INTEGER  NOT NULL
  ,rd_id           INTEGER  NOT NULL
  PRIMARY KEY (rd_id),
  FOREIGN KEY (ra_id) REFERENCES WeeklySchedule (ra_id)
);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('mtreadaway0@51.la','2/17/2023','Treadaway','Shannan','Milly',1,'0 Dunning Court',5,1);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('froly1@so-net.ne.jp','1/16/2023','Roly','Alvie','Frayda',2,'64 Warbler Point',7,2);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('pjeffress2@bing.com','11/21/2022','Jeffress','Curcio','Pancho',3,'8 Kedzie Plaza',15,3);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('vsaull3@businessweek.com','4/13/2023','Saull','Andie','Valentina',4,'215 Westridge Lane',18,4);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('hphilippson4@hugedomains.com','12/4/2022','Philippson','Kelsi','Henrieta',5,'8 Mosinee Drive',10,5);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('kmcbrearty5@clickbank.net','11/1/2022','McBrearty','Tootsie','Keene',6,'8 Lakewood Place',8,6);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('pwiley6@cam.ac.uk','9/11/2022','Wiley','Tory','Prudi',7,'67 Hanson Road',8,7);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('fbedbrough7@geocities.com','11/2/2022','Bedbrough','Codie','Frasco',8,'04 Hansons Circle',5,8);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('hliddiard8@parallels.com','9/18/2022','Liddiard','Bertie','Hoebart',9,'8 Heffernan Street',7,9);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('ivonhelmholtz9@netscape.com','2/3/2023','Von Helmholtz','Saidee','Imojean',10,'90 Sullivan Court',8,10);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('jgreathama@list-manage.com','1/13/2023','Greatham','Shurlocke','Jessie',11,'359 Lakewood Alley',14,11);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('ddurnallb@jalbum.net','12/15/2022','Durnall','Tiff','Doro',12,'212 Debs Street',2,12);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('obukowskic@virginia.edu','3/28/2023','Bukowski','Aluino','Orbadiah',13,'210 Luster Crossing',13,13);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('elinwoodd@cbc.ca','1/5/2023','Linwood','Bennie','Emmit',14,'9116 Express Pass',13,14);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('mgrinvale@zimbio.com','4/21/2023','Grinval','Libbie','Meade',15,'163 Loomis Drive',15,15);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('khaburnef@buzzfeed.com','1/9/2023','Haburne','Kenon','Kaja',16,'126 International Road',7,16);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('njewettg@nature.com','12/5/2022','Jewett','Frankie','Nina',17,'3 Sloan Road',6,17);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('wcunradoh@symantec.com','10/7/2022','Cunrado','Austine','Willyt',18,'332 New Castle Place',20,18);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('hdarkinsi@reverbnation.com','3/30/2023','Darkins','Rourke','Hynda',19,'19 John Wall Alley',11,19);
INSERT INTO ResidentDirector(email,start_date,last_name,middle_name,first_name,building_number,perm_address,ra_id,rd_id) VALUES ('rwarfieldj@chron.com','11/29/2022','Warfield','Dew','Ruby',20,'9 Grover Place',10,20);


CREATE TABLE ResidentInterests(
   student_id INTEGER  NOT NULL PRIMARY KEY 
  ,interests  VARCHAR(496) NOT NULL
  PRIMARY KEY (student_id, interests),
  FOREIGN KEY (student_id) REFERENCES Residents (student_id)
);
INSERT INTO ResidentInterests(student_id,interests) VALUES (7,'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (16,'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (1,'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (16,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (16,'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (8,'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (4,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (3,'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (3,'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (12,'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (7,'Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (17,'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (15,'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (3,'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (15,'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (3,'Donec ut mauris eget massa tempor convallis.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (10,'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (4,'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (15,'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
INSERT INTO ResidentInterests(student_id,interests) VALUES (2,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');

CREATE TABLE IF NOT EXISTS `dormhub`.`ResidentMajor`(
  `student_id` INTEGER  NOT NULL PRIMARY KEY ,
  `interests`  VARCHAR(496) NOT NULL,
  PRIMARY KEY (`student_id`, `major`),
  FOREIGN KEY (`student_id`) REFERENCES `dormhub`.`Residents` (`student_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (20,'at');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (6,'in');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (2,'aliquam');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (10,'turpis');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (10,'gravida');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (6,'in');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (6,'eget');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (17,'pede');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (10,'nulla');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (10,'ornare');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (1,'nisl');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (5,'vestibulum');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (18,'in');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (5,'ullamcorper');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (10,'ut');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (2,'aliquet');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (5,'morbi');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (13,'at');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (10,'suspendisse');
INSERT INTO `ResidentMajor`(`student_id`, `interests`) VALUES (5,'quam');


CREATE TABLE IF NOT EXISTS `dormhub`.`ResidentMinor` (
  `student_id` INTEGER  NOT NULL PRIMARY KEY,
  `roommates`  VARCHAR(125) NOT NULL,
  PRIMARY KEY (`student_id`, `minor`),
  FOREIGN KEY (`student_id`) REFERENCES `dormhub`.`Residents` (`student_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (16,'arcu sed augue aliquam erat');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (18,'varius integer');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (17,'proin leo odio');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (4,'nullam porttitor lacus at');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (5,'id luctus nec molestie sed');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (18,'viverra pede ac diam cras');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (18,'tincidunt ante vel');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (10,'quis orci nullam molestie nibh');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (10,'nulla eget');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (3,'quisque id justo sit amet');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (8,'vel augue vestibulum ante');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (11,'turpis donec');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (7,'sem duis');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (20,'quam suspendisse potenti nullam');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (6,'hendrerit at');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (17,'orci luctus et ultrices posuere');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (10,'quis libero nullam sit');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (7,'mauris lacinia sapien');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (10,'lobortis ligula');
INSERT INTO `ResidentMinor`(`student_id`, `roommates`) VALUES (6,'amet sapien');

CREATE TABLE IF NOT EXISTS `dormhub`.`RoommateConflict` (
  `email`          VARCHAR(36) NOT NULL PRIMARY KEY,
  `description`    VARCHAR(334) NOT NULL,
  `floor_number`    INTEGER  NOT NULL, 
  `building_number` INTEGER  NOT NULL,
  `rd_id`           INTEGER  NOT NULL,
  `student_id`      INTEGER  NOT NULL,
  PRIMARY KEY (`student_id`),
  FOREIGN KEY (`rd_id`) REFERENCES `dormhub`.`ResidentDirector` (`rd_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('opetrovsky0@behance.net','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',1,1,18,1);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('ncommander1@rakuten.co.jp','Nulla tellus. In sagittis dui vel nisl.',2,2,9,2);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('sfricke2@ebay.co.uk','Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',3,3,8,3);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('dmoar3@stanford.edu','Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.',4,4,19,4);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('mheadings4@senate.gov','Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',5,5,1,5);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('gbootell5@utexas.edu','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',6,6,17,6);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('cvile6@flickr.com','Maecenas ut massa quis augue luctus tincidunt.',7,7,3,7);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('lphilippson7@gizmodo.com','Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',8,8,18,8);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('snestle8@wsj.com','Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',9,9,8,9);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('ccoronas9@independent.co.uk','Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.',10,10,1,10);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('acouvea@comcast.net','Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',11,11,2,11);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('ghamblettb@nature.com','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.',12,12,17,12);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('ckainesc@theguardian.com','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',13,13,20,13);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('mleftwichd@dedecms.com','Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',14,14,10,14);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('mnuccie@theguardian.com','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',15,15,14,15);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('mtewesf@amazonaws.com','Vivamus tortor.',16,16,18,16);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('yassanteg@yelp.com','Duis aliquam convallis nunc.',17,17,16,17);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('pcoulstonh@imgur.com','Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.',18,18,14,18);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('syannikovi@army.mil','Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',19,19,17,19);
INSERT INTO `RoommateConflict`(`email`, `description`, `floor_number`, `building_number`, `rd_id`, `student_id`) VALUES ('wstarrj@unesco.org','Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',20,20,15,20);