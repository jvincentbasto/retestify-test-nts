# @retestify-test-nts

**NTC (NODE - TSUP - SEMANTIC-RELEASE w/ COMMITIZEN)**

Format: [Framework] - [Bundler] - [Versioning]
Only for testing purposes

## Getting started

### Installation

Install the package through any of the package managers:

```bash
# npm
npm i @retestify-test-nts

# yarn
yarn add @retestify-test-nts

# pnpm
pnpm add @retestify-test-nts

# bun
bun add @retestify-test-nts

```

### Import Package

The package can be used by type `common js` or `es modules`

```javascript
// cjs
const ntc = require("@retestify-test-nts");

// mjs
import ntc from "@retestify-test-nts";
```

## Versioning Documentation

**CURRENT VERSION: `semantic-release: ^24.1.2`**

#### NOTE: MAKE SURE NOT TO MODIFY THE PACKAGE VERSION ONCE INITIALIZED

**NOTE:**
All steps indicated here are not part of a standard procedure, as this is **experimental**.

### Instructions:

- Follow the steps listed below even though they may not align with typical best practices.
- If you find areas of improvement, you are encouraged to **submit a pull request** to refine this experimental process.
  **Otherwise**, ensure that you **comply with the rules** as they are, without deviation.

### Semantic Commit Options:

- **Patch Release**

```bash
# Formats:
# git commit -m "fix: [message]"
# git commit -m "fix([scope]): [message]"

git commit -m "fix: fix initial"
git commit -m "fix(index.js): fix index"
git commit -m "fix(dashboard): fix dashboard"
```

- **Minor Release**

```bash
# Any commit type other than "fix:"
# Typical commit type:
# feat(feature) | perf(performance) | ref(refactor) | rev(revert)
# docs(documents) | styles | build

# Formats:
# git commit -m "feat: [message]"
# git commit -m "feat([scope]): [message]"
# git commit -m "perf: [message]"
# git commit -m "perf([scope]): [message]"

git commit -m "feat: new feature"
git commit -m "feat(index.js): update feature"
git commit -m "rev(dashboard): revert commit"
```

- **Major Release**

```bash
# Any commit type with an "Exclamation (!)" or
# Any commit type with additional footer message "BREAKING CHANGE:" (NOTE: Capitalized)

# Formats:
# git commit -m "fix!: [message]"
# git commit -m "feat([scope])!: [message]"
# git commit -m "perf([scope]): [message]" -m "BREAKING CHANGE: [more-detailed-message]"
# git commit -m "ref([scope]): [message] BREAKING CHANGE: [more-detailed-message]"

git commit -m "fix!: a major fix"
git commit -m "feat(products)!: major update on products"
git commit -m "perf(cart): improved cart performance" -m "BREAKING CHANGE: improved cart performance on actions"
git commit -m "ref(orders): major refactor on orders BREAKING CHANGE: refactor orders with the new api"
```

### Commitizen (Application):

```bash
# This is an cli that will make commits easier
git-cz
git cz
cz
```

### Semantic Versioning Behavior:

By **default**, semantic-release does not update the **package version (`package.json`)**,
and its being handle automatically by semantic-release in npm package's versions **(`npm registry`)**

- To enable semantic-release handle automatic versioning, set **`package.json` version** as a placeholder, use:
  - **`0.0.0-development`**
  - **`0.0.0-semantically-released`**

#### NOTE: MAKE SURE NOT TO MODIFY THE PACKAGE VERSION ONCE INITIALIZED

### Semantic's 1st major stable release (Behavior):

**NOTE:** a minor release at version **`0.x`**

### Semantic Config:

Create a **`release-config.js`** and copy as a template

```javascript
/**
 * @type {import('semantic-release').GlobalConfig}
 */

module.exports = {
  branches: ["master", { name: "next", prerelease: true }],
};
```

#### Channel Release (Tags):

- Default: lastest
- Name: alpha, beta, next, dev
- Version [ **`N.N.x`** , **`N.x`** ]:
  - 1.0.x
  - 1.x

#### Range Types:

- **`N.N.x`:** [`specified-number`].[`specified-number`].[`incremental`]
- **`N.x`:** [`specified-number`].[`incremental`]

#### Branch Types:

- Release branch

```javascript
// By default, channgel is "@latest" as dist-tag
//

//
module.exports = {
  branches: [
    // master => latest@0.0.0
    "master",
    // next => next@0.0.0
    "next",
    // dev => development@0.0.0
    { name: "dev", channel: "development" },
  ],
};
```

- Maintenance branch

```javascript

module.exports = {
  // 1.0.x => [package]@ch1.0.x@1.0.0
  // Start (1.0.0) | End (!>) 1.0.0
  // 1.0.[x] => 1.0.1 | 1.0.2
  { name: "1.0.x", range: "1.0.x", channel: "ch1.0.x" },

  // 2.x => [package]@ch2.x@2.0
  // Start (2.0.0) | End (!>) 3.0.0
  // 2.[x] => 2.1.0 | 2.1.1
  { name: "2.x", range: "2.x", channel: "ch2.x" },
};
```

- Pre-release branch

```javascript
module.exports = {
  branches: [
    // master => latest@0.0.0
    // master => latest@0.0.0-alpha.0
    "master",
    { name: "alpha", prerelease: true }
    // next => next@0.0.0
    // next => next@0.0.0-beta.0
    { name: "next", channel: "next", prerelease: "beta" }
  ],
};
```

## LICENSE

MIT. See the LICENSE file.

[Node]: https://nodejs.org/en
[Tsup]: https://www.npmjs.com/package/tsup
[Semantic]: https://www.npmjs.com/package/semantic-release
[Commitizen]: https://www.npmjs.com/package/commitizen
