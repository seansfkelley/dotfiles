# Tools and libraries

- Strongly prefer using standard library/framework implementations whenever possible.
- Prefer using library implementations even if it's slightly more work than implementing it yourself.

# Code style

- Use code style idiomatic to the language.
- Write initialisms/acronyms as words in type names, like `Url` instead of `URL`.
- Don't include comments that just restate adjacent code; if the code is self-evident don't explain it.

# Workflow

- In typed languages, run the typechecker after making a series of code changes.
- Prefer running single tests, and not the whole test suite, for performance.
- If resolving an error would require not adhering to an explicit request, adhere to the request and note that you did not resolve the error for that reason.
- If asked to resolve an error, make sure that your resolution actually fixes the error instead of assuming it does.
