BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "firstapp_product" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL,
	"vendor"	varchar(150) NOT NULL,
	"product_image"	varchar(100),
	"quantity"	integer NOT NULL,
	"original_price"	real NOT NULL,
	"selling_price"	real NOT NULL,
	"description"	text NOT NULL,
	"status"	bool NOT NULL,
	"trending"	bool NOT NULL,
	"created_at"	datetime NOT NULL,
	"category_id"	bigint NOT NULL,
	FOREIGN KEY("category_id") REFERENCES "firstapp_catagory"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "firstapp_catagory" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL,
	"image"	varchar(100),
	"status"	bool NOT NULL,
	"created_at"	datetime NOT NULL,
	"description"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "firstapp_cart" (
	"id"	integer NOT NULL,
	"product_qty"	integer NOT NULL,
	"created_at"	datetime NOT NULL,
	"product_id"	bigint NOT NULL,
	"user_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("product_id") REFERENCES "firstapp_product"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "firstapp_favourite" (
	"id"	integer NOT NULL,
	"created_at"	datetime NOT NULL,
	"product_id"	bigint NOT NULL,
	"user_id"	integer NOT NULL,
	FOREIGN KEY("product_id") REFERENCES "firstapp_product"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2023-11-14 05:30:27.763528');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2023-11-14 05:30:28.076025');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2023-11-14 05:30:28.404754');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2023-11-14 05:30:28.593417');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-11-14 05:30:28.801991');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2023-11-14 05:30:29.099586');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2023-11-14 05:30:29.449351');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2023-11-14 05:30:29.664639');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2023-11-14 05:30:29.977188');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2023-11-14 05:30:30.133432');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2023-11-14 05:30:30.322747');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-11-14 05:30:30.557130');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2023-11-14 05:30:30.713377');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-11-14 05:30:30.900870');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2023-11-14 05:30:31.072755');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2023-11-14 05:30:31.260254');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-11-14 05:30:31.416500');
INSERT INTO "django_migrations" VALUES (18,'sessions','0001_initial','2023-11-14 05:30:31.760389');
INSERT INTO "django_migrations" VALUES (19,'firstapp','0001_initial','2023-11-15 01:27:03.604807');
INSERT INTO "django_migrations" VALUES (20,'firstapp','0002_alter_catagory_description_alter_catagory_status_and_more','2023-11-22 01:31:24.187864');
INSERT INTO "django_migrations" VALUES (21,'firstapp','0003_favourite','2023-11-23 03:09:44.050211');
INSERT INTO "django_admin_log" VALUES (105,'42','product object (42)',1,'[{"added": {}}]',8,12,'2023-11-22 11:47:04.537872');
INSERT INTO "django_admin_log" VALUES (106,'42','product object (42)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-22 11:50:00.496897');
INSERT INTO "django_admin_log" VALUES (107,'43','product object (43)',1,'[{"added": {}}]',8,12,'2023-11-22 11:53:04.800136');
INSERT INTO "django_admin_log" VALUES (108,'43','product object (43)',2,'[]',8,12,'2023-11-22 11:53:20.824177');
INSERT INTO "django_admin_log" VALUES (109,'44','product object (44)',1,'[{"added": {}}]',8,12,'2023-11-22 11:55:54.759660');
INSERT INTO "django_admin_log" VALUES (110,'45','product object (45)',1,'[{"added": {}}]',8,12,'2023-11-22 11:59:03.053769');
INSERT INTO "django_admin_log" VALUES (111,'46','product object (46)',1,'[{"added": {}}]',8,12,'2023-11-22 12:03:51.661701');
INSERT INTO "django_admin_log" VALUES (112,'46','product object (46)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-22 12:04:38.437487');
INSERT INTO "django_admin_log" VALUES (113,'47','product object (47)',1,'[{"added": {}}]',8,12,'2023-11-22 12:13:56.329164');
INSERT INTO "django_admin_log" VALUES (114,'48','product object (48)',1,'[{"added": {}}]',8,12,'2023-11-22 12:16:32.393239');
INSERT INTO "django_admin_log" VALUES (115,'48','product object (48)',2,'[]',8,12,'2023-11-22 12:17:05.252047');
INSERT INTO "django_admin_log" VALUES (116,'47','product object (47)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-22 12:17:59.874745');
INSERT INTO "django_admin_log" VALUES (117,'49','product object (49)',1,'[{"added": {}}]',8,12,'2023-11-23 06:12:36.830701');
INSERT INTO "django_admin_log" VALUES (118,'50','product object (50)',1,'[{"added": {}}]',8,12,'2023-11-23 11:42:58.822453');
INSERT INTO "django_admin_log" VALUES (119,'51','product object (51)',1,'[{"added": {}}]',8,12,'2023-11-23 11:45:50.133736');
INSERT INTO "django_admin_log" VALUES (120,'52','product object (52)',1,'[{"added": {}}]',8,12,'2023-11-23 11:48:22.182359');
INSERT INTO "django_admin_log" VALUES (121,'52','product object (52)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-23 11:48:34.238594');
INSERT INTO "django_admin_log" VALUES (122,'53','product object (53)',1,'[{"added": {}}]',8,12,'2023-11-23 11:52:03.377595');
INSERT INTO "django_admin_log" VALUES (123,'54','product object (54)',1,'[{"added": {}}]',8,12,'2023-11-23 11:57:54.339655');
INSERT INTO "django_admin_log" VALUES (124,'55','product object (55)',1,'[{"added": {}}]',8,12,'2023-11-23 12:01:24.051416');
INSERT INTO "django_admin_log" VALUES (125,'56','product object (56)',1,'[{"added": {}}]',8,12,'2023-11-23 12:07:37.876001');
INSERT INTO "django_admin_log" VALUES (126,'57','product object (57)',1,'[{"added": {}}]',8,12,'2023-11-23 12:12:10.763891');
INSERT INTO "django_admin_log" VALUES (127,'58','product object (58)',1,'[{"added": {}}]',8,12,'2023-11-23 12:16:29.607016');
INSERT INTO "django_admin_log" VALUES (128,'59','product object (59)',1,'[{"added": {}}]',8,12,'2023-11-23 12:19:33.336953');
INSERT INTO "django_admin_log" VALUES (129,'60','product object (60)',1,'[{"added": {}}]',8,12,'2023-11-23 12:21:53.212697');
INSERT INTO "django_admin_log" VALUES (130,'61','product object (61)',1,'[{"added": {}}]',8,12,'2023-11-23 12:23:47.476571');
INSERT INTO "django_admin_log" VALUES (131,'62','product object (62)',1,'[{"added": {}}]',8,12,'2023-11-23 12:26:34.026706');
INSERT INTO "django_admin_log" VALUES (132,'63','product object (63)',1,'[{"added": {}}]',8,12,'2023-11-23 12:28:26.734279');
INSERT INTO "django_admin_log" VALUES (133,'64','product object (64)',1,'[{"added": {}}]',8,12,'2023-11-23 12:33:02.393246');
INSERT INTO "django_admin_log" VALUES (134,'65','product object (65)',1,'[{"added": {}}]',8,12,'2023-11-23 12:35:33.910793');
INSERT INTO "django_admin_log" VALUES (135,'66','product object (66)',1,'[{"added": {}}]',8,12,'2023-11-23 12:37:28.387921');
INSERT INTO "django_admin_log" VALUES (136,'67','product object (67)',1,'[{"added": {}}]',8,12,'2023-11-23 12:39:27.566823');
INSERT INTO "django_admin_log" VALUES (137,'67','product object (67)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-24 04:21:34.238081');
INSERT INTO "django_admin_log" VALUES (138,'67','product object (67)',2,'[]',8,12,'2023-11-24 04:21:57.666381');
INSERT INTO "django_admin_log" VALUES (139,'64','product object (64)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-24 04:22:58.566502');
INSERT INTO "django_admin_log" VALUES (140,'60','product object (60)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-24 04:24:19.305146');
INSERT INTO "django_admin_log" VALUES (141,'68','product object (68)',1,'[{"added": {}}]',8,12,'2023-11-24 04:28:33.428499');
INSERT INTO "django_admin_log" VALUES (142,'69','product object (69)',1,'[{"added": {}}]',8,12,'2023-11-24 04:32:13.277078');
INSERT INTO "django_admin_log" VALUES (143,'70','product object (70)',1,'[{"added": {}}]',8,12,'2023-11-24 04:34:10.712968');
INSERT INTO "django_admin_log" VALUES (144,'70','product object (70)',2,'[{"changed": {"fields": ["Product image"]}}]',8,12,'2023-11-24 04:34:23.518806');
INSERT INTO "django_admin_log" VALUES (145,'71','product object (71)',1,'[{"added": {}}]',8,12,'2023-11-24 04:37:38.736936');
INSERT INTO "django_admin_log" VALUES (146,'7','Hari',3,'',4,12,'2023-11-24 05:18:09.935490');
INSERT INTO "django_admin_log" VALUES (147,'11','HariMuthusamy',3,'',4,12,'2023-11-24 05:18:10.132580');
INSERT INTO "django_admin_log" VALUES (148,'1','Hariharasudhan',3,'',4,12,'2023-11-24 05:18:10.282542');
INSERT INTO "django_admin_log" VALUES (149,'8','karthikkumar',3,'',4,12,'2023-11-24 05:18:10.413926');
INSERT INTO "django_admin_log" VALUES (150,'9','velan',3,'',4,12,'2023-11-24 05:18:10.547206');
INSERT INTO "django_admin_log" VALUES (151,'10','vennila',3,'',4,12,'2023-11-24 05:18:10.704517');
INSERT INTO "django_admin_log" VALUES (152,'11','catagory object (11)',2,'[{"changed": {"fields": ["Description"]}}]',7,12,'2023-11-24 05:18:39.200180');
INSERT INTO "django_admin_log" VALUES (153,'1','catagory object (1)',2,'[{"changed": {"fields": ["Image"]}}]',7,12,'2023-11-24 05:51:21.665097');
INSERT INTO "django_admin_log" VALUES (154,'7','catagory object (7)',2,'[{"changed": {"fields": ["Image"]}}]',7,12,'2023-11-24 05:52:02.077604');
INSERT INTO "django_admin_log" VALUES (155,'8','catagory object (8)',2,'[{"changed": {"fields": ["Image"]}}]',7,12,'2023-11-24 05:52:21.151876');
INSERT INTO "django_admin_log" VALUES (156,'9','catagory object (9)',2,'[{"changed": {"fields": ["Image"]}}]',7,12,'2023-11-24 05:52:41.903896');
INSERT INTO "django_admin_log" VALUES (157,'10','catagory object (10)',2,'[{"changed": {"fields": ["Image"]}}]',7,12,'2023-11-24 05:53:01.590325');
INSERT INTO "django_admin_log" VALUES (158,'11','catagory object (11)',2,'[]',7,12,'2023-11-24 05:53:24.208227');
INSERT INTO "django_admin_log" VALUES (159,'11','catagory object (11)',2,'[{"changed": {"fields": ["Image"]}}]',7,12,'2023-11-24 05:56:31.452647');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'firstapp','catagory');
INSERT INTO "django_content_type" VALUES (8,'firstapp','product');
INSERT INTO "django_content_type" VALUES (9,'firstapp','cart');
INSERT INTO "django_content_type" VALUES (10,'firstapp','favourite');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_catagory','Can add catagory');
INSERT INTO "auth_permission" VALUES (26,7,'change_catagory','Can change catagory');
INSERT INTO "auth_permission" VALUES (27,7,'delete_catagory','Can delete catagory');
INSERT INTO "auth_permission" VALUES (28,7,'view_catagory','Can view catagory');
INSERT INTO "auth_permission" VALUES (29,8,'add_product','Can add product');
INSERT INTO "auth_permission" VALUES (30,8,'change_product','Can change product');
INSERT INTO "auth_permission" VALUES (31,8,'delete_product','Can delete product');
INSERT INTO "auth_permission" VALUES (32,8,'view_product','Can view product');
INSERT INTO "auth_permission" VALUES (33,9,'add_cart','Can add cart');
INSERT INTO "auth_permission" VALUES (34,9,'change_cart','Can change cart');
INSERT INTO "auth_permission" VALUES (35,9,'delete_cart','Can delete cart');
INSERT INTO "auth_permission" VALUES (36,9,'view_cart','Can view cart');
INSERT INTO "auth_permission" VALUES (37,10,'add_favourite','Can add favourite');
INSERT INTO "auth_permission" VALUES (38,10,'change_favourite','Can change favourite');
INSERT INTO "auth_permission" VALUES (39,10,'delete_favourite','Can delete favourite');
INSERT INTO "auth_permission" VALUES (40,10,'view_favourite','Can view favourite');
INSERT INTO "auth_user" VALUES (12,'pbkdf2_sha256$600000$ujsG7YKYroQsK1ExgFO9Tm$ci3jNhqPcC0O1G8xclAoa/QtptM6Uhzp2fCjkq+So6I=','2023-11-27 05:14:01.171515',1,'HariSurya','','harisurya123@gmail.com',1,1,'2023-11-22 05:02:25.554347','');
INSERT INTO "django_session" VALUES ('5fox8s0qxjp4pfqmo3hrnnkb9c7o2vyb','.eJxVjEEOwiAQRe_C2hAGCohL9z0Dmc4MUjVtUtqV8e7apAvd_vfef6mM21rz1mTJI6uLAqtOv-OA9JBpJ3zH6TZrmqd1GQe9K_qgTfczy_N6uH8HFVv91g6EkVKMYpCDSDQO0hlMIogERkLwYimiBKCOik-eHZcgFgu4rhj1_gAQUzhg:1r61vQ:zV8xg-GdyovE-1y5LQT4rV35GPRpti9ER6_YjbMEEl8','2023-12-07 05:06:52.270181');
INSERT INTO "django_session" VALUES ('j8rb79r40yvxbf369lor5y7evggo9fjf','.eJxVjEEOwiAQRe_C2hAGCohL9z0Dmc4MUjVtUtqV8e7apAvd_vfef6mM21rz1mTJI6uLAqtOv-OA9JBpJ3zH6TZrmqd1GQe9K_qgTfczy_N6uH8HFVv91g6EkVKMYpCDSDQO0hlMIogERkLwYimiBKCOik-eHZcgFgu4rhj1_gAQUzhg:1r7TwX:9kux7Wci_EQC3dF9dCp--d9aqG92N221cB-Ok2rGT8E','2023-12-11 05:14:01.247948');
INSERT INTO "firstapp_product" VALUES (1,'iphone14','hari','update/231115033514iphone_14.webp',0,80000.0,75000.0,'DYNAMIC ISLAND COMES TO IPHONE 15 — Dynamic Island bubbles up alerts and Live Activities — so you don’t miss them while you’re doing something else. You can see who’s calling, track your next ride, check your flight status, and so much more.
INNOVATIVE DESIGN — iPhone 15 Plus features a durable color-infused glass and aluminum design. It’s splash, water, and dust resistant.',0,1,'2023-11-15 11:35:14.381271',1);
INSERT INTO "firstapp_product" VALUES (2,'Samsung Galaxy','hari','update/231115044638phone1.webp',10,17999.0,12039.0,'Superfast 5G with 13 5G Bands, Powerful Exynos 1330 Octa Core 2.4GH 5nm processor with latest Android 13 having One UI 5.0 interface
50MP+2MP+2MP Triple camera setup- True 50MP (F1.8) main camera + 2MP (F2.4) + 2MP (F2.4)| 13MP (F2.0) front camera
6000mAh lithium-ion battery, 1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase
16.72 centimeters (6.6-inch) LCD, FHD+ resolution with 1080 x 2408 pixels',0,1,'2023-11-15 12:34:06.661384',1);
INSERT INTO "firstapp_product" VALUES (3,'realme narzo N53','hari','update/231115044749phone2.webp',15,10999.0,8999.0,'Enjoy smooth multitasking and effortless app switching with the powerful 8GB dynamic RAM. Store all your favorite apps, photos, and files with the generous 64GB ROM
Experience lightning-fast charging with the 33W SUPERVOOC technology, getting your device ready in no time. Say goodbye to long charging times and stay powered up for longer durations
The slim and sleek 7.49mm design adds a touch of elegance to your device, making it comfortable to hold and carry. The feather gold design enhances.',0,1,'2023-11-15 12:36:59.339161',1);
INSERT INTO "firstapp_product" VALUES (4,'redmi Note 12 5G','hari','update/231115044847phone3.jpg',10,23999.0,18999.0,'Display: FHD+ AMOLED (1080x2400) Display with 120Hz Refresh rate; 1200nits peak brightness; 240Hz Touch sampling rate
Processor: Snapdragon 4 Gen1 6nm Octa-core 5G processor for high performance and efficiency with Adreno 619 GPU; Up to 2.0GHz
Camera: 48MP AI Triple camera setup with 8MP Ultra Wide sensor and 2MP Macro camera| 13MP Front camera
Battery: 5000 mAh large battery with 33W fast charger in-box and Type-C connectivity
Memory, Storage & SIM: 8GB RAM | 256GB UFS 2.2 storage.',0,1,'2023-11-15 12:39:57.100004',1);
INSERT INTO "firstapp_product" VALUES (5,'OnePlus Nord CE 5g','hari','update/231115093808phone4.jpg',7,30000.0,25000.0,'Camera: 108 MP Main Camera with EIS; 2MP Depth-Assist Lens and 2MP Macro Lens; Front (Selfie) Camera: 16MP
Rear Camera Mode: Hi-res 108MP mode, 3x Lossles Zoom, Photo, Video, Nightscape, Expert, Panoramic, Portrait, Macro, Time-lapse, Slow-motion, Long exposure, Dual-view video, Text Scanner, 1080p/720p@30fps, Video zoom: 1080P@30fps, 720P@30fps, Slow motion: 720P@120fps, Time-Lapse: 1080P@30fps, Steady Video EIS support
Display: 6.72 Inches; 120 Hz Adaptive refresh rate; FHD+(1080×2400),',0,0,'2023-11-15 16:35:50.970034',1);
INSERT INTO "firstapp_product" VALUES (6,'Nokia C12','hari','update/231115084010phone5.webp',16,7500.0,5899.0,'4GB RAM with Memory Extension | 2GB RAM + 2GB Virtual RAM
Fast performing octa-core processor
1 year replacement guarantee
Powerful Night and Portrait modes on the rear and front cameras
Breathtaking 6.3" HD+ display on a phone that''s easy to hold
Android 12 Go Edition with 2 years of quarterly security updates',0,0,'2023-11-15 16:40:10.235836',1);
INSERT INTO "firstapp_product" VALUES (7,'itel p55 5G','hari','update/231115084335phone6.jpg',20,13499.0,9999.0,'Powerful 5G with NRCA
6GB RAM+128GB ROM, Upto 12GB RAM with Memory Fusion
Dimensity 6080
90Hz 6.6" HD+ IPS Display
UMCP Storage
Integrated Aivana Chat GPT Assistant
180 Hz Touch Sampling Rate',0,0,'2023-11-15 16:43:35.761174',1);
INSERT INTO "firstapp_product" VALUES (8,'iQOO Z6 Lite 5G','hari','update/231115093629phone7.jpg',25,19999.0,12999.0,'World''s First Snapdragon 4 Gen 1 Processor, that allows you to level up your performance with confidence through its efficient 6nm Process.
Best In-Segment 120Hz Screen Refresh Rate: Which comes with lagfree & nimble scrolling. The FHD+ display lets you enjoy to the fullest with every game you play and every content you watch with its crisp detailing of colours.
5000mAh Battery: Keeps iQOO Z6 Lite 5G to a longer usage, for a more enjoyable gaming and video experience, which offers Music .',0,0,'2023-11-15 16:46:14.515775',1);
INSERT INTO "firstapp_product" VALUES (9,'vivo Y27','hari','update/231115090007phone8.jpg',25,18999.0,13999.0,'50MP+2MP Rear Camera | 8MP Selfie Camera
16.86 cm (6.64 inch) FHD+ LCD Display
Memory & SIM: 6 GB RAM | 128 GB internal memory
44W FlashCharge with 5000 mAh battery',0,0,'2023-11-15 17:00:07.235096',1);
INSERT INTO "firstapp_product" VALUES (10,'Samsung Galaxy S23 Ultra','hari','update/231115093534phone9.jpg',5,149999.0,100225.0,'CAPTURE THE NIGHT IN LOW LIGHT: Whether you’re headed to a concert or romantic night out, there’s no such thing as bad lighting with Night Mode; Galaxy S23 Ultra lets you capture epic content in any setting with stunning Nightography
HIGHEST PHONE CAMERA RESOLUTION: Create crystal-clear content worth sharing with Galaxy S23 Ultra’s 200MP camera — the highest camera resolution on a phone; Whether you’re posting or printing, Galaxy S23 Ultra always does the moment justice
STUNNINGLY SMOOTH',0,1,'2023-11-15 17:04:13.213210',1);
INSERT INTO "firstapp_product" VALUES (11,'iphone 14 pro','hari','update/231115090931phone10.jpg',2,100000.0,85000.0,'15.54 cm (6.1-inch) Super Retina XDR display featuring Always-On and ProMotion
Dynamic Island, a magical new way to interact with iPhone
48MP Main camera for up to 4x greater resolution
Cinematic mode now in 4K Dolby Vision up to 30 fps
Action mode for smooth, steady, handheld videos
All-day battery life and up to 23 hours of video playback
Vital safety technology — Crash Detection calls for help when you can’t',0,1,'2023-11-15 17:09:31.255966',1);
INSERT INTO "firstapp_product" VALUES (12,'Goderj Forte Pro','hari','update/231115093400electronic1.webp',10,12000.0,8999.0,'Unibody Construction - Heavy-duty, hardened steel construction with stainless steel SS304 grade motorized bolts for enhanced safety;Placement - Includes pre-drilled mounting holes and hardware for floor and wall mounting. Mount Type: Wardrobe
Warranty - 1 Year;Dimensions - 200mm x 300mm x 200mm; Numeric Keypad with Digital Display - The safe is operated by a 4-6 digit password using the numeric keypad;AutoLock Function- After 4 consecutive incorrect passcode entries the safe will auto freeze.',0,1,'2023-11-15 17:29:14.335020',7);
INSERT INTO "firstapp_product" VALUES (13,'Prestige PIC 20 1600','hari','update/231115093222electronic2.jpg',30,2999.0,2009.0,'Content: Prestige Induction Cooktop-Pic 20.0
Net Quantity: 1 Unit. Extended Cooling Sysytem
Voltage: 230V, Wattage: 1600Watt
Troubleshooting guidelines: Works only with Induction base cookware- bottom diameter between 12cm-26cm
Type of Control Panel - Push button
Great Features - i)Indian Menu Options ii) Aerodynamic cooling system iii) Automatic voltage regulator ,saves power, Anti- Magnetic Wall
Includes: Main Unit, User Manual, Warranty Card',0,0,'2023-11-15 17:32:22.450816',7);
INSERT INTO "firstapp_product" VALUES (14,'PHILIPS Air Fryer','hari','update/231115094152electronic3.jpg',9,9995.0,7999.0,'Philips Airfryer HD9200/90 (Large, 4.1 L) lets you cook great tasting food with up to 90% less fat*
Patented Rapid Air technology with unique starfish design pan ensures evenly fried results without flipping the food.
Fry. Bake. Grill. Roast. And even reheat!
60 minutes timer with auto off. Wide temperature control from 80°C to 200 °C.
Extra-long 1.8 m cord length for easy placement in your kitchen.
Dishwasher-safe and Easy-to-Clean.
Not just fries, now make aloo tikkis, roast chicken,',0,1,'2023-11-15 17:41:52.021805',7);
INSERT INTO "firstapp_product" VALUES (15,'IBELL Electric Drill','hari','update/231115203455electronic5.webp',15,2300.0,1400.0,'Specification: Rated voltage : 230V~50Hz; Rated Input Power : 400 W; Rated no load speed : 0-2800 rpm; Chuck capacity : 10 mm; Drilling capacity : Wood-15mm Steel-10mm; Weight : 1.15 Kg; Protection class : Class II
An excellent power to size ratio results in a powerful, durable drill in a compact size.
It is a 400W corded drill with 10mm chuck capacity, Compact ergonomic design enables comfortable one-handed use and allows access to tight spaces. It is ideal for drilling holes in metal, wood.',0,0,'2023-11-15 17:48:12.310079',7);
INSERT INTO "firstapp_product" VALUES (16,'Electronic spices PACK','hari','update/231115175934electronic6.jpg',100,200.0,100.0,'Package include - 20pcs
Easy install: soft cord press-insert cable-release(complete), Hard cord just insert(complete).
After install when big pull will be lock tie and tie till to cut short.
Widely used in lighting, power and automotive wiring,Suitable for motor, electrical control, power, household appliances, lighting, machinery and wire joints.
Fast wire connection operation without drilling screw holes speeds up wiring process, quite convenient.',0,1,'2023-11-16 01:59:34.284750',7);
INSERT INTO "firstapp_product" VALUES (17,'Electronic Spices(7 in 1)','hari','update/231115203550electronic7.jpg',100,499.0,259.0,'The kit contains-1 x 25W Soldering Iron, 1 x Soldering Stand, 1 x Wire Cutter , 1 x Soldering paste , 1 x desolder wire and High Quality Solder wire , 1x Tester
This Soldering Kit is a applicable for all electronic applications and household needs. This is not recommended for heavy industrial/highly professional usage It has Durable elements designed for long life
General purpose for all electronic applications and household needs
Heating will take 30-45 seconds and Slide on replaceable.',0,1,'2023-11-16 02:01:53.697857',7);
INSERT INTO "firstapp_product" VALUES (18,'Zebrronics Thunder','hari','update/231115203622electronic8.jpg',50,1199.0,698.0,'Comfortable Design: Beat the workday blues with music on Zeb-Thunder wireless headphone that comes in an ergonomic design a perfect fit and design for long hours use. Microphone sensitivity -40dB ±1dB. Microphone impedance 1.2k Ω
Soft & comfortable earcups: Listen to music, podcasts and more for long hours with soft ear cups making it super comfortable for daily wear
Adjustable headband: Adust your headband to your comfortable best while you work or listen to music
60hrs Playback.',0,1,'2023-11-16 02:04:30.617985',7);
INSERT INTO "firstapp_product" VALUES (19,'Havells Plastic and Aluminium','hari','update/231115180743electronic9.jpg',20,1594.0,866.0,'American heritage original imported golden nonstick coating on sole plate
Easy to see pilot light
Easy grip fabric selector knob
360 degree cord swivel
Warranty: 2 year on product
Includes: 1 Dry iron and Instruction Manual
Cotton and silk braided; Temperature control dial for various fabrics',0,1,'2023-11-16 02:07:43.571445',7);
INSERT INTO "firstapp_product" VALUES (20,'Zebrronics Keyboard','hari','update/231115204106electronic10.jpg',30,999.0,699.0,'Keyboard Interface USB (Nano receiver) Total No.of Keys 104
Companion 107 is a wireless keyboard and mouse combo that comes with a nano receiver built for home/office use. Plug and Play
Mouse Interface USB (Nano Receiver) Resolution 1200 DPI No. of Buttons 3
Mouse High Precision Compact & Ergonomic Design Advanced optical sensor technology Nano Receiver Plug and Play
The mouse that tags in this combo is ergonomically designed and super compact. It is a high precision mouse with 1200 DPI.',0,1,'2023-11-16 02:10:49.971213',7);
INSERT INTO "firstapp_product" VALUES (21,'Kurta','hari','update/231115203719fashion1.jpg',100,1299.0,600.0,'Explore Exquisite Ethnic Clothing: Discover a curated selection of stunning ethnic garments that blend tradition and modern style seamlessly.
Vibrant Colors and Patterns: Immerse yourself in a kaleidoscope of hues and intricate designs that reflect the rich cultural heritage of diverse regions.
Artisanal Craftsmanship: Experience the dedication of skilled artisans who pour their expertise and passion into crafting every detail of our clothing pieces.
From Traditional .',0,1,'2023-11-16 02:30:17.726192',8);
INSERT INTO "firstapp_product" VALUES (22,'Men Faded Denim','hari','update/231115184431fashion2.jpg',100,2199.0,599.0,'Fabric: Denim
Pattern: Solid
Casual Wear Styles Shirt
Prewashed Full Sleeve Denim Shirt
Wash As Per Tag',0,1,'2023-11-16 02:44:31.689772',8);
INSERT INTO "firstapp_product" VALUES (23,'Fashion Hoodies','hari','update/231115203821fashion3.jpg',50,1399.0,499.0,'Fabric:- Cotton || Hoodie Pattern:- Solid Hoodies || Sleeves:- Full sleeve || Fit Type:- Regular ||
Package Content:- 1 Hoodie Top for women || Type:- tops for women western wear || Length :- Standard || Neck :- Hooded Neck Tops ||
Occasion:- It''s a Daily, Regular, Causal, Fusion, or Office Wear, Casual Wear, Formal wear, Evening wear, Work Wear, Party Wear Style It with Your Favorite Heels, Shoes, Accessories, and So On.
Effortlessly Fun Makes Even Relaxing Look Stylish. Traditional Wear.',0,1,'2023-11-16 02:47:11.429133',8);
INSERT INTO "firstapp_product" VALUES (24,'Gown','hari','update/231115184911fashion4.jpg',50,1299.0,599.0,'Lightweight and breathable net fabric
Stylish and trendy design
Comfortable fit for all-day wear
Ideal for formal or semi-formal occasions
Available in various colors and patterns',0,1,'2023-11-16 02:49:11.946369',8);
INSERT INTO "firstapp_product" VALUES (25,'PICAASO Men Sport shoes','hari','update/231115203901fashion5.jpg',30,2999.0,1299.0,'Closure : Lace-Up | Fit Type : Regular | Toe-Shape : Round Toe-Shape
Upper Features : The Picaaso running shoe has an upper knitted fabric layer designed specifically to improve breathability as you work out or go running. This layer lets your feet breathe as you keep moving.
Sole Features : The Picaaso shoe uses only high quality TPR + EVA (Thermo-Plastic Rubber + Ethylene-Vinyl Acetate) in the outsole to give you improved level of durability, a better grip, better traction, and more flexibil',0,1,'2023-11-16 02:52:31.121827',8);
INSERT INTO "firstapp_product" VALUES (26,'Red Sneaker Casual Shoes','hari','update/231115203948fashion6.jpg',20,6999.0,1724.0,'MATERIAL: Upper - MESH + PU (Polyurethane) | Outsole- EVA (Ethylene Vinyl Acetate) + TPU (Thermoplastic Polyurethane)
THIS MEN''S SNEAKER SHOES IS FOR: This Sneaker Shoe Gives You All-Day Comfort And Relaxation At The Feet With a Stylish Casual Look.
FEATURES: Closure - Lace-Up | Fit Type - Regular
BENEFITS: Sneaker Shoes Designed For Utmost Comfort With EVA + TPU Sole. It Provides Dynamic Feet Support, Arch Support, Slip- Resistance For Negating Accidental Falls, Firm Grip & Great Looks.',0,1,'2023-11-16 04:23:32.903402',8);
INSERT INTO "firstapp_product" VALUES (27,'DHRUVI TRENDZ summer shirts','hari','update/231115204154fashion7.jpg',35,1999.0,289.0,'Fabric:- Rayon Stylish Shirt || Print:- Diamond & Block Print Printed Shirt For Boy || Package Contain:- 1 Casual Shirt For Men.
Sleeves:- Short Sleeve Stylish Shirt For Men || Neck:- Revere Collar shirt for boys || Patten:- Shirt has a full button placket and a curved hem design.
Occasion:- Casual Wear|| Beach Wear || Office Wear|| Formal wear|| Evening wear|| Work Wear|| Party Wear|| Regular Outing Wear|| Business Wear|| Regular Wear || Travelling Wear || Festival Wear || Professional Wear,',0,1,'2023-11-16 04:27:34.925313',8);
INSERT INTO "firstapp_product" VALUES (28,'Leriya Fashion Night Dress','hari','update/231115204029fashion8.jpg',24,1999.0,499.0,'Fabric:- Rayon Men''s Night Wear || Color :- Multi || Sleeves :- Short Sleeves || Neck : Hawaii Neck Nightwear set
Length:- Above Knee Shorts Pajama Set || Comfortable Night Wear || Type: Night Dress For Man.
Pattern:- Palm Tree & Leaf Printed shirt & Shorts combo || Fit Type:- Regular Fit || Package Content:- 1 shirt * 1 Short
Occasion:- Night Wear, Beach Wear, Summer Wear, Hangouts, Picnic, Vacation Wear. Great Sleep Short Set, Men''s Pajama Shorts Set, Men''s Loungewear, Men''s Short Pajama.',0,1,'2023-11-16 04:30:09.781644',8);
INSERT INTO "firstapp_product" VALUES (29,'J B Fashion Track Pant for Men','hari','update/231115203342fashion9.jpg',200,3996.0,369.0,'Track pant for men || track pants || Lycra Full Elastic Jogger Track Pant
Style: Casual
Type: Tapered/Carrot
Fit Type: Regular Fit
Composition: 100% Polyester',1,0,'2023-11-16 04:33:42.132244',8);
INSERT INTO "firstapp_product" VALUES (30,'Cargo Jogger','hari','update/231115204746fashion10.jpg',43,3099.0,948.0,'Side Corgo utility pockets
Breathable cotton stretch fabric
Elasticated waistband with drawstring fastening
Elasticated bottom
Stylish Cargos for everyday casual wear',0,0,'2023-11-16 04:47:46.237102',8);
INSERT INTO "firstapp_product" VALUES (31,'Tata Sampann Unpolished Kala Chana, 1kg','hari','update/231115205720grocery1.jpg',300,150.0,130.0,'RICH TASTE: Tata Sampann Kala Chana is delicious in taste
UNPOLISHED DALS: Tata Sampann dals do not undergo any artificial polishing with water, oil or leather, thereby retaining their goodness and wholesome character
5-STEP PROCESS FOR STRINGENT QUALITY CHECKS: Ensures that the grains of dal are uniform and of premium quality
CHEF RECOMMENDED: Recommended by Chef Sanjeev Kapoor and Chef Ranveer Brar
AMAZING RECIPES: Used in a variety of snacks, salads, hummus dips, and many more.',1,0,'2023-11-16 04:55:42.332177',9);
INSERT INTO "firstapp_product" VALUES (32,'Paper Boat California Almonds, Value Pack 1 KG','hari','update/231115210251grocery2.webp',300,1350.0,1080.0,'GOOD OL'' ELDERLY WISDOM: Being coaxed by Dadimaa everyday to eat more badam was something that perplexed us but the health benefits as we know them today make us feel she was on to something!
So Pure, So Good: Premium quality almonds that are unroasted, unprocessed, unsalted, and unputdownable!
Great Source Of Antioxidants: Beyond just improving memory, almonds are a great source of antioxidants, Vit E, and also help blood pressure and cholesterol levels.
Family Pack For Good Health: Soaked',0,1,'2023-11-16 04:59:36.137171',9);
INSERT INTO "firstapp_product" VALUES (33,'Levista Extra Strong Instant Coffee (Pouch) (1 Kg)','hari','update/231115210142grocery3.jpg',350,835.0,776.0,'A fine blend of 53% Coffee and 47% Chicory, prepared from the highest quality of Arabica and Robusta beans and blended with high quality chicory. Savour a refreshingly unique coffee experience.',1,0,'2023-11-16 05:01:42.425411',9);
INSERT INTO "firstapp_product" VALUES (34,'Vim Dishwash Liquid Gel Lemon','hari','update/231115210554grocery4.jpg',1000,499.0,386.0,'Removes Stubborn Malodour From Plastic
Prevents Scratches On Delicate Cookware
No Bar Like Residue On Dishes
Get Sparkling Clean Utensils With One Spoon Only
One Spoonful Can Clean An Entire Sinkful Of Dirty Dishes
Tough On Stains, Gentle On Hands
surface_recommendation: Tableware, Cookware',0,0,'2023-11-16 05:05:54.091327',9);
INSERT INTO "firstapp_product" VALUES (35,'Tata Salt','hari','update/231115212402grocery5.jpg',3000,25.0,24.0,'40 YEARS OF TRUST: Known as ‘Desk ka Namak’, Tata Salt offers a promise of Iodine guarantee
VACUUM EVAPORATED IODISED: Untouched by hands, Tata namak offers hygienically packed product
BALANCED TASTE: Relish consistency of taste and saltiness with every salt pack
IODINE GUARANTEE: With the right proportion of iodine, which helps support mental development*
ALSO TRY: Tata Salt Immuno, Tata Salt Rock Salt
COMMONLY SEARCHED TOPICS: tata salt, tata salt 1kg, tata namak, tata namak 1kg,',1,0,'2023-11-16 05:12:52.126028',9);
INSERT INTO "firstapp_product" VALUES (36,'SAF Set of 3 Hexagon Preety Brown Flower UV','hari','update/231115212322home1.webp',38,999.0,189.0,'Item Size: 17 inches X 17 inches
self addeshive multi-effect easy clean to dry cloth painting
Package Contents: 3 wall Hexagaon painting
Usage: It can be used for living room, home decor and for gifting purposes
7 horses,seven horses,best gift,vastu gift,lucky gift,wall decals,stickers,wall paper,nature,panel painting,SET OF 4,4pc panel,4 set painting,kids decore,motivational,motivation,kids room,cartoon,panel painting,panels,wall hanging,Ganesh,Ganesha,Painting,Buddha,Floral,Modern Art,',1,1,'2023-11-16 05:23:04.166641',10);
INSERT INTO "firstapp_product" VALUES (37,'SAF Set of 3 Buddha UV Textured Home Decorative Gift Item Painting','hari','update/231115212621home2.jpg',23,899.0,169.0,'Material: UV Textured with Synthetic Frame<br>
Set of 3<br>
Size: 18 Inch X 12 Inch<br>',0,0,'2023-11-16 05:26:21.071160',10);
INSERT INTO "firstapp_product" VALUES (38,'Apple 2023 MacBook Air laptop with M2 chip: 38.91cm','hari','update/231115213445home3.jpg',20,159990.0,126990.0,'IMPRESSIVELY BIG, IMPOSSIBLY THIN — The 15‑inch MacBook Air makes room for more of what you love with a spacious Liquid Retina display. The durable 100% recycled aluminium enclosure is strikingly thin and light.
SUPERCHARGED BY M2 — Get more done faster with a powerful 8-core CPU, 10-core GPU and up to 24GB of unified memory.
UP TO 18 HOURS OF BATTERY LIFE — Go all day with the power-efficient performance of the Apple M2 chip. (Battery life varies by use and configuration. See our website.',1,1,'2023-11-16 05:34:45.212586',10);
INSERT INTO "firstapp_product" VALUES (39,'Madesa Gaming Computer Desk and Office Table','hari','update/231115214116home41.jpg',36,22999.0,11999.0,'This Gaming Desk gives you enjoyable space to elevate your gaming experience. Can be placed in your room, office room, kids room...
FEATURES: Enough space for multiple monitors, with the 5 storage shelves you can easily organize your gaming stuff, plenty of storage space, this desk has NO paint finish at the back, seven layers of polyester paint protection and supports up to 50 Kg
USES: Can be used as a learning table, gaming desk, home office desk, computer desk, pc gamer, work table or a .',1,1,'2023-11-16 05:41:16.788744',10);
INSERT INTO "firstapp_product" VALUES (40,'Samsung 236 L, 3 Star, Digital Inverter, Frost Free Double Door Refrigerator','hari','update/231115214521home5.jpg',30,37990.0,24490.0,'Frost Free Refrigerator: Auto Defrost with powerful cooling and long lasting freshness  performance
Capacity 236 liters: Suitable for families with 2 to 3 members
Energy Rating : 3 Star - Energy Efficiency
Manufacturer Warranty : 1-year comprehensive warranty on the product, and 20-year warranty on the digital inverter compressor
Digital Inverter Compressor provides greater energy efficiency, less noise and long-lasting performance while consuming 50% less power, backed up by 20 year warnty',0,0,'2023-11-16 05:45:06.956919',10);
INSERT INTO "firstapp_product" VALUES (41,'LG 8 Kg 5 Star Smart Inverter TurboDrum Fully Automatic Top Loading Washing Machine','hari','update/231115214734home6.jpg',34,28990.0,22990.0,'Fully-automatic top load washing machine with TurboDrum: Affordable with great wash quality, Easy to use; has both washing and drying functions
Capacity 8.0 Kg: Suitable for large families
Energy Star rating: 5 Star  in class efficiency; Smart Inverter Technology for up to 36 % energy savings; Energy consumption – 0.0079 KWh/kg/cycle & Water Consumption: 13.95 L/Kg/Cycle (Please refer BEE label for more information)
Manufacturer Warranty: 2 years on product and 10 years on motor (T&C)
740 RP',1,1,'2023-11-16 05:47:34.423310',10);
INSERT INTO "firstapp_product" VALUES (42,'Apple iPhone 15','hari','update/231122035000phone11.jpg',10,83000.0,79900.0,'DYNAMIC ISLAND COMES TO IPHONE 15 — Dynamic Island bubbles up alerts and Live Activities — so you don’t miss them while you’re doing something else. You can see who’s calling, track your next ride, check your flight status, and so much more.
INNOVATIVE DESIGN — iPhone 15 features a durable color-infused glass and aluminum design. It’s splash, water, and dust resistant. The Ceramic Shield front is tougher than any smartphone glass.',0,1,'2023-11-22 11:47:04.523308',1);
INSERT INTO "firstapp_product" VALUES (43,'Lava Agni 2 5G','hari','update/231122035304phone12.jpg',15,25999.0,19999.0,'17.22cm (6.78") 120Hz FHD+ Curved Amoled Display with Widevine L1 DRM Protection - Enjoy all your Content in High Resolution
Superior performance with Octa-core 2.6GHz MediaTek Dimensity 7050 6nm processor
Superfast 66W charger (50% Charging in less than 16mins)
Big 1.0µm Pixel 50MP Quad Camera with 8MP ultrawide, 2MP Macro and 2MP Depth camera along with 1.0µm 16MP selfie camera
Clean Android 13 OS (No Bloatware, No Ads)
3D Curved Glass back',0,1,'2023-11-22 11:53:04.753256',1);
INSERT INTO "firstapp_product" VALUES (44,'Apple iPhone 13','hari','update/231122035554phone13.jpg',10,59900.0,51999.0,'15 cm (6.1-inch) Super Retina XDR display
Cinematic mode adds shallow depth of field and shifts focus automatically in your videos
Advanced dual-camera system with 12MP Wide and Ultra Wide cameras; Photographic Styles, Smart HDR 4, Night mode, 4K Dolby Vision HDR recording
12MP TrueDepth front camera with Night mode, 4K Dolby Vision HDR recording
A15 Bionic chip for lightning-fast performance',0,0,'2023-11-22 11:55:54.742555',1);
INSERT INTO "firstapp_product" VALUES (45,'iQOO Z7 Pro 5G','hari','update/231122035903phone14.jpg',20,26999.0,23999.0,'Dimensity 7200 5g processor based on the latest 4nm energy-efficient process
3D Curved Super-vision Display with 17.22 cm (6.78 inches) screen size, 93.3% Screen-to-body ratio, 120 Hz AMOLED FHD+, 1.07 Billion Colors, 1300 nits Peak Local Brightness
Slimmest phone with 0.736 cm (7.36mm) thickness, Premium AG Matte Glass finish
64 MP AURA Light OIS Camera, 4K video recording, Hybrid Image Stabilization, Super Night Mode, Aura Light Portrait, Camera Panning Portrait',0,0,'2023-11-22 11:59:03.038142',1);
INSERT INTO "firstapp_product" VALUES (46,'realme narzo 50i','hari','update/231122040438phone15.jpg',14,9999.0,7299.0,'Powerful Unisoc T612 processor for smooth day to day performance |Superb performance with an AnTuTu Benchmark Score of 214, 150 | Power efficient 12nm Process with Octa-core CPU to make your daily tasks easier
Display: 6.5 inch HD+ display with 400nits of brightness brings a full screen display and vibrant colors to make every ounce of the experience exciting.
8MP back camera for crisp and clear shots and 5MP front camera picture perfect selfies
5000mAh Massive Battery with 10W fast charging',0,0,'2023-11-22 12:03:51.644721',1);
INSERT INTO "firstapp_product" VALUES (47,'Nokia C32','hari','update/231122041759phone16.jpg',14,12499.0,9499.0,'Take great low-light images with the 50 MP dual rear sensor that captures more light or the 8MP selfie camera, plus Night-mode for both front and back cameras.
3-day battery life with the big 5000 mAh battery and the latest AI-powered battery saving features
Toughened glass back and a metallic-finish frame that elevates the luxurious design and protects against dust and spills with an IP52 protection rating.
Android 13 out of the box with memory extension that turns 6 GB of storage space .',0,0,'2023-11-22 12:13:56.316508',1);
INSERT INTO "firstapp_product" VALUES (48,'Samsung Galaxy Z Flip5 5G','hari','update/231122041632phone17.jpg',9,102999.0,99999.0,'Style and function that fits in your pocket. It''s a pocket-sized statement piece. Small but mighty when folded, this phone is compact enough to fit in your palm, but leaves a big impression with sleek, hazy colors that match your vibe.
Our toughest Samsung Galaxy foldables ever. The world’s first water-resistant foldable smartphones have never been so strong. These scratch-defying devices are our toughest ever with exclusive Corning Gorilla Glass Victus2 on the outside and the super durable',0,0,'2023-11-22 12:16:32.377610',1);
INSERT INTO "firstapp_product" VALUES (49,'Saregama Carvaan Mini','hari','update/231122221236electronic11.jpg',20,2600.0,2190.0,'351 Pre-loaded evergreen Hindi songs
USB and Bluetooth modes to enable you to enjoy your personal collection of songs
FM/AM radio
3.5 mm audio jack for connecting external speakers/ headphones
Aux in port for plugging in phones and other devices
A rechargeable battery that last up to 5 hours
Gets easily charged with any android charger',0,0,'2023-11-23 06:12:36.811353',7);
INSERT INTO "firstapp_product" VALUES (50,'Hand Blender','hari','update/231123034258electronic12.webp',20,1200.0,999.0,'The powerful 150watt blender with copper motor ensures a great performance and longevity, respectively
Adjust the speed with its 5 variable speed controls for mixing different ingredients
The in-built overheating protection will shut down the machine in case of overheating.
Equipped with multiple beaters and dough hooks that make cooking easier',0,0,'2023-11-23 11:42:58.806807',7);
INSERT INTO "firstapp_product" VALUES (51,'Light','hari','update/231123034550electronic13.jpg',12,1899.0,1321.0,'Long Distance Beam Range. Water resistant
Highly Sturdy and Secure Aircraft Aluminium Body. LED lamp life up to 100,000 Hrs. Bright cool daylight
Unbreakable front cover glass. ACDC 110V-240V, 50/60 Hz. Charge this product for 10 hours before it''s first use
Highly recommended for Home, Security & Camping Uses. Rotary switch. Built in rechargeable unit',0,0,'2023-11-23 11:45:50.116645',7);
INSERT INTO "firstapp_product" VALUES (52,'Coffee Maker','hari','update/231123034834electronic14.jpg',10,5395.0,4498.0,'Makes espresso, cappuccino and latte coffee
Milk frothing nozzle: Use the milk frothing nozzle for making Latte, Espresso Macchiato, Caff? Breve, and Caramel Macchiato varieties of coffee ; Turbo cappuccino nozzle: Use this special nozzle exclusively for achieving a satisfactory froth in your favourite Cappuccino
Warranty: 2 years on product
Power: 800 watts; Operating voltage: 230 volts. Bar Pressure: 4 bar. Function select knob :Yes
Includes: Coffee maker, Instruction manual.',0,0,'2023-11-23 11:48:22.134910',7);
INSERT INTO "firstapp_product" VALUES (53,'IBELL Professional Tool Kit','hari','update/231123035203electronic15.jpg',14,6678.0,3139.0,'Rated voltage : 230V~50Hz; Rated Input Power : 650 W
Rated no load speed : 0-2800 rpm; Chuck capacity : 13 mm
Drilling capacity : Wood -25mm, Steel-12mm, Concrete-13mm
Protection class : Class II
Combo box includes Impact Drill Machine 115 different useful accessories.',0,0,'2023-11-23 11:52:03.346344',7);
INSERT INTO "firstapp_product" VALUES (54,'PURVAJA Women''s Maxi Dress','hari','update/231123035754fashion11.jpg',100,2700.0,502.0,'Material                  TypeCorduroy
Length                     Maxi
Occasion                TypeWork
Sleeve                     TypeHalf Sleeve
Pattern                    Solid
StyleEmpire          Waist
Country of             OriginIndia',0,0,'2023-11-23 11:57:54.324026',8);
INSERT INTO "firstapp_product" VALUES (55,'Frill Maxi Dress','hari','update/231123040124fashion12.jpg',200,1299.0,339.0,'Material Type                    Corduroy
Length                                  Maxi
Occasion Type                  Casual
Sleeve Type                       Short Sleeve
Pattern                                 Polka Dots
Style                                      Fit And Flare
Country of Origin            India',0,0,'2023-11-23 12:01:24.036999',8);
INSERT INTO "firstapp_product" VALUES (56,'Peora Ethnic Silk Thread Fabric Stone Studded Kundan Chura Chuda Bangle','hari','update/231123040737fashion13.jpg',100,2500.0,499.0,'Material                              TypeSilk
Metal                                    TypeAlloy
Clasp                                   TypeSlide
Size                                       2.6 inch
Gem TypeNo                     Gemstone
Occasion Type                  Wedding
Country of Origin            India',0,0,'2023-11-23 12:07:37.860376',8);
INSERT INTO "firstapp_product" VALUES (57,'Vbuyz Women Kurta','hari','update/231123041210fashion14.jpg',30,2499.0,495.0,'Kurti (top) Fabric : Rayon|| Kurti (top) Style : Straight || Kurti (top) Length : 47 Inches || Pattern : Embroidered
Color : Grey || Sleeve Type : 3/4 Sleeve || Sleeve Length : 17 Inches || Neck Type : Boat Neck
Stitched Type : Stitched Kurti || Inside The Box : 1 Kurti Without Pant
Wash Care : Machine Wash/ Hand Wash/ Do Not Brush || Occasion Type : Festive & Party',0,0,'2023-11-23 12:12:10.747244',8);
INSERT INTO "firstapp_product" VALUES (58,'KLOSIA Women Pure Cotton Printed Straight Kurta with Pant & Dupatta','hari','update/231123041629fashion15.jpg',50,649.0,999.0,'★ Product Material :- Pure Cotton || Colour :- White
★ Style :- Straight || Sleeve Length :- 3/4 Sleeve || Bottom :- Pant
★ Sizes :-S,M,L,XL,XXL (All Ragular Size Avalible)
★ Item Length :- Casual || Occasion :- Casual ,Office wear ,Party ,Wedding , Ragular & Festive
★ Package Contents: 1 Kurti & Pant With Dupattas Set',0,0,'2023-11-23 12:16:29.575339',8);
INSERT INTO "firstapp_product" VALUES (59,'Dairy Milk Silk','hari','update/231123041933grocery6.webp',500,510.0,484.0,'Indulge in a rich, smooth, and creamy celebration.
Silk: The classic taste of Cadbury Dairy Milk chocolates is only more creamy, more smooth, more indulging.
Cadbury Dairy Milk Silk is made with a glass and a half of milk.
This milk chocolate bar is a perfect sweet to indulge in all alone or as a chocolate gift pack for gifting on special occasions like birthdays and get-togethers.',0,0,'2023-11-23 12:19:33.321327',9);
INSERT INTO "firstapp_product" VALUES (60,'Snickers Chocolate','hari','update/231123202419grocery7.webp',500,600.0,360.0,'PACK CONTENT: Each Diwali chocolate pack contains 3 Snickers Miniatures, 2 Snickers Peanut & Butterscotch chocolates each and 1 Snickers Almond bar
SEND SWEET WISHES: This Diwali surprise your loved ones with Snickers Diwali Chocolate Gift pack and send best wishes
DELICIOUS CHOCOLATES: Make Diwali festivity memorable with this delicious assortment of Snickers - Peanut, Almond & Butterscotch chocolates
PERFECT DIWALI GIFT: Give your loved ones a premium gift with these chocolates for Diwali.',0,1,'2023-11-23 12:21:53.210465',9);
INSERT INTO "firstapp_product" VALUES (61,'Ferrero Rocher Premium Chocolates','hari','update/231123042347grocery8.jpg',1000,929.0,892.0,'Whole hazelnut covered in milk chocolate. A creamy filling, a crunchy wafer and a delicious hazelnut centre;And thanks to its inimitable golden wrapper and paper cup Ferrero Rocher is even more unique and special
Ferrero Rocher offers a unique taste experience of contrasting layers that engages all the senses
Ferrero Rocher is available in different packs making it ideal for sharing with your loved ones, for giving as the perfect gift or even for indulging yourself',0,0,'2023-11-23 12:23:47.460941',9);
INSERT INTO "firstapp_product" VALUES (62,'Dark Chocolate Bar','hari','update/231123042633grocery9.jpg',300,378.0,300.0,'Exquisite combination of chocolate & zesty orange flavour to provide the ultimate experience to your taste buds
The rich and delicious taste combined with the fact that the dark chocolate is made with no added sugar makes it perfect to indulge in without any guilt
Every bar contains a minimum of 50% Cocoa which is sure to delight the dark chocolate connoisseur in you
And unlike other chocolates Sugar Free D’lite chocolates are made with natural sweeteners',0,0,'2023-11-23 12:26:34.011079',9);
INSERT INTO "firstapp_product" VALUES (63,'Nestlé Kitkat 2','hari','update/231123042826grocery10.jpg',200,120.0,90.0,'PACK CONTENT: This pack contains 8 individually wrapped KITKAT  2 Finger packs
CRISPY WAFER BAR: Indulge in the delicious crispy wafer bar and make your breaks delightful
HAVE A BREAK, HAVE A KITKAT: Just unwrap your KITKAT, break off one of the fingers, snap into two and enjoy!
ENJOY A DELICIOUS BREAK: This share bag is perfect for stocking up and to enjoy at home or for passing around with friends and family',0,0,'2023-11-23 12:28:26.717800',9);
INSERT INTO "firstapp_product" VALUES (64,'OnePlus 108 cm','hari','update/231123202258home7.webp',20,39999.0,29999.0,'Resolution : 4K Ultra HD (3840x2160) | Refresh Rate : 60 Hertz
Connectivity: 3 HDMI ports to connect set top box, Blu Ray players, gaming console | 2 USB ports to connect hard drives and other USB devices | Dual-band Wi-Fi
Sound : 24 Watts Output | Dolby Audio | Dolby Atmos Decoding
Smart TV features: Android TV | OnePlus Connect Ecosystem| Google Assistant | Chromecast, Miracast, DLNA | Auto Low Latency Mode | Supported Apps : Netflix, Youtube, Prime Video, Hotstar, SonyLiv, Hungama.',0,0,'2023-11-23 12:33:02.393246',10);
INSERT INTO "firstapp_product" VALUES (65,'Sofa Set','hari','update/231123043533home8.jpg',20,39000.0,26000.0,'L Shaped Five-seater sofa with lounger; Sofa set - 212x182.9x78.7 cm;Made with high quality fabric in grey color
Over 30 tests conducted to ensure quality;Fabric does not lose color while rubbing
Passed durability testing with 100 kg on each seat and backrest for 25,000 cycles;Meets Indian Standards IS 12674/ IS 5416 for performance and stringent European Safety Requirement Standard EN 12520; Warranty on manufacturing defects: 3 years;Lightweight for easy shifting',0,0,'2023-11-23 12:35:33.893639',10);
INSERT INTO "firstapp_product" VALUES (66,'1000W Mixer Grinder','hari','update/231123043728home9.jpg',30,10000.0,5690.0,'Powerful Heavy duty 1000W pure copper motor
Deep Flow Breaker (DFB) technology which ensures efficient grinding in minimum time
Elegant & modern design to elevate kitchen aesthetics. Easy cleaning. Ergonomically designed handle
High grade 100% Stainless steel jar. Bigger capacity jars – 1500ml, 1200ml and 500ml SS Jars.
1.2L Juicer jar with pulp and seed filter
Stone pounding SS blades for Dry grinding',0,0,'2023-11-23 12:37:28.372301',10);
INSERT INTO "firstapp_product" VALUES (67,'Smart Wet Grinder','hari','update/231123202134home10.webp',40,5156.0,3890.0,'Wattage: 150 W; Voltage: 220-240V, 50-60Hz ; Revolution: 1300
No of Jars: 1; Jar Size: 2 Liters; Jar Material: Stainless Steel; Body Material: ABS body; Cord Material: 180 CM; Speed Control: 1 Speed Control
Motor Warranty: 2; Product Warranty: 2;
Read Manual Before Use
Powerful motor; Uniform grinding pressure and 4 way grinding system; Sturdy Single Phase High Torque Motor
Shock proof ABS body and detachable stainless steel  Unbreakable and transparent lids made of polycarbonate material',0,0,'2023-11-23 12:39:27.566823',10);
INSERT INTO "firstapp_product" VALUES (68,'Juicer Mixer Grinder','hari','update/231123202833home11.jpg',30,5000.0,1979.0,'Make Smoothies and Juices within seconds.
Also suitable for dry grinding, chutneys and dips
Powerful 500 W copper motor can grind almost any food.
Best in the segment customer support and quality
Includes easy to make and carry sipper jar',0,1,'2023-11-24 04:28:33.397245',10);
INSERT INTO "firstapp_product" VALUES (69,'The Power of Your Subconscious Mind','hari','update/231123203213book1.jpg',100,199.0,99.0,'Enjoy a great reading experience when you buy the Kindle edition of this book. Learn more about Great on Kindle, available in select categories.',0,0,'2023-11-24 04:32:13.261456',11);
INSERT INTO "firstapp_product" VALUES (70,'GLUN® Water Magic Book','hari','update/231123203423book2.jpg',1000,89.0,81.0,'Reusable drawing board, once you colour, the pictures are vivid and colourful. As soon as they dry the colored areas disappear and the pages can be colored again and again.
Lightly to paint, and easy to draw, mothers do not have to worry about the baby dirtying themselves and the surrounding environment, not to worry about sharp pen will hurt the baby.
Unique gift for a child, great educational toys for baby''s early development. It''ll fit comfortably in a toddler day pack making it an ideal.',0,0,'2023-11-24 04:34:10.699098',11);
INSERT INTO "firstapp_product" VALUES (71,'Ponniyin Selvan Set of All five Parts (1,2,3,4 & 5)','hari','update/231123203738book3.jpg',2000,700.0,595.0,'Ponniyin Selvan book Tamil 5 parts பொன்னியின் செல்வன் (பாகம் 1-5) எழுத்தாளர் கல்கி அவர்களின் புகழ்பெற்ற பொன்னியின் செல்வன் நாவலின் ஐந்து பாகங்களும் அடங்கியது. நாவலைப் படிக்கையில் நாமும் சோழமன்னர் ராஜராஜனின் ஆட்சிக்காலத்துக்கு சென்று வாழ்ந்துவிட்டு வந்ததைப்போன்ற உணர்வை அளிப்பது இந்நாவலின் தனிச்சிறப்பாகும்.',0,0,'2023-11-24 04:37:38.724034',11);
INSERT INTO "firstapp_catagory" VALUES (1,'mobile','update/231123215121phone111.jpg',0,'2023-11-15 09:47:49.779412','All Kinnds Of Mobiles');
INSERT INTO "firstapp_catagory" VALUES (7,'Electroinc','update/231123215202electronic111.webp',0,'2023-11-15 12:07:09.089266','All Electronic Items');
INSERT INTO "firstapp_catagory" VALUES (8,'Fashion','update/231123215221fashion111.jpg',0,'2023-11-15 12:15:55.971006','All Men And Women fashions');
INSERT INTO "firstapp_catagory" VALUES (9,'grocery','update/231123215241grocery111.jpg',0,'2023-11-15 12:23:01.213984','all Grocery Items');
INSERT INTO "firstapp_catagory" VALUES (10,'Home','update/231123215301home111.jpg',0,'2023-11-15 12:25:33.653085','All Home Products');
INSERT INTO "firstapp_catagory" VALUES (11,'Book','update/231123215631book111.jpg',0,'2023-11-18 03:50:24.687000','All Kind Of  Books');
INSERT INTO "firstapp_cart" VALUES (2,3,'2023-11-22 10:58:13.216175',25,12);
INSERT INTO "firstapp_cart" VALUES (3,1,'2023-11-22 12:21:23.666549',44,12);
INSERT INTO "firstapp_cart" VALUES (7,3,'2023-11-24 12:58:11.746615',64,12);
INSERT INTO "firstapp_cart" VALUES (8,1,'2023-11-24 15:00:08.176535',43,12);
INSERT INTO "firstapp_favourite" VALUES (1,'2023-11-23 03:10:46.236173',42,12);
INSERT INTO "firstapp_favourite" VALUES (3,'2023-11-23 05:28:02.245647',10,12);
INSERT INTO "firstapp_favourite" VALUES (7,'2023-11-24 12:58:22.951284',64,12);
INSERT INTO "firstapp_favourite" VALUES (8,'2023-11-24 14:59:47.687251',44,12);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "firstapp_product_category_id_0073282f" ON "firstapp_product" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "firstapp_cart_product_id_ab929359" ON "firstapp_cart" (
	"product_id"
);
CREATE INDEX IF NOT EXISTS "firstapp_cart_user_id_a4262785" ON "firstapp_cart" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "firstapp_favourite_product_id_2a65db1e" ON "firstapp_favourite" (
	"product_id"
);
CREATE INDEX IF NOT EXISTS "firstapp_favourite_user_id_49e7902f" ON "firstapp_favourite" (
	"user_id"
);
COMMIT;
