import dotenv from 'dotenv';
dotenv.config();
import { createClient } from '@supabase/supabase-js';

let supabase;

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_KEY;

if (supabaseUrl && supabaseKey) {
  supabase = createClient(supabaseUrl, supabaseKey);
} else {
  console.error('Supabase URL or key is missing.');
}

module.exports = supabase;
