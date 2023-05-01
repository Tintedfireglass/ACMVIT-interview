pragma solidity ^0.5.16;

contract Election {

    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }

    mapping(uint => Candidate)public candidates;
    mapping(address => bool)public voters;

    uint public candidatesCount;

    constructor () public{
        addCandidate("Candidate A");
        addCandidate("Candidate B");
        }

    function addCandidate (string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount]=Candidate(candidatesCount, _name,0);
    }
    function vote(uint  _candidateID) public{

        require(!voters[msg.sender]);
        require(_candidateID>0 && _candidateID <= candidatesCount);

        voters[msg.sender] = true;

        candidates[_candidateID].votecount++; 
        
    }

}  
