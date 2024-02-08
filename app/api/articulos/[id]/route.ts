import { type NextRequest } from "next/server";
import { NextResponse } from "next/server";

export async function GET(request: Request, {params}:{params: {slug: string}}){
    console.log(params);
    return NextResponse.json({message: "recibiendo datos"});
}
export async function PUT(request: NextRequest){
    const searchParams = request.nextUrl.searchParams;
    const query = searchParams.get('query');
    return NextResponse.json({message: "actualizando datos"});
}
export async function DELETE(request: NextRequest){
    const searchParams = request.nextUrl.searchParams;
    const query = searchParams.get('query');
    return NextResponse.json({message: "borrando datos"});
}