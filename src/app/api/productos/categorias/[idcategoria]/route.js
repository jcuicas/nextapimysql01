
import { NextResponse } from "next/server";
import pool from "@/app/libs/mysql";



export async function GET(request) {
  try {

    const pathname = request.nextUrl.pathname;
    const idcategoria = pathname.split('/').pop();



    const db = await pool.getConnection();
    const query = 'SELECT * FROM productos WHERE idcategoria = ?';
    const [products] = await db.execute(query, [idcategoria]);
    db.release();

    return NextResponse.json(products, { status: 200 });
  } catch (error) {
    console.error('Error en GET /api/productos/categorias/[idcategoria]:', error);
    return NextResponse.json({ error: 'Ocurrió un error al obtener los productos' }, { status: 500 });
  }
}
