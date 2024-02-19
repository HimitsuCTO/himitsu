package keeper

import (
	"himitsu/x/himitsu/types"
)

var _ types.QueryServer = Keeper{}
