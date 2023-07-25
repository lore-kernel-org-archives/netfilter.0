From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: ct state module issue
Date: Tue, 25 Jul 2023 14:11:04 -0500
Message-ID: <CAOLfK3WzBo=dPJ0WEvpO4wFPnSp1uEkBXRWpxRSz7Guou3z7kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4R9RTK58dgz9vFPp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1690312276; x=1690917076;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XPXbboa/X/kR5YtlBZn1YKVxtwQ2Ux7fhv5UYZLfwKs=;
        b=RDe6kOrsLmANUvnb3bm303AnkIq1GHPL8bkQcM26VkrVf7ZjJcT5cDPVJNghkkgPXf
         JCCzYAqzzdbfSRZmCiHZGAnBZ/1Ll4UFMqHbDRVWHMz1vAwsEQjJtbGzw63J3wf02ysS
         jkgZ9BohnWrYgjOsDYr8zTuuc00PoTgIl+xp8+mPXTNloTdEIYlmZh2xOqUxB6c2UImE
         MIJWE4weyhxxdC7TWmqCodl0q5uMO+xndalFeVxyK+eXi1EEbeF8+ctfiqVCi+k4McBo
         K3gZFXwjgKjv4je868IzMbtCBF7zEddMU8AUB9sHY19n86TkNgJ5MFssoxZzso3cB7tI
         Qc8Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Greetings netfilter,

I'm running kernel: 6.1.0-10-amd64
and
nftables v1.0.6 (Lester Gooch #5)

I have a set of nftables rules that have served me well for Debian 11
- thanks in large part to the netfilter mailing list, so...thank you!
nftables on Debian 11 is: 0.9.8-3.1+deb11u1

I have recently installed Debian 12 and tried my nftables rules and
have hit a snag with the connection tracking and a verdict map.
nftables on Debian 12 is: 1.0.6-2+deb12u1

When I run the offending snippet:

# nft -f /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft
/etc/nftables.conf.d/300-common.d/200-connection-tracking.nft:4:9-16:
Error: Could not process rule: No such file or directory
        ct state vmap {
        ^^^^^^^^
# cat /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft
table inet filter {
    chain input {
        # accept traffic originated from us
        ct state vmap {
            established: accept,
            related:     accept,
            invalid:     drop,
        }
    }
}

When I watch the kernel logs (journalctl), I see:

Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
Jul 25 13:44:04 localhost kernel: BPF: size=104 vlen=12
Jul 25 13:44:04 localhost kernel: BPF:
Jul 25 13:44:04 localhost kernel: BPF: Invalid name
Jul 25 13:44:04 localhost kernel: BPF:
Jul 25 13:44:04 localhost kernel: failed to validate module
[nf_conntrack] BTF: -22
Jul 25 13:44:04 localhost kernel: missing module BTF, cannot register kfuncs

I've tried to load the module manually:

# lsmod | rg nf
nf_defrag_ipv6         24576  0
nf_defrag_ipv4         16384  0
nf_tables             290816  0
libcrc32c              16384  1 nf_tables
nfnetlink              20480  1 nf_tables
binfmt_misc            24576  1
configfs               57344  1

# modprobe nft_ct
modprobe: ERROR: could not insert 'nft_ct': Unknown symbol in module,
or unknown parameter (see dmesg)

dmesg shows the same as the kernel message as above.

I'm starting to struggle with where to look for debugging clues. Any
help would be very appreciated.

Thank you!

-m
