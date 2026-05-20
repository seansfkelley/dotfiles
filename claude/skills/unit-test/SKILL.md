---
name: unit-test
description: >
  Adds unit tests to an existing codebase by first studying the project's established test patterns, then writing new tests that match them. Use this skill whenever the user asks to write, add, or generate unit tests, test a specific function or module, improve test coverage, or write tests before or after implementation. Also use it when the user says things like "add tests for X", "test this", "write some tests", "cover this with tests", or "what should I test here". This skill applies across languages — it has specific guidance for some languages but the core approach works anywhere.
---

# Writing Unit Tests

Your job is to add tests that fit naturally into the project — not to demonstrate testing best practices in the abstract, but to produce tests that look like they belong alongside the ones already there.

## Step 1: Study the existing tests

Before writing anything, read a representative sample of existing tests. Look for:

- **File organization** — Where do tests live? Are they co-located with source, in a separate directory, one file per module?
- **Framework and imports** — What testing library is used? (XCTest, Swift Testing, Jest, Vitest, pytest, etc.)
- **Naming conventions** — How are test functions and classes named? (camelCase, snake*case, `test*`, `it("...")`, etc.)
- **Assertion style** — `#expect(...)`, `XCTAssertEqual(...)`, `expect(...).toBe(...)`, `assert ...`?
- **Setup patterns** — Is there a shared `setUp`/`beforeEach`, fixtures, factories?
- **How tests are grouped** — Suites, describe blocks, classes, flat functions?
- **Parameterized tests** — Does the project use them? In what form?
- **Test data** — Inline literals, factory functions, shared constants?

The goal is to make your tests indistinguishable in style from the existing ones. If you can't find existing tests or they're sparse, default to idiomatic patterns for the language (see language-specific notes below), then flag that you're establishing a pattern rather than following one.

## Step 2: Understand what to test

Read the code under test carefully. Identify:

- **The public surface** — Functions, methods, and properties that callers depend on
- **Logical branches** — Conditionals, loops, error paths, edge cases
- **Invariants** — Things that should always be true
- **Side effects** — Mutations, network calls, file I/O (these may need mocking)

Don't aim for 100% coverage mechanically. Aim for tests that would catch real bugs. A test that verifies obvious behavior is noise; a test that catches a subtle edge case is signal.

## Step 3: Write the tests

Match the style you found. Specifically:

- Use the same framework, imports, and assertion macros as the rest of the test suite
- Follow the naming convention already in use
- Put tests where tests already live (same directory structure, same file naming pattern)
- Keep each test focused on one behavior

Where the existing tests are terse, be terse. Where they're verbose and descriptive, be descriptive. You're contributing to a codebase, not authoring a textbook.

You may diverge from the project style in the following specific cases, though note you have done so in your summary after writing the tests:

- Prefer using parameterized tests if the language/framework support it and the tests you're writing are short/highly repetitive

## Step 4: Verify

After writing, check:

- Do the tests compile/parse? (Run the typechecker or linter if available)
- Are test names clear enough that a failure message would tell you what broke?
- Did you cover the happy path, obvious error cases, and at least one edge case?

---

## Swift-specific notes

Swift projects use either **XCTest** or **Swift Testing** — check which one is in use before writing anything.

**Swift Testing** (newer, `import Testing`):

- Use `@Suite` for grouping, `@Test` for test functions
- Assertions use `#expect(...)` and `#require(...)`
- Parameterized tests: `@Test("description", arguments: [...])`
- Test functions don't need to start with `test`
- Use `try #require(...)` instead of non-nil assertions or nil coalescing when downstream test code needs the value

**XCTest** (older, `import XCTest`):

- Classes inherit from `XCTestCase`
- `setUp()` / `tearDown()` for shared state
- Assertions: `XCTAssertEqual`, `XCTAssertTrue`, `XCTAssertThrowsError`, etc.
- Test functions must start with `test`

Don't mix frameworks in the same file. If the project is migrating, follow whichever framework the nearby tests use.

---

## TypeScript-specific notes

Check `package.json` for the test runner (Jest, Vitest, Mocha). Look at existing test files for:

- Whether they use `describe`/`it` or `test` at the top level
- Whether they use `beforeEach` for setup
- Mock style: `jest.fn()`, `vi.fn()`, manual mocks in `__mocks__/`

Prefer `it("should X when Y")` phrasing — it reads as a spec. Keep setup in `beforeEach` only if it's shared across multiple tests; otherwise inline it.

For async tests, prefer async/await (vs `.resolves`/`.rejects`) unless told otherwise.
