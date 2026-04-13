---

# macOS Dotfiles: Fix bugs in config.sh

## Overview

Fix bugs and inconsistencies in `mac/config.sh` - broken heredoc, duplicate defaults writes, Spotlight configuration issues, stale launchctl command, and hardcoded hostname.

## Context

- Files involved: `mac/config.sh`
- This is a bare-repo-pattern dotfiles repository (no test suite, no CI)
- Focus: macOS only (ignoring linux/ and windows/ directories)

## Development Approach

- No test suite exists for this project; validation is manual (run the script, check results)
- Complete each task fully before moving to the next

## Implementation Steps

### Task 1: Fix bugs in config.sh

**Files:**
- Modify: `mac/config.sh`

**Bug 1 - Broken heredoc for Touch ID sudo (lines 123-125):**
The closing `EOF` has leading spaces, so the heredoc never terminates properly. Also, the `auth` line gets written with leading spaces, which can break PAM parsing.
```
  sudo tee /etc/pam.d/sudo_local <<EOF    # <<EOF is fine
  auth       sufficient     pam_tid.so    # leading spaces go into the file
  EOF                                     # won't match - has leading spaces
```
Fix: remove indentation from heredoc content and closing delimiter.

**Bug 2 - Duplicate defaults writes (lines 12-27):**
Lines 12-18 write to `NSGlobalDomain` and lines 20-26 write the exact same keys via `-g` (which is just an alias for `NSGlobalDomain`). Every setting is written twice. Remove the duplicate block.

**Bug 3 - Misleading killall Spotlight (line 120):**
`killall Spotlight` is indented as if part of the defaults array but runs as a separate command. Dedent it and note that `killall mds` might be more appropriate to restart indexing.

**Bug 4 - Spotlight disables everything:**
All 20 categories are disabled (enabled=0), including APPLICATIONS. This makes Spotlight completely non-functional. The commented-out version in install.sh keeps APPLICATIONS and SYSTEM_PREFS enabled. Reconcile these - probably want at least APPLICATIONS enabled.

**Bug 5 - Potentially outdated launchctl command (line 76):**
`launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist` may fail on modern macOS due to SIP protection. Consider removing or wrapping with a check.

- [ ] Fix heredoc indentation for sudo_local PAM config
- [ ] Remove duplicate NSGlobalDomain/-g defaults block (lines 20-27)
- [ ] Dedent killall Spotlight, consider changing to killall mds
- [ ] Decide Spotlight policy: re-enable APPLICATIONS category or remove the duplicate config from install.sh
- [ ] Remove or comment the launchctl rcd.plist line with a note about SIP
- [ ] Parameterize NAME variable (currently hardcoded as "air")
