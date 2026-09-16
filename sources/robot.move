#[allow(unused_variable)]
module reward_distribution::robot {
    use reward_distribution::reward_distribution::{ACL, RewardDistributor};

    public entry fun add_user_rewards(
        acl: &mut ACL,
        distributor: &mut RewardDistributor,
        period: u32,
        users: vector<address>,
        percentages: vector<u64>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }
}

