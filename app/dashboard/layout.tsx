'use client';

import { usePathname } from "next/navigation";
import Link from "next/link";
import { Suspense } from "react";
import Loading from "./(overview)/loading";
import { FaBeer } from "react-icons/fa";

export default function DashboardLayout({
    children,
    admin,
    user
}: {
    children: React.ReactNode,
    admin: React.ReactNode,
    user: React.ReactNode
}) {
    const pathname = usePathname();
    return (
        <div className="w-dwv h-dvh flex flex-row">
            <div className="w-1/5 h-full bg-gray-700 flex flex-col justify-between">
                <div className="w-full h-1/5 bg-slate-400">
                </div>
                <div className="w-full flex flex-col items-center justify-center">
                    <Link className={`w-full text-center hover:bg-white hover:text-gray-700 ${pathname === '/dashboard' ? 'bg-white' : ''}`} href="/dashboard">
                        <FaBeer /> Articulos
                    </Link>
                    <Link className={`w-full hover:bg-white hover:text-gray-700 ${pathname === '/dashboard/op1' ? 'bg-white' : ''}`} href="/dashboard/op1">
                        <FaBeer /> Clientes
                    </Link>
                    <Link className={`w-full hover:bg-white hover:text-gray-700 ${pathname === '/dashboard/op2' ? 'bg-white' : ''}`} href="/dashboard/op2">
                        <FaBeer /> Proveedores
                    </Link>
                </div>
                <div className="w-full h-1 bg-red-500">
                </div>
            </div>
            <div className="w-4/5 h-full">
                <Suspense fallback={<Loading />}>
                    {children}
                    {admin}
                    {user}
                </Suspense>
            </div>
        </div>
    );
}