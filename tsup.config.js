import { defineConfig } from "tsup";

export default defineConfig((options) => {
  return {
    ...options,
    entry: ["src/index.js"],
    // entry: {
    //   entryA: 'src/indexA.js',
    //   entryB: 'src/indexB.js',
    // },
    splitting: true,
    sourcemap: true,
    clean: true,
    format: ["cjs", "esm"],
    dts: true,
    minify: true,
    // treeshake: true,
    // "legacy-output": true,
  };
});
