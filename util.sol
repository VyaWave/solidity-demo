pragma solidity = 0.6.6;


contract Console {

  event LogUint(string, uint256);

    function log(string s, uint256 x) internal {
        emit LogUint(s, x);
    }

    event LogIntConsole(string, int256);

    function log(string s, int256 x) internal {
        emit LogInt(s, x);
    }

    event LogBytes(string, bytes);

    function log(string s, bytes x) internal {
        emit LogBytes(s, x);
    }

    event LogBytes32(string, bytes32);

    function log(string s, bytes32 x) internal {
        emit LogBytes32(s, x);
    }

    event LogAddress(string, address);

    function log(string s, address x) internal {
        emit LogAddress(s, x);
    }

    event LogBool(string, bool);

    function log(string s, bool x) internal {
        emit LogBool(s, x);
    }

}
