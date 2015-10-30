#!/usr/bin/env python

import os
import subprocess


def mailpasswd(acct):
    acct = os.path.basename(acct)
    path = "/home/urbain/.password-store/Mail/%s.gpg" % acct
    args = ["gpg2", "--use-agent", "--quiet", "--batch", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""
