let array = [1, 2, 4, 5];

function findMissingNumber(arr) {
    let numberShould = 0;
    let totalNumber = 0;

    for (let j = 0; j < arr.length; j++) {
        totalNumber += totalNumber + arr[j];
    }

    console.log(`total number is ${totalNumber}`);

    let bigInt = 0;
    for (let a of arr) {
        if (a > bigInt) {
            bigInt = a;
        }
    }

    console.log(`Big int is ${bigInt}`);

    for (let i = 1; i <= bigInt; i++) {
        numberShould += i;
    }

    console.log(`number should be ${numberShould}`);
    return numberShould - totalNumber;
}

console.log(findMissingNumber(array));
