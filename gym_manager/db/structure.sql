CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE "cards" ("id" integer NOT NULL PRIMARY KEY, "locker_id" integer DEFAULT NULL, "status" varchar DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "user_id" integer DEFAULT NULL, CONSTRAINT "fk_rails_36465505e5"
FOREIGN KEY ("locker_id")
  REFERENCES "lockers" ("id")
, CONSTRAINT "fk_rails_8ef7749967"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE TABLE "lockers" ("id" integer NOT NULL PRIMARY KEY, "card_id" integer DEFAULT NULL, "is_free" boolean DEFAULT NULL, "room" varchar DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_ade564a646"
FOREIGN KEY ("card_id")
  REFERENCES "cards" ("id")
);
CREATE TABLE "memberships" ("id" integer NOT NULL PRIMARY KEY, "user_id" integer DEFAULT NULL, "card_id" integer DEFAULT NULL, "status" varchar DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_99326fb65d"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
, CONSTRAINT "fk_rails_27549c442b"
FOREIGN KEY ("card_id")
  REFERENCES "cards" ("id")
);
CREATE TABLE "users" ("id" integer NOT NULL PRIMARY KEY, "surname" varchar DEFAULT NULL, "name" varchar DEFAULT NULL, "sex" varchar DEFAULT NULL, "card_id" integer DEFAULT NULL, "membership_id" integer DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_520678876c"
FOREIGN KEY ("card_id")
  REFERENCES "cards" ("id")
, CONSTRAINT "fk_rails_294fd8243b"
FOREIGN KEY ("membership_id")
  REFERENCES "memberships" ("id")
);
INSERT INTO "schema_migrations" (version) VALUES
('20200421112006'),
('20200421112139'),
('20200421112255'),
('20200421112459'),
('20200421162230'),
('20200421185805');


