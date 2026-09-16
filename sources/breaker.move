#[allow(unused_variable, unused_type_parameter)]
module reward_distribution::breaker {
    use sui::coin::Coin;
    use reward_distribution::reward_distribution::{ACL, PauseClaimConfig, RewardDistributor};

    public entry fun pause_claim(acl: &mut ACL, pause_claim: &mut PauseClaimConfig, status: bool, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun deposit_reward<CoinType>(
        acl: &mut ACL,
        distributor: &mut RewardDistributor,
        period: u32,
        coin: Coin<CoinType>,
        ctx: &mut TxContext,
    ) {
        abort 0
    }
}

