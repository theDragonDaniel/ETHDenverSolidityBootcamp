// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";

// Contract under test
import {VolcanoCoin} from "../src/VolcanoCoin.sol";

contract VolcanoCoinTest is Test {
  VolcanoCoin private v;

  function setUp() public {
    v = new VolcanoCoin();
  }

  function test_GetSupply() public {
    assertTrue(v.getTotalSupply() == 10000);
  }

  function test_AddSuply() public {
    v.addSupply();
    assertTrue(v.getTotalSupply() == 11000);
  }
  function test_OnlyOwnerIncrease() public {
    vm.expectRevert();
    vm.prank(address(0x1));
    v.addSupply();
  }
  }
