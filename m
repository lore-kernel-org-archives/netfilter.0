From: V Kurien <kurien.varugis@gmail.com>
Subject: Ulogd and conntrack issues
Date: Mon, 13 Mar 2017 10:49:17 -0700
Message-ID: <CACmTqUmdOmY7jdr3eg6D17bPjipdc1bRrd6K4A6Z5n1_4i4d9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=CBSczKikdD56Rs7crhvyhLKjQF53kalCjTFxeYiXmmU=;
        b=p5SKbWKKEsrq5TGCvHn/LMTNksmPXa/FE/fUyzIZsDax2QLwKjyW992uhtNPAztN5D
         lnD7aEjukmzaVsh1MC2jVLtnjeiuXudze5aEsAdPc9kOipWXdBs//fnhURvSTJAiYFYP
         eFoc0MT+hSM1uuJ5QSagFVBubj23CBRC0X5zo49kRakNZO8L4Jjjd0ihelrmJWLeHUIk
         8e1k5WYcKS4zGYhrobvNT6ZGQ90CLPtUl/ErQN7PNXJ92pE6BdoOSzGgU6sHH4t/za5X
         XJRhoIjw+JqyTBgeCb41S4+TqYELHRhdShIgpDVXpfqGO0AJJtRVr6CbRkivqM4dw4zP
         Lsvg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys,
I've been trying to get conntrack logging working with ulogd2 on a
Ubuntu 4.4.0-59 generic kernel with no avail by following instructions
gleaned from google searches. I'm hoping that someone here can set me
on the right path:

Here is what I have done:

a) modprobe'd: nf_conntrack_ipv4, nf_conntrack_ipv6, modprobe
nf_conntrack_netlink,xt_connmark, xt_NFLOG,xt_conntrack
b) Iptables rules: -A INPUT -p tcp -j CONNMARK --set-xmark 0x10/0x10,
-A OUTPUT -p tcp -j CONNMARK --set-xmark 0x10/0x10
c) The stack section of ulogd.conf looks like:
stack=log:NFCT,mark:MARK,ip2str:IP2STR,print:PRINTFLOW,out:GPRINT

Where the sections here look like:
[log]
accept_proto_filter=tcp
[mark]
mark=0x10
mask=0x10
[out]
file="/var/log/ulog/ulogd_tcp.log"
sync=1


However I get nothing at all in the log even though there are flows
transitioning this host:

conntrack -L|grep tcp
conntrack v1.4.3 (conntrack-tools): 47 flow entries have been shown.
tcp      6 431999 ESTABLISHED src=10.0.100.248 dst=10.0.33.244
sport=51890 dport=6666 src=10.0.33.244 dst=10.0.100.248 sport=6666
dport=51890 [ASSURED] mark=16 use=1
tcp      6 431999 ESTABLISHED src=10.0.100.248 dst=10.0.138.44
sport=22 dport=56405 src=10.0.138.44 dst=10.0.100.248 sport=56405
dport=22 [ASSURED] mark=16 use=1
tcp      6 431985 ESTABLISHED src=10.0.100.248 dst=173.225.26.234
sport=52066 dport=443 src=173.225.26.234 dst=10.0.100.248 sport=443
dport=52066 [ASSURED] mark=16 use=1

What could I be doing wrong? Are there better ways to do this? Note
that ULOG has been removed in recent kernels.
