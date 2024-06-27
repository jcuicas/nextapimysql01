import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";

export async function GET(request) {
  try {
    const { searchParams } = request.nextUrl;
    const page = parseInt(searchParams.get('page')) || 1;
    const limit = parseInt(searchParams.get('limit')) || 10;
    const offset = (page - 1) * limit;

    let query = 'SELECT * FROM productos LIMIT ? OFFSET ?';

    const db = await pool.getConnection();
    const [products] = await db.query(query, [limit, offset]);
    const [{ total: totalCount }] = await db.query('SELECT COUNT(*) as total FROM productos');
    db.release();

    const totalPages = Math.ceil(totalCount / limit);

    return NextResponse.json({
      result: products,
      currentPage: page,
      totalPages,
      totalCount
    }, { status: 200 });
  } catch (error) {
    console.error('Error en GET /api/productos:', error);
    return NextResponse.json({ error: 'Ocurrió un error al obtener los productos' }, { status: 500 });
  }
}
