import {ethers} from "ethers"


async function main() {
    //frst select public node and create provider

    const provider = new ethers.JsonRpcProvider("http://127.0.0.1:8545");
    // const provider = new ethers.JsonRpcProvider("https://ethereum-sepolia-rpc.publicnode.com");
    const blockNumber = await provider.getBlockNumber();
    console.log("blockNumber : " , blockNumber.toString());   
}

//call function
main().then((res)=>{
    console.log("function run successfully!")
})
.catch((err)=>{
    console.log("function run Error!")
    console.log(err);
})

