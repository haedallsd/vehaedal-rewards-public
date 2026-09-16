#[allow(unused_variable, unused_type_parameter)]
module reward_distribution::reward_distribution {
    use sui::coin::Coin;
    use sui::table::Table;
    use std::string::String;
    use reward_distribution::vault::Vault;

    /// `AdminCap` is used by an administrator.
    public struct AdminCap has store, key {
        id: UID,
    }

    /// `OperatorCap` is used by the offchain programs.
    public struct OperatorCap has store, key {
        id: UID,
    }

    /// `ACL` is used by the offchain programs.
    public struct ACL has store, key {
        id: UID,
        minor_signs: vector<address>,
        breakers: vector<address>,
        robots: vector<address>,
    }

    public struct CoinVault<phantom T> has store {
        coin_type: String,
        vault: Vault<T>,
        total_rewards: u64,
        distributed_rewards: u64,
    }

    public struct RewardDistributor has key {
        id: UID,
        /// epoch -> (address -> reta(1000000000=100%))
        period_rewards: Table<u32, Table<address, u64>>,
        /// epoch -> (coinType)
        period_vaults: Table<u32, vector<String>>,
        /// Coin List
        supported_coin_types: vector<String>,
        /// epoch -> (address -> coinList claim)
        claimed_rewards: Table<u32, Table<address, vector<String>>>,
        /// Epoch List
        period_keys: vector<u32>,
        /// epoch -> total percentage (1000000000=100%)
        period_total_percentages: Table<u32, u64>,
    }
    
    public struct CoinTypeKey<phantom T> has copy, drop, store {
        period: u32
    }

    public struct UserRewardAdded has copy, drop {
        period: u32,
        user: address,
        percentage: u64,
    }
    
    public struct RewardDeposited has copy, drop {
        period: u32,
        coin_type: String,
        amount: u64,
    }

    public struct RewardClaimed has copy, drop {
        user: address,
        period: u32,
        coin_type: String,
        amount: u64,
    }

    public struct UnclaimedReward has copy, drop, store {
        period: u32,
        coin_type: String,
        amount: u64,
    }

    public struct PauseClaimConfig has key {
        id: UID,
        pause_claim: bool,
    }

    fun init(ctx: &mut TxContext) {
        abort 0
    }

    public entry fun init_pause_reward(_: &AdminCap, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun share_acl(_: &AdminCap, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun set_operator_cap_to_address(_: &AdminCap, account: address, ctx: &mut TxContext) {
        abort 0
    }

    public entry fun add_breaker_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun del_breaker_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun add_robot_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun del_robot_to_acl(_: &AdminCap, acl: &mut ACL, account: address) {
        abort 0
    }

    public entry fun is_breaker(acl: &ACL, account: address): bool {
        abort 0
    }

    public entry fun is_robot(acl: &ACL, account: address): bool {
        abort 0
    }

    /// admin_claim_all
    public entry fun admin_withdraw_unclaimed_rewards<CoinType>(
        _: &OperatorCap,
        distributor: &mut RewardDistributor,
        period: u32,
        recipient: address,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    /// add user and reta
    public entry fun add_user_rewards(
        _: &OperatorCap,
        distributor: &mut RewardDistributor,
        period: u32,
        users: vector<address>,
        percentages: vector<u64>,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    //deposit coin
    public entry fun deposit_reward<CoinType>(
        _: &OperatorCap,
        distributor: &mut RewardDistributor,
        period: u32,
        coin: Coin<CoinType>,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    /// claim
    public entry fun claim_rewards<CoinType>(
        distributor: &mut RewardDistributor,
        periods: vector<u32>,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public entry fun claim_rewards_v2<CoinType>(
        pause_claim_config: &mut PauseClaimConfig,
        distributor: &mut RewardDistributor,
        periods: vector<u32>,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    /// claim return coin
    public fun claim_rewards_coin<CoinType>(
        distributor: &mut RewardDistributor,
        periods: vector<u32>,
        ctx: &mut TxContext
    ): Coin<CoinType> {
        abort 0
    }

    /// claim return coin
    public fun claim_rewards_coin_v2<CoinType>(
        pause_claim_config: &mut PauseClaimConfig,
        distributor: &mut RewardDistributor,
        periods: vector<u32>,
        ctx: &mut TxContext
    ): Coin<CoinType> {
        abort 0
    }
    
    public fun get_coin_type_name<CoinType>(): String {
        abort 0
    }
    
    public fun get_supported_coin_types(distributor: &RewardDistributor): vector<String> {
        abort 0
    }
    
    public fun get_unclaimed_periods(
        distributor: &RewardDistributor,
        user: address
    ): vector<u32> {
        abort 0
    }

    public fun get_period_reward_info<CoinType>(
        distributor: &RewardDistributor,
        period: u32,
        coin_type: String
    ): (u64, u64, u64) {
        abort 0
    }

    // user epoch rate
    public fun get_user_percentage(
        distributor: &RewardDistributor,
        user: address,
        period: u32
    ): u64 {
        abort 0
    }
    
    public fun get_period_users_count(
        distributor: &RewardDistributor,
        period: u32
    ): u64 {
        abort 0
    }
    
    // all epochs 
    public fun get_all_periods(distributor: &RewardDistributor): vector<u32> {
        abort 0
    }

    /// get user coin sum rewards
    public fun get_user_unclaimed_rewards<CoinType>(
        distributor: &RewardDistributor,
        user: address
    ): vector<UnclaimedReward> {
        abort 0
    }

    public fun get_period_total_percentage(
        distributor: &RewardDistributor,
        period: u32
    ): u64 {
        abort 0
    }

    public(package) fun pause_claim(pause_claim: &mut PauseClaimConfig, status: bool){
        abort 0
    }

    public(package) fun deposit_reward_process<CoinType>(
        distributor: &mut RewardDistributor,
        period: u32,
        coin: Coin<CoinType>,
        ctx: &mut TxContext
    ) {
        abort 0
    }

    public(package) fun add_user_rewards_process(
        distributor: &mut RewardDistributor,
        period: u32,
        users: vector<address>,
        percentages: vector<u64>,
        ctx: &mut TxContext
    ) {
        abort 0
    }
}
