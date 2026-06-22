-- ============================================
-- Barin Menu — Supabase Setup
-- Запусти в: Supabase → SQL Editor → Run
-- ============================================

-- Таблица категорий
CREATE TABLE IF NOT EXISTS categories (
  id SERIAL PRIMARY KEY,
  slug TEXT UNIQUE NOT NULL,
  name_ru TEXT NOT NULL,
  name_az TEXT DEFAULT '',
  name_en TEXT DEFAULT '',
  sort_order INT DEFAULT 0
);

-- Таблица блюд
CREATE TABLE IF NOT EXISTS menu_items (
  id SERIAL PRIMARY KEY,
  category_slug TEXT NOT NULL,
  name_ru TEXT NOT NULL,
  name_az TEXT DEFAULT '',
  name_en TEXT DEFAULT '',
  description_ru TEXT DEFAULT '',
  price_display TEXT NOT NULL,
  price_value NUMERIC DEFAULT 0,
  photo_url TEXT DEFAULT '',
  badge TEXT DEFAULT '',
  badge_label TEXT DEFAULT '',
  group_name TEXT DEFAULT '',
  is_active BOOLEAN DEFAULT true,
  sort_order INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Отключаем RLS (защита через пароль в JS)
ALTER TABLE categories DISABLE ROW LEVEL SECURITY;
ALTER TABLE menu_items DISABLE ROW LEVEL SECURITY;

-- Даём anon-ключу полный доступ
GRANT ALL ON categories TO anon;
GRANT ALL ON menu_items TO anon;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO anon;

-- ============================================
-- Категории
-- ============================================
INSERT INTO categories (slug, name_ru, name_az, name_en, sort_order) VALUES
('cold',     'Холодные закуски', 'Soyuq qəlyənaltilar', 'Cold Appetizers', 1),
('salads',   'Салаты',           'Salatlar',             'Salads',          2),
('hot-apps', 'Горячие закуски',  'İsti qəlyanaltilar',   'Hot Appetizers',  3),
('soups',    'Супы',             'Şorbalar',             'Soups',           4),
('mains',    'Горячие блюда',    'İsti yeməklər',        'Hot Dishes',      5),
('sides',    'Гарниры',          'Qarnir',               'Garnish',         6),
('desserts', 'Десерты',          'Desert',               'Dessert',         7),
('drinks',   'Напитки',          'İçkilər',              'Drinks',          8);

-- ============================================
-- Холодные закуски
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('cold', 'Соленые огурчики', 'Duzlu xiyar', 'Pickled Cucumbers', '4 ₼', 4, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&h=450&fit=crop', '', ''),
('cold', 'Грибочки маринованные с луком', 'Soğan ilə marinad edilmiş göbələklər', 'Marinated Mushrooms with Onions', '7 ₼', 7, 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600&h=450&fit=crop', '', ''),
('cold', '"Жирное ассорти"', 'Hisə verilmiş salo, Ənənəvi salo', 'Smoked Bacon, Traditional Bacon', '14 ₼', 14, 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600&h=450&fit=crop', 'hit', 'Хит'),
('cold', 'Говяжий язык', 'Mal Dili', 'Beef Tongue', '12 ₼', 12, 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=600&h=450&fit=crop', '', ''),
('cold', 'Сырное ассорти', 'Yerli pendir çeşidləri', 'Local Cheese Selection', '16 ₼', 16, 'https://images.unsplash.com/photo-1452195100486-9cc805987862?w=600&h=450&fit=crop', '', ''),
('cold', 'Холодец из говядины', 'Mal ətindən xolodets', 'Beef Aspic', '13 ₼', 13, 'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?w=600&h=450&fit=crop', '', ''),
('cold', 'Селедочка по-домашнему', 'Az duzlu siyənək', 'Lightly Salted Herring', '15 ₼', 15, 'https://images.unsplash.com/photo-1519984388953-d2406bc725e1?w=600&h=450&fit=crop', 'hit', 'Хит'),
('cold', '"Барский перекус" (8 шт)', 'Qızardılmış çörək, rostbif, şprot', 'Toasted Bread, Roast Beef, Sprats', '20 ₼', 20, 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600&h=450&fit=crop', 'sig', 'Фирменное'),
('cold', 'Гренки с сыром', 'Pendirli krutonlar', 'Croutons with Cheese', '8 ₼', 8, 'https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=600&h=450&fit=crop', '', ''),
('cold', 'Тартар из тунца', 'Tuna tartarı', 'Tuna Tartare', '12 ₼', 12, 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600&h=450&fit=crop', 'fish', 'Рыба'),
('cold', 'Куриный паштет с ягодным соусом', 'Giləmeyvə sousu ilə toyuq paşteti', 'Chicken Pâté with Berry Sauce', '14 ₼', 14, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=600&h=450&fit=crop', '', ''),
('cold', 'Авторский хумус с дымным баклажаном', 'Tüstülənmiş badımcanlı hümmus', 'Chef''s Signature Hummus with Smoked Eggplant', '13 ₼', 13, 'https://images.unsplash.com/photo-1547592180-85f173990554?w=600&h=450&fit=crop', 'sig', 'Авторское'),
('cold', '«Рыбное ассорти»', 'Qızılbalıq, yağlı balıq, unaqi, krevetlər', 'Salmon, Butterfish, Unagi, Shrimps', '50 ₼', 50, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=600&h=450&fit=crop', 'hit', 'Хит');

-- ============================================
-- Салаты
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('salads', 'Салат "Оливье"', 'Olivye salatı', 'Olivier Salad', '10 ₼', 10, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&h=450&fit=crop', 'hit', 'Хит'),
('salads', 'Салат "Селедка под шубой"', 'Siyənək salatı', 'Herring Under a Fur Coat', '11 ₼', 11, 'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=600&h=450&fit=crop', '', ''),
('salads', 'Салат "Винегрет"', 'Vineqret salatı', 'Vinaigrette Salad', '8 ₼', 8, 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=600&h=450&fit=crop', 'veg', 'Вег'),
('salads', 'Салат "Языковый"', 'Mal dili salatı', 'Beef Tongue Salad', '10 ₼', 10, 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=600&h=450&fit=crop', '', ''),
('salads', '"Цезарь" с курицей', 'Toyuq ilə Sezar salatı', 'Caesar Salad with Chicken', '15 ₼', 15, 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600&h=450&fit=crop', 'hit', 'Хит'),
('salads', '"Цезарь" с креветками', 'Krevetlərlə Sezar salatı', 'Caesar Salad with Shrimps', '19 ₼', 19, 'https://images.unsplash.com/photo-1563227812-0ea4c22e6cc8?w=600&h=450&fit=crop', 'fish', 'Морепродукты'),
('salads', 'Салат "Помидоры с вишней"', 'Albalılı pomidor salatı', 'Tomato and Cherry Salad', '12 ₼', 12, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&h=450&fit=crop', 'veg', 'Вег'),
('salads', 'Салат с авокадо и жареной гречкой', 'Avokado və qızardılmış qarabaşaq ilə salat', 'Salad with Avocado and Fried Buckwheat', '14 ₼', 14, 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=600&h=450&fit=crop', 'veg', 'Вег');

-- ============================================
-- Горячие закуски
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('hot-apps', 'Блинчики с мясом (2 шт)', 'Ətli blinçiklər', 'Russian Pancakes with Beef', '7 ₼', 7, 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=600&h=450&fit=crop', '', ''),
('hot-apps', 'Блинчики с творогом (2 шт)', 'Kəsmikli blinçiklər', 'Pancakes with Cottage Cheese', '6 ₼', 6, 'https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=600&h=450&fit=crop', '', ''),
('hot-apps', 'Пирожки с картофелем или мясом (1 шт)', 'Kartoflu ya ətli pirojki', 'Pirozhki with Potato or Beef', '3 ₼', 3, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=600&h=450&fit=crop', '', ''),
('hot-apps', 'Пельмени домашние', 'Ev sayağı pelmeni', 'Homemade Pelmeni', '13 ₼', 13, 'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?w=600&h=450&fit=crop', 'hit', 'Хит'),
('hot-apps', 'Вареники с вишней', 'Albalılı vareniklər', 'Cherry Dumplings', '13 ₼', 13, 'https://images.unsplash.com/photo-1519984388953-d2406bc725e1?w=600&h=450&fit=crop', '', ''),
('hot-apps', 'Вареники с картофелем', 'Kartoflu vareniklər', 'Potato Dumplings', '12 ₼', 12, 'https://images.unsplash.com/photo-1533089860892-a7c6f0a88666?w=600&h=450&fit=crop', '', ''),
('hot-apps', 'Темпура с креветками и овощами', 'Krevet və tərəvəzlərdən tempura', 'Crispy Shrimp and Vegetable Tempura', '19 ₼', 19, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=600&h=450&fit=crop', 'fish', 'Морепродукты');

-- ============================================
-- Супы
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('soups', '"Борщ Тарас Бульба"', 'Borş', 'Borscht', '12 ₼', 12, 'https://images.unsplash.com/photo-1547592180-85f173990554?w=600&h=450&fit=crop', '', ''),
('soups', 'Окрошка', 'Okroşka', 'Okroshka', '8 ₼', 8, 'https://images.unsplash.com/photo-1504544750208-dc0358e63f7f?w=600&h=450&fit=crop', '', '');

-- ============================================
-- Горячие блюда
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('mains', '"Котлета по-киевски"', 'Kiyev kotleti', 'Kiev-Style Chicken Cutlet', '20 ₼', 20, 'https://images.unsplash.com/photo-1432139555190-58524dae6a55?w=600&h=450&fit=crop', 'hit', 'Хит'),
('mains', 'Хрустящий куриный шницель с мини-Цезарь', 'Xırtıldayan toyuq şnitzeli mini Sezar salatı ilə', 'Crispy Chicken Schnitzel with Mini Caesar', '19 ₼', 19, 'https://images.unsplash.com/photo-1501200291289-c5a76c232e5f?w=600&h=450&fit=crop', '', ''),
('mains', 'Полутушка цыпленка из тандыра', 'Təndirdə bişirilmiş kənd çolpanın yarısı', 'Half Farm Chicken in Tandoor', '18 ₼', 18, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=600&h=450&fit=crop', '', ''),
('mains', 'Хрустящий цыпленок "Табака"', 'Xırtıldayan Tabaka cücəsi', 'Crispy Tabaka Chicken', '27 ₼', 27, 'https://images.unsplash.com/photo-1559847844-5315695dadae?w=600&h=450&fit=crop', 'hit', 'Хит'),
('mains', 'Тушенка из говядины по-домашнему', 'Ev sayağı mal əti tuşonkası', 'Homemade Beef Stew', '23 ₼', 23, 'https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?w=600&h=450&fit=crop', '', ''),
('mains', 'Бефстроганов с картофелем по-деревенски', 'Göbələk ilə Beef Stroganoff', 'Beef Stroganoff with Mushrooms', '20 ₼', 20, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=600&h=450&fit=crop', '', ''),
('mains', 'Бургер по специальному рецепту шефа', 'Şefin xüsusi resepti ilə burger', 'Chef''s Signature Burger', '20 ₼', 20, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&h=450&fit=crop', 'sig', 'Авторское'),
('mains', 'Говядина Беф Бургиньон', 'Zəngin qırmızı şərab sousunda Beef Bourguignon', 'Beef Bourguignon in Rich Red Wine Sauce', '25 ₼', 25, 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600&h=450&fit=crop', '', ''),
('mains', 'Говяжья вырезка со шпинатом', 'İspanaq ilə mal əti filesi', 'Beef Tenderloin with Spinach', '28 ₼', 28, 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=600&h=450&fit=crop', '', ''),
('mains', 'Говяжья вырезка с вишней', 'Albalı ilə mal əti filesi', 'Beef Tenderloin with Cherries', '25 ₼', 25, 'https://images.unsplash.com/photo-1481931098730-318b6f776db0?w=600&h=450&fit=crop', '', ''),
('mains', 'Антрекот из ягненка с соусом харисса', 'İmza harissa sousu ilə quzu antrekotu', 'Tender Lamb Entrecôte with Harissa Sauce', '20 ₼', 20, 'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=600&h=450&fit=crop', 'sig', 'Авторское'),
('mains', 'Томленая голень ягненка в шафрановом соусе', 'Zəfəran sousunda vam odda bişirilmiş quzu budu', 'Slow-Cooked Lamb Shank in Saffron Sauce', '28 ₼', 28, 'https://images.unsplash.com/photo-1559847844-5315695dadae?w=600&h=450&fit=crop', 'hit', 'Хит'),
('mains', 'Лопатка ягненка из печи «Филадельфия»', 'Philadelphia sousunda sobada bişirilmiş quzu kürəyi', 'Oven-Roasted Lamb Shoulder in Philadelphia Sauce', '110 ₼', 110, 'https://images.unsplash.com/photo-1544025162-d76694265947?w=600&h=450&fit=crop', 'sig', 'Авторское'),
('mains', 'Жаркое из баранины', 'Kartof və tərəvəzlərlə qovrulmuş quzu əti', 'Roast Lamb with Potatoes and Vegetables', '20 ₼', 20, 'https://images.unsplash.com/photo-1432139555190-58524dae6a55?w=600&h=450&fit=crop', '', ''),
('mains', 'Фаршированное филе дорадо', 'Doldurulmuş dorado filesi', 'Stuffed Dorado Fillet, Chef''s Special', '22 ₼', 22, 'https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=600&h=450&fit=crop', 'fish', 'Рыба'),
('mains', 'Филе форели со шпинатом, грибами и томатами', 'İspanaq, göbələk ilə alabalıq filesi', 'Trout Fillet with Spinach, Mushrooms and Cherry Tomatoes', '22 ₼', 22, 'https://images.unsplash.com/photo-1565299624946-b28f40a04cf3?w=600&h=450&fit=crop', 'fish', 'Рыба');

-- ============================================
-- Гарниры
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('sides', 'Рис с кардамоном, гвоздикой и лавровым листом', 'Hil, mixək və dəfnə yarpağı ilə düyü', 'Rice with Cardamom, Cloves and Bay Leaf', '6 ₼', 6, 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=600&h=450&fit=crop', '', ''),
('sides', 'Жареная картошка криспи с приправами', 'Ədviyyatlarla qızardılmış xırtıldayan kartof', 'Crispy Fried Potatoes with Seasonings', '8 ₼', 8, 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=600&h=450&fit=crop', '', ''),
('sides', 'Шпинат с жареной гречкой и томатами черри', 'Qızardılmış qarabaşaq ilə ispanaq', 'Spinach with Fried Buckwheat and Cherry Tomatoes', '10 ₼', 10, 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&h=450&fit=crop', 'veg', 'Вег'),
('sides', 'Ароматный картофель фри с дымком', 'Xüsusi ədviyyatlı kartof fri', 'Seasoned Crispy French Fries', '7 ₼', 7, 'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=600&h=450&fit=crop', '', '');

-- ============================================
-- Десерты
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label) VALUES
('desserts', 'Фирменное тирамису от шефа', 'Şefin xüsusi tiramisusu', 'Chef''s Signature Tiramisu', '15 ₼', 15, 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=600&h=450&fit=crop', 'sig', 'Авторское'),
('desserts', 'Авторская пахлава с фисташковой начинкой', 'Püstəli paxlava', 'Crispy Baklava with Pistachio Filling', '14 ₼', 14, 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=600&h=450&fit=crop', 'sig', 'Авторское'),
('desserts', 'Фирменный пломбир собственного приготовления', 'Xüsusi ev dondurmamız', 'Signature Homemade Ice Cream', '12 ₼', 12, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=600&h=450&fit=crop', '', ''),
('desserts', 'Воздушный мусс из темного шоколада', 'Havadar tünd şokolad musu', 'Airy Dark Chocolate Mousse', '12 ₼', 12, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600&h=450&fit=crop', '', ''),
('desserts', 'Хворост', 'Xvorost', 'Khvorost', '6 ₼', 6, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=600&h=450&fit=crop', '', ''),
('desserts', '«Наполеон»', '«Napoleon» tortu', 'Napoleon Cake', '10 ₼', 10, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=600&h=450&fit=crop', 'hit', 'Хит'),
('desserts', 'Торт «Медовик»', '«Ballı» tort', 'Honey Cake', '10 ₼', 10, 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=600&h=450&fit=crop', '', ''),
('desserts', 'Фруктовая тарелка (по сезону)', 'Meyvə boşqabı', 'Fruit Plate (seasonal)', '18 ₼', 18, 'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=600&h=450&fit=crop', 'veg', 'Вег'),
('desserts', 'Варенье', 'Mürəbbə', 'Jam', '8 ₼', 8, 'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=600&h=450&fit=crop', '', '');

-- ============================================
-- Напитки
-- ============================================
INSERT INTO menu_items (category_slug, name_ru, name_az, name_en, price_display, price_value, photo_url, badge, badge_label, group_name) VALUES
-- Безалкогольные
('drinks', 'Вода (500 ml)', 'Su', 'Water', '5 ₼', 5, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=450&fit=crop', '', '', 'Безалкогольные / Alkoqolsuz / Non-Alcoholic'),
('drinks', 'Лимонад (500 ml)', 'Limonad', 'Lemonade', '5 ₼', 5, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=600&h=450&fit=crop', '', '', 'Безалкогольные / Alkoqolsuz / Non-Alcoholic'),
('drinks', 'Квас хлебный (300 ml)', 'Çörək kvası', 'Bread Kvass', '5 ₼', 5, 'https://images.unsplash.com/photo-1570197571499-166b36435e9f?w=600&h=450&fit=crop', '', '', 'Безалкогольные / Alkoqolsuz / Non-Alcoholic'),
('drinks', 'Морс клюквенный', 'Mərcanı morsu', 'Cranberry Juice', '7 ₼', 7, 'https://images.unsplash.com/photo-1570197571499-166b36435e9f?w=600&h=450&fit=crop', '', '', 'Безалкогольные / Alkoqolsuz / Non-Alcoholic'),
('drinks', 'Домашний лимонад', 'Ev limonadı', 'Homemade Lemonade', '7 ₼', 7, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=600&h=450&fit=crop', '', '', 'Безалкогольные / Alkoqolsuz / Non-Alcoholic'),
('drinks', 'Милкшейк ванильный / клубничный', 'Vanilli / Çiyələkli milkşeyk', 'Vanilla / Strawberry Milkshake', '14 ₼', 14, 'https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=600&h=450&fit=crop', '', '', 'Безалкогольные / Alkoqolsuz / Non-Alcoholic'),
-- Горячие напитки
('drinks', 'Espresso', '', '', '6 ₼', 6, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600&h=450&fit=crop', '', '', 'Горячие напитки / İsti içkilər / Hot Drinks'),
('drinks', 'Cappuccino', '', '', '9 ₼', 9, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600&h=450&fit=crop', '', '', 'Горячие напитки / İsti içkilər / Hot Drinks'),
('drinks', 'Чашка чая', 'Çay fincan', 'Cup of Tea', '3 ₼', 3, 'https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=600&h=450&fit=crop', '', '', 'Горячие напитки / İsti içkilər / Hot Drinks'),
-- Коктейли
('drinks', 'Aperol Spritz', 'Aperol, prosecco, soda, portağal', 'Aperol, prosecco, soda water, orange', '18 ₼', 18, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=450&fit=crop', '', '', 'Алкогольные коктейли / Alkoqollu kokteyllər'),
('drinks', 'Mojito', 'Bacardi, nanə, şəkər, laym', 'Bacardi, mint, sugar, lime juice', '16 ₼', 16, 'https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=600&h=450&fit=crop', '', '', 'Алкогольные коктейли / Alkoqollu kokteyllər'),
('drinks', 'Espresso Martini', 'Espresso, vanil siropu, kofe likörü, vodka', 'Espresso, vanilla syrup, coffee liqueur, vodka', '18 ₼', 18, 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=600&h=450&fit=crop', '', '', 'Алкогольные коктейли / Alkoqollu kokteyllər'),
('drinks', 'Cosmopolitan', 'Vodka, kvantro, mərcanı şirəsi, laym', 'Vodka, Cointreau, cranberry juice, lime', '18 ₼', 18, 'https://images.unsplash.com/photo-1570197571499-166b36435e9f?w=600&h=450&fit=crop', '', '', 'Алкогольные коктейли / Alkoqollu kokteyllər');
