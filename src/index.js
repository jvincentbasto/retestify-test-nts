import { testUtils } from "./utils";
// import type { TypeTestPackage } from "./types";

// export const testPackage = (name: TypeTestPackage = "retestify package", branch: TypeTestPackage = "master") => {
export const testPackage = (name = "retestify package", branch = "master") => {
  return testUtils(name, branch);
};
export default testPackage;
