contract Crowdfunding {

    struct Proposal {
        owner: Address,
        deadline: Timestamp,
        goal: Value,
        contributions: Map Address Value,
        funded: bool
    }

    map proposals: Map Int Proposal

    fun createProposal(proposalId: Int, deadline: Timestamp, goal: Value) {
        assert !proposals.contains(proposalId)
        let proposal = Proposal {
            owner: msg.sender,
            deadline: deadline,
            goal: goal,
            contributions: Map.empty,
            funded: false
        }
        proposals[proposalId] = proposal
    }

    fun fundProposal(proposalId: Int) {
        let proposal = proposals[proposalId]
        assert proposal.deadline > now
        assert !proposal.funded
        proposal.contributions[msg.sender] += msg.value
    }

    fun finalizeProposal(proposalId: Int) {
        let proposal = proposals[proposalId]
        assert proposal.deadline <= now
        if proposal.contributions.values().sum() >= proposal.goal {
            proposal.funded = true
            send(proposal.owner, proposal.goal)
        } else {
            for (address, value) in proposal.contributions {
                send(address, value)
            }
        }
    }
}
