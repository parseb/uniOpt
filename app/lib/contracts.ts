import {contractAddr} from "../../public/deployments"
import {ethers, JsonRpcProvider, Contract} from 'ethers'
import optimABI from '../../out/GHOptim.sol/GHOptim.json'
import { useContractRead } from 'wagmi'




export const GHOptimABI = optimABI['abi'];
export const provider = new JsonRpcProvider(process.env.NEXT_PRIVATE_DEVNETMAIN_TENDERLY);


export const GHOptimContract = new Contract(contractAddr.GHOptim,GHOptimABI);
export const GHOptimAddress = contractAddr.GHOptim;



// export const AaveAssets: AaveAsset[] = [

// ];
