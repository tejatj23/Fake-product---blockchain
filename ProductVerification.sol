// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductVerification {
    struct Product {
        string name;
        string manufacturer;
        uint256 timestamp;
        bool isAuthentic;
    }

    mapping(string => Product) private products;

    event ProductRegistered(string qrCode, string name, string manufacturer, uint256 timestamp);

    function registerProduct(string memory qrCode, string memory name, string memory manufacturer) public {
        require(bytes(products[qrCode].name).length == 0, "Product already registered");
        
        products[qrCode] = Product(name, manufacturer, block.timestamp, true);

        emit ProductRegistered(qrCode, name, manufacturer, block.timestamp);
    }

    function verifyProduct(string memory qrCode) public view returns (string memory, string memory, uint256, bool) {
        require(bytes(products[qrCode].name).length > 0, "Product not found");
        Product memory p = products[qrCode];
        return (p.name, p.manufacturer, p.timestamp, p.isAuthentic);
    }
}