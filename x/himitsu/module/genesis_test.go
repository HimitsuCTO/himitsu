package himitsu_test

import (
	"testing"

	keepertest "himitsu/testutil/keeper"
	"himitsu/testutil/nullify"
	himitsu "himitsu/x/himitsu/module"
	"himitsu/x/himitsu/types"

	"github.com/stretchr/testify/require"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		Params: types.DefaultParams(),

		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.HimitsuKeeper(t)
	himitsu.InitGenesis(ctx, k, genesisState)
	got := himitsu.ExportGenesis(ctx, k)
	require.NotNil(t, got)

	nullify.Fill(&genesisState)
	nullify.Fill(got)

	// this line is used by starport scaffolding # genesis/test/assert
}
