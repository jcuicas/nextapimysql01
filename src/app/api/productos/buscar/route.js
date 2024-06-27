// app/api/productos/buscar/route.js
import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";

export async function GET(request) {
  try {
    const { searchParams } = request.nextUrl;
    const q = searchParams.get('q');

    let query = 'SELECT * FROM productos';
    const params = [];

    if (q) {
      query += ' WHERE title LIKE ?';
      params.push(`%${q}%`);
    }

    const db = await pool.getConnection();
    const [products] = await db.execute(query, params);
    db.release();

    return NextResponse.json(products, { status: 200 });
  } catch (error) {
    console.error('Error en GET /api/productos/buscar:', error);
    return NextResponse.json({ error: 'Ocurrió un error al buscar productos' }, { status: 500 });
  }
}
