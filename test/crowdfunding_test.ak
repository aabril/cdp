import Crowdfunding

test createProposalTest {
    Crowdfunding.createProposal(1, now + 3600, 1000)
    assert Crowdfunding.proposals[1].owner == msg.sender
    assert Crowdfunding.proposals[1].goal == 1000
}

test fundProposalTest {
    Crowdfunding.createProposal(1, now + 3600, 1000)
    Crowdfunding.fundProposal(1, 500)
    assert Crowdfunding.proposals[1].contributions[msg.sender] == 500
}

test finalizeProposalSuccessTest {
    Crowdfunding.createProposal(1, now + 1, 1000)
    Crowdfunding.fundProposal(1, 1000)
    wait(2)
    Crowdfunding.finalizeProposal(1)
    assert Crowdfunding.proposals[1].funded == true
}

test finalizeProposalFailureTest {
    Crowdfunding.createProposal(1, now + 1, 1000)
    Crowdfunding.fundProposal(1, 500)
    wait(2)
    Crowdfunding.finalizeProposal(1)
    assert Crowdfunding.proposals[1].funded == false
    assert balance(msg.sender) == 500
}
