import { usePrivy, useLogout, useWallets } from '@privy-io/react-auth';
import { Button,Card, Label } from 'flowbite-react';

export function LoginButton() {
  const { login,  ready, authenticated, user } = usePrivy();
  const {logout} = useLogout();
  const {wallets} = useWallets();
  const embeddedWallet = wallets.find((wallet) => wallet.walletClientType === 'privy');

  return user ? <span> {user.wallet?.address}   <Button onClick={logout}>Log out</Button></span> : <Button onClick={login}>Log in</Button> ;

}