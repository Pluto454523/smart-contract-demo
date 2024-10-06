// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// ประกาศ pragma เพื่อใช้เลือกภาษาในการ compile
// โดยในที่นี้เราเลือกใช้ solidity เวอร์ชั่น 0.8.26

contract MyContract {                       
    // ประกาศ Class MyContract โดยใช้ syntax contract
    string _name;
    uint _balance;

    // การเรียกใช้งาน constructor เพื่อเป็นการเปิดบัญชีโดยใช้ ชื่อ กับ จำนวนเงินที่ต้องการเปิดบัญชี
    // จะมีการเสียค่า Gas เป็นค่าธรรมเนียมในการทำงาน
    constructor(string memory name, uint balance) {
        require(balance >= 500, "balance must be greater and equal 500");
        _name = name;
        _balance = balance;
    }

    // getBalance เพื่อดูยอดเงิน ไม่เสียค่า Gas เพราะเป็นฟังชั่นสำหรับดูอย่างเดียว
    function getBalance() public view returns (uint balance) {
        return _balance;
    }

    // deposite ฟังชั่นในการฝากเงินเข้าบัญชี
    // การเรียกใช้ deposite จะมีการเก็บค่า Gas เพราะมีการทำ transaction ในระบบ block chain
    function deposite(uint256 amount) public {
        _balance += amount;
    }

    // withdraw ฟังชั่นในการฝากเงินเข้าบัญชี
    // การเรียกใช้ withdraw จะมีการเก็บค่า Gas เพราะมีการทำ transaction ในระบบ block chain
    function withdraw(uint256 amount) public {
        uint newAmount = _balance - amount;
        if (newAmount >= 0) {
            _balance = newAmount;
        } else {
            require(newAmount < 0, "balance must be greater and equal 500");
        }
    }
}