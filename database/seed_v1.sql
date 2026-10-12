-- db/seed_v1.sql


INSERT INTO customers (full_name, email, phone, address) VALUES
                                                             ('Thabo Mokoena',  'thabo.mokoena@example.com',  '0821234567', '12 Jan Smuts Ave, Johannesburg'),
                                                             ('Lerato Dlamini', 'lerato.dlamini@example.com', '0839876543', '45 Oxford Rd, Rosebank'),
                                                             ('Pieter van Wyk', 'pieter.vanwyk@example.com',  '0715558899', '8 Main St, Pretoria');

INSERT INTO technicians (full_name, email, phone, active) VALUES
                                                              ('Sipho Nkosi',    'sipho.nkosi@opsflow.test',    '0611112222', TRUE),
                                                              ('Naledi Khumalo', 'naledi.khumalo@opsflow.test', '0623334444', TRUE),
                                                              ('Johan Botha',    'johan.botha@opsflow.test',    '0645556666', TRUE),
                                                              ('Ayesha Patel',   'ayesha.patel@opsflow.test',   '0657778888', FALSE);

INSERT INTO skills (name) VALUES
                              ('Plumbing'),
                              ('Electrical'),
                              ('HVAC'),
                              ('Carpentry'),
                              ('Painting');


INSERT INTO technician_skills (technician_id, skill_id)
SELECT t.technician_id, s.skill_id
FROM (VALUES
          ('sipho.nkosi@opsflow.test',    'Plumbing'),
          ('sipho.nkosi@opsflow.test',    'Electrical'),
          ('sipho.nkosi@opsflow.test',    'HVAC'),
          ('naledi.khumalo@opsflow.test', 'Electrical'),
          ('naledi.khumalo@opsflow.test', 'Carpentry'),
          ('johan.botha@opsflow.test',    'Painting'),
          ('johan.botha@opsflow.test',    'Carpentry'),
          ('johan.botha@opsflow.test',    'Plumbing')
     ) AS v(tech_email, skill_name)
         JOIN technicians t ON t.email = v.tech_email
         JOIN skills s      ON s.name  = v.skill_name;

INSERT INTO work_orders (customer_id, title, description, priority, status)
SELECT c.customer_id, v.title, v.description, v.priority, v.status
FROM (VALUES
          ('thabo.mokoena@example.com',  'Leaking kitchen tap',    'Tap drips constantly and the cupboard below is damp.', 'HIGH',   'NEW'),
          ('thabo.mokoena@example.com',  'Replace plug sockets',   'Three sockets in the lounge are cracked.',             'MEDIUM', 'SCHEDULED'),
          ('lerato.dlamini@example.com', 'Aircon not cooling',     'Split unit runs but blows warm air.',                  'URGENT', 'IN_PROGRESS'),
          ('lerato.dlamini@example.com', 'Repaint bedroom',        'Two coats on all walls, colour already chosen.',       'LOW',    'COMPLETED'),
          ('pieter.vanwyk@example.com',  'Fix broken cupboard door','Hinge has torn out of the frame.',                    'LOW',    'CANCELLED')
     ) AS v(customer_email, title, description, priority, status)
         JOIN customers c ON c.email = v.customer_email;

