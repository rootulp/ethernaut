// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

import '../BaseLevel.sol';
import './Fallback.sol';

contract FallbackFactory is Level {

  function createInstance(address _player) override public payable returns (address) {
    _player;
    Fallback instance = new Fallback();
    return address(instance);
  }

  function validateInstance(address payable _instance, address _player) view override public returns (bool) {
    Fallback instance = Fallback(_instance);
    return instance.owner() == _player && address(instance).balance == 0;
  }
}
