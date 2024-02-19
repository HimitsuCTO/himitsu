package types

import (
	errorsmod "cosmossdk.io/errors"
	sdk "github.com/cosmos/cosmos-sdk/types"
	sdkerrors "github.com/cosmos/cosmos-sdk/types/errors"
)

var _ sdk.Msg = &MsgSendCidHash{}

func NewMsgSendCidHash(creator string, tomodachi string, cidHash string) *MsgSendCidHash {
	return &MsgSendCidHash{
		Creator:   creator,
		Tomodachi: tomodachi,
		CidHash:   cidHash,
	}
}

func (msg *MsgSendCidHash) ValidateBasic() error {
	_, err := sdk.AccAddressFromBech32(msg.Creator)
	if err != nil {
		return errorsmod.Wrapf(sdkerrors.ErrInvalidAddress, "invalid creator address (%s)", err)
	}
	return nil
}
