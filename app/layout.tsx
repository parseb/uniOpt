"use client"
import { Inter } from 'next/font/google'
import './globals.css'

import type { AppProps } from 'next/app';
import Head from 'next/head';
import { PrivyProvider } from '@privy-io/react-auth';
import { NavBar } from '@/app/ui/NavBar'

// const inter = Inter({ subsets: ['latin'] })

const metadata = {
  title: 'GHOptim',
  description: 'GHO optimal options',
}

const handleLogin = (user: any) => {
  console.log(`User ${user.id} logged in!`)
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">

      <body>

        <Head>
          <></>
        </Head>

        <PrivyProvider
          appId={process.env.NEXT_PUBLIC_PRIVY_APP_ID || ''}
          onSuccess={handleLogin}
          config={{
            loginMethods: ['email', 'wallet'],
            embeddedWallets: {
              createOnLogin: 'users-without-wallets'
            },
            appearance: {
              theme: 'light',
              accentColor: '#676FFF',
              logo: './ghoptim-logo.png',
            },
          }}
        >
          <NavBar />

          <br></br>
          <div className="container-main">

            {children}
          </div>
        </PrivyProvider>
      </body>
    </html>
  )
}
