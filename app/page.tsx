export default function Page() {
    return (
        <div className="container-xl flex items-center justify-center w-dvw h-dvh bg-gray-900">
            <div className="w-full h-full flex flex-wrap rounded-lg overflow-hidden bg-white">
                <div className="w-1/2 h-full bg-red-500">
                    <img className="object-fill w-full h-full" src="/images/logo.jpg" alt="#" />
                </div>
                <div className="w-1/2 h-full bg-inherit flex flex-col items-center justify-center">
                    <p className="text-[40px]">LOGIN</p>
                    <form className="w-1/2" action="post">
                        <label className="flex flex-col pt-4" htmlFor="">
                            UserName
                            <input className="border-b-2 border-solid p-2 border-neutral-900" type="text" />
                        </label>
                        <label className="flex flex-col pt-4" htmlFor="">
                            UserName
                            <input className="border-b-2 border-solid p-2 border-neutral-900" type="text" />
                        </label>
                        <div className="w-full bg-orange-950 flex flex-row my-4">
                            <button className="p-4 xl:grow md:grow-0 bg-gray-950 text-white">LOG IN</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}