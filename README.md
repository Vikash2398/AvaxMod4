# SpiderManGame ERC20 Token

SpiderManGame is an ERC20 token contract that allows players to interact within a Spider-Man themed gaming environment. Players can earn tokens by defeating enemies, redeem their tokens for rewards, check their token balances, transfer tokens to others, and burn tokens.

## Functionality

The SpiderManGame contract includes the following functionality:

### 1. Collect Kill Count

- **Function**: `collectKillCount(address player, uint256 enemies)`
- **Description**: Allows the owner to update the kill count of a player by adding the number of enemies defeated.
- **Access**: Only the contract owner can call this function.

### 2. Issue Rewards

- **Function**: `issueRewards(address player, uint256 rewards)`
- **Description**: Enables the owner to issue rewards to a player by minting new tokens and transferring them to the player's address.
- **Access**: Only the contract owner can call this function.

### 3. Redeem Rewards

- **Function**: `redeemRewards()`
- **Description**: Allows players to redeem their rewards.
- **Access**: Any player can call this function.

### 4. Burn Tokens

- **Function**: `burn(uint256 amount)`
- **Description**: Allows the owner to burn tokens from their own balance.
- **Access**: Only the contract owner can call this function.

### 5. Check Balance

- **Function**: `checkBalance(address account) returns (uint256)`
- **Description**: Allows players to check their token balances.
- **Access**: Any player can call this function.

### 6. Transfer Tokens

- **Function**: `transferTokens(address recipient, uint256 amount)`
- **Description**: Enables players to transfer tokens to others.
- **Access**: Players must have sufficient balance. Any player can call this function.

## Events

The SpiderManGame contract emits the following events:

- `PlayerKilled`: Indicates when a player defeats enemies and increases their kill count.
- `RewardsIssued`: Signifies when rewards are issued to a player.
- `RewardsRedeemed`: Indicates when a player redeems their rewards.

## Deployment

The contract is deployed with the name "SpiderManToken" and the symbol "SPM". It is initialized with an initial supply of 1,000,000 tokens.

## License
This contract is licensed under the MIT License.
