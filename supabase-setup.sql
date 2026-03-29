-- ============================================
-- KIA Motors Dashboard — Supabase Setup
-- ============================================

-- Включаем расширение для UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Таблица менеджеров
CREATE TABLE IF NOT EXISTS managers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Таблица планов на месяц
CREATE TABLE IF NOT EXISTS plans (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  manager_id UUID REFERENCES managers(id) ON DELETE CASCADE,
  segment TEXT NOT NULL CHECK (segment IN ('CKD', 'DKD')),
  month INT NOT NULL CHECK (month BETWEEN 1 AND 12),
  year INT NOT NULL CHECK (year >= 2020),
  sum_plan NUMERIC DEFAULT 0,
  qty_plan INT DEFAULT 0
);

-- 3. Таблица продаж
CREATE TABLE IF NOT EXISTS sales (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  manager_id UUID REFERENCES managers(id) ON DELETE CASCADE,
  segment TEXT NOT NULL CHECK (segment IN ('CKD', 'DKD')),
  sum NUMERIC DEFAULT 0,
  qty INT DEFAULT 1,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Начальные менеджеры
INSERT INTO managers (name) VALUES
  ('Дилноза Юсупова'),
  ('Алишер Каримов'),
  ('Бобур Назаров'),
  ('Зарина Рахимова'),
  ('Шахзод Турсунов');

-- 5. Отключаем RLS для простоты (внутренний инструмент)
ALTER TABLE managers ENABLE ROW LEVEL SECURITY;
ALTER TABLE plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE sales ENABLE ROW LEVEL SECURITY;

-- Политики — разрешаем всё для anon ключа
CREATE POLICY "Allow all on managers" ON managers FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on plans" ON plans FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Allow all on sales" ON sales FOR ALL USING (true) WITH CHECK (true);
