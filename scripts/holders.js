import fs from 'fs';

let holders = [];
let balances = [];

const holderListGenerater = async () => {
    for (let i = 0; i < 210; i++) {
        holders.push("0x036B2C1B00766e5b21436fb082b4d57Cf7466b1d");
        balances.push(1000000000000);
    }
    await fs.promises.writeFile(
        'holders.json', 
        JSON.stringify(holders)
      )
    await fs.promises.writeFile(
        'balances.json', 
        JSON.stringify(balances)
    )
}
    
holderListGenerater();