# Unit Tests for Rii Sports

This directory contains unit tests for the Rii Sports Unity project.

## Test Structure

The test structure mirrors the main Scripts directory structure:

```
Assets/Tests/
├── Input/
│   ├── PlayerInputManagerTests.cs
│   ├── PlayerInputManagerIntegrationTests.cs
│   └── PlayerInputManagerBehaviorTests.cs
├── Tests.asmdef
└── README.md
```

## PlayerInputManager Tests

The PlayerInputManager has comprehensive test coverage with three test files:

### 1. PlayerInputManagerTests.cs
- **Purpose**: Core functionality tests
- **Coverage**:
  - Component existence and type verification
  - PlayerHit method functionality
  - EventDB integration
  - Multiple event subscriber handling

### 2. PlayerInputManagerIntegrationTests.cs
- **Purpose**: Integration and system-level tests
- **Coverage**:
  - Update method execution
  - Multiple manager instances
  - Event system integration

### 3. PlayerInputManagerBehaviorTests.cs
- **Purpose**: Behavioral tests focusing on expected outcomes
- **Coverage**:
  - Event notification behavior
  - Multiple trigger scenarios
  - Multiple listener scenarios
- **Features**: Includes a `TestEventListener` helper class for clean event testing

## Running Tests

### In Unity Editor
1. Open Unity Editor
2. Go to **Window > General > Test Runner**
3. Click on the **EditMode** tab
4. Click **Run All** to run all tests, or select specific tests to run

### Test Categories
- **Unit Tests**: Fast, isolated tests that test individual components
- **Integration Tests**: Tests that verify component interactions
- **Behavioral Tests**: Tests that focus on expected behavior rather than implementation

## Test Framework

The tests use Unity's Test Framework which is based on NUnit. Key features:
- `[Test]` attribute for synchronous tests
- `[UnityTest]` attribute for coroutine-based tests
- `[SetUp]` and `[TearDown]` for test initialization and cleanup
- Reflection-based testing for private methods when necessary

## Coverage

These tests provide comprehensive coverage for PlayerInputManager.cs, testing all public behavior and critical internal functionality while maintaining focus on behavioral outcomes rather than implementation details.
