# What is this?

A dockerized setup for Emacs, customized for editing TypeScript files.  It's
set up for GitHub Copilot (run `copilot-login` in Emacs) and expects you to
have 1Password's SSH Agent configuration in place so all authentication is
done through Touch ID (or however you have it set up).

I find this particularly helpful because my entire dev setup is reproducible
with just a make command and I can pin compiler versions etc so that I can
play with different setups during major version upgrades etc without having to
tear everything down.

# How do I try it?

Clone the repo, run `make`.

You'll probably need to restart your Docker Desktop with SSH_AUTH_SOCK, but
the build process will output instructions to you on how to do that.
