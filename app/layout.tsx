import type { Metadata } from 'next';
import '@/app/globals.css';

export const metadata: Metadata = {
    title: "Next App",
    description: "first app"
}

export default function RootLayout({
    children
}: {
    children: React.ReactNode
}) {
    return (
        <html lang="es">
            <body>
                {children}
            </body>
        </html>
    );
}