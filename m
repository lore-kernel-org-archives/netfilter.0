From: toml <toml@thlu.de>
Subject: Nftables + ALG + Linux 6.1.0-10-amd64
 =?UTF-8?Q?=E2=80=A6=3F=2E=2E=2E?= is it a kown Problem?
Date: Mon, 31 Jul 2023 09:57:51 +0200
Message-ID: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Good morning

After updating my server from Bullseye to Bookworm I noticed that my
NFT rules seem to be causing problems lately. Upon closer inspection,
the running process came to a virtual halt with a kernel-panic-message
in the journal. I was able to somehow narrow down the cause of the
error to the application layer gateway - because it was running without
it. Interestingly, I was able to open other consoles during the crash
with ctrl-alt-f2/5, with (except for the network) apparently full
functionality, to restart the machine. However, that Shutdown didn't
work in the normal way either, but only with clear coercion: 'systemctl
poweroff -f -f'.  Finally I reverted back to Bullseye, because
stability was more important to me.

I then looked at the problem further in a Bookworm-VM, same problem,
same cause, but without this dramatic effect. It seems, my problem is
the ALG-FTP and the passive mode during file transfer... this obviously
doesn't work anymore with Linux 6.1.0-10-amd64 at the moment. On my VM
it looks like this:

# cat /etc/modules-load.d/modules.conf
    # /etc/modules: kernel modules to load at boot time.
    #
    # This file contains the names of kernel modules=C2=A0
    # that should be loaded at boot time, one per line.=C2=A0
    # Lines beginning with "#" are ignored.

    nf_conntrack
    nf_conntrack_ftp
    nf_conntrack_tftp

# journalctl -b | grep -i conntrack
    Jul 30 20:33:31 ftps systemd-modules-load[238]:=C2=A0
    Inserted module 'nf_conntrack'
    Jul 30 20:33:31 ftps systemd-modules-load[238]:=C2=A0
    Inserted module 'nf_conntrack_ftp'
    Jul 30 20:33:31 ftps systemd-modules-load[238]:=C2=A0
    Inserted module 'nf_conntrack_tftp'

# lsmod | grep nf_
    nf_reject_ipv4         16384  1 nft_reject_ipv4
    nf_tables             290816  119 nft_reject_ipv4,nft_ct,nft_reject
    nfnetlink              20480  1 nf_tables
    nf_conntrack_tftp      20480  0
    nf_conntrack_ftp       24576  0
    nf_conntrack          188416  3=C2=A0
nf_conntrack_tftp,nft_ct,nf_conntrack_ftp
    nf_defrag_ipv6         24576  1 nf_conntrack
    nf_defrag_ipv4         16384  1 nf_conntrack
    libcrc32c              16384  2 nf_conntrack,nf_tables

# ls /proc/sys/net/netfilter/net.netfilter.nf_conntrack_helper
    ls: File not found

I cannot enable the conntrack-helper with '1'.

Does anyone know if this is a known problem? What irritates me about
the whole thing is the fact, that connection/file transfer with 'active
mode' still seems to work, despite missing (!) open ports 1024-65535.=20
That is, I am currently at a loss.

Best regards
Thomas

(Translated with deepl)
