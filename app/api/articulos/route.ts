import { NextRequest, NextResponse } from "next/server";
import { conn } from "../../lib/mysql";

export async function GET(request: NextRequest) {
    const result = await conn.query("select now()");
    const searchParams = request.nextUrl.searchParams;
    const query = searchParams.get('query');
    console.log(query);
    return NextResponse.json({ message: query });
}

export async function POST(request: Request) {
    try {
        const {
            descripcion,
            precioUnitario,
            diasVidaUtil,
            codMarca,
            codProveedor } = await request.json();
        const result = await conn.query(`INSERT INTO articulos(COD_ARTICULO, DESCRIPCION, PRECIO_UNITARIO, DIAS_VIDA_UTIL, COD_MARCA, COD_PROVEEDOR) VALUES (?,?,?,?,?,?)`,[(precioUnitario + diasVidaUtil),`'${descripcion}'`, precioUnitario, diasVidaUtil, codMarca, codProveedor]);
        console.log(result);
        return NextResponse.json({ result });
    } catch (error: any) {
        console.log(error);
        return NextResponse.json({
            message: error.message,
            status: 500
        });
    }
}