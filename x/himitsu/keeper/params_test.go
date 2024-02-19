package keeper_test

import (
	"testing"

	"github.com/stretchr/testify/require"

	keepertest "himitsu/testutil/keeper"
	"himitsu/x/himitsu/types"
)

func TestGetParams(t *testing.T) {
	k, ctx := keepertest.HimitsuKeeper(t)
	params := types.DefaultParams()

	require.NoError(t, k.SetParams(ctx, params))
	require.EqualValues(t, params, k.GetParams(ctx))
}
