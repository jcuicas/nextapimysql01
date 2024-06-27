
import { NextResponse } from "next/server";

export async function GET() {
  try {
    return NextResponse.json({ message: "esta es la ruta GET con el parametro id de  clientes" });
  } catch (error) {
    console.error("Error in GET /api/clientes:", error);
    return NextResponse.json({ error: "An error occurred" }, { status: 500 });
  }
}
