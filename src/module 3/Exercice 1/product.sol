pragma solidity ^0.4.19;

struct Product {
    string id;
    string name;
    uint price;
    string description;
    bool isAvalable;
    uint stock;    
}

struct Valoration {
    string id;
    uint delivery;
    uint product;
    uint qualityprice;  
}