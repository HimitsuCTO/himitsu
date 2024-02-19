# Specify the name of your binary
BINARY_NAME := himitsud

# Specify the directories where your source code files reside
SRC_DIRS := ./cmd/himitsud ./x/himitsu

# Specify the compiler and flags
GO := go
GOFLAGS :=
LDFLAGS :=

# Define the build target
build:
	@echo "Building $(BINARY_NAME)..."
	@$(GO) build $(GOFLAGS) -o $(BINARY_NAME)

# Define the install target
install:
	@echo "Installing $(BINARY_NAME)..."
	@$(GO) install $(GOFLAGS) $(SRC_DIRS)

# Define the clean target
clean:
	@echo "Cleaning up..."
	@rm -f $(BINARY_NAME)

# Define the default target
default: build

# Define phony targets (targets that are not file names)
.PHONY: build install clean default

