package tdd

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSay(t *testing.T) {
	// when
	actual := Say("Hello!")

	// then
	assert.Equal(t, "Hello! TDD BootCamp!!", actual, "they should be equal")
}
