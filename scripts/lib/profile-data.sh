#!/usr/bin/env bash
#
# Pure build-profile mappings shared by the resolver and its offline tests.
# This file performs no network or filesystem operations.
#
# Functions intentionally populate globals consumed by the sourcing script.
# shellcheck disable=SC2034


list_build_profiles() {
  printf '%s\n' \
    "SM7550 | OnePlus Nord CE4 | development" \
    "SM7550 | OnePlus Nord CE4 | crDroid (recommended for crDroid)" \
    "SM8450 | OnePlus 10 Pro | OnePlus official" \
    "SM8450 | OnePlus 10T / Ace Pro | LineageOS community" \
    "SM8550 | OnePlus 11 | OnePlus official" \
    "SM8550 | OnePlus 11 | LunarisOS" \
    "SM8550 | OnePlus 11 / 12R | LineageOS (recommended)" \
    "SM8550 | OnePlus 11 / 12R | crDroid" \
    "SM8550 | OnePlus 12R | development" \
    "SM8650 | OnePlus 12 | OnePlus official" \
    "SM8650 | OnePlus 12 | LineageOS (recommended)" \
    "SM8650 | OnePlus 12 | crDroid"
}


resolve_build_profile() {
  local profile="$1"


  # Most profiles use the conventional android_kernel_* repository names and
  # the same branch for the kernel and modules. Source-specific profiles can
  # override those defaults without complicating the common resolver path.
  KERNEL_REPO_OVERRIDE=""
  MODULES_REPO_OVERRIDE=""
  MODULES_BRANCH_OVERRIDE=""
  KERNEL_MAKE_FLAGS=""


  case "$profile" in
    "SM7550 | OnePlus Nord CE4 | development")
      PROFILE_ID="sm7550-oneplus-nord-ce4-dev"
      SOC="sm7550"
      TARGET_NAME="OnePlus Nord CE4"
      DEVICE_CODENAMES="benz"
      DEVICE_NAMES="benz OP5D3FL1 CPH2613"
      KERNEL_SOURCE="OnePlus-Nord-CE4-development"
      SOURCE_LAYOUT="community-flat"
      KERNEL_MAKE_FLAGS="CONFIG_OPLUS_DEVICE_DTBS=y CONFIG_BENZ_DTB=y"
      ;;
    "SM7550 | OnePlus Nord CE4 | crDroid (recommended for crDroid)")
      PROFILE_ID="sm7550-oneplus-nord-ce4-crdroid"
      SOC="sm7550"
      TARGET_NAME="OnePlus Nord CE4"
      DEVICE_CODENAMES="benz"
      DEVICE_NAMES="benz OP5D3FL1 CPH2613"
      KERNEL_SOURCE="crdroidandroid"
      SOURCE_LAYOUT="community-flat"
      # Keep parity with crDroid's benz BoardConfig.mk. These are make
      # command-line assignments, not ordinary defconfig fragments.
      KERNEL_MAKE_FLAGS="CONFIG_OPLUS_DEVICE_DTBS=y CONFIG_BENZ_DTB=y"
      ;;
    "SM8450 | OnePlus 10 Pro | OnePlus official")
      PROFILE_ID="sm8450-oneplus10pro-official"
      SOC="sm8450"
      TARGET_NAME="OnePlus 10 Pro"
      DEVICE_CODENAMES="negroni"
