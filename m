From: Wolfram Schlich <lists@wolfram.schlich.org>
Subject: PaX killing conntrackd (strange "execution attempt")
Date: Thu, 13 Nov 2008 11:03:09 +0100
Message-ID: <20081113100309.GH26975@bla.fasel.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bla.fasel.org; h=date:from
	:to:subject:message-id:mime-version:content-type; s=mx; bh=GJnbf
	dEUS+HnESpOtIqpHymqfJs=; b=Dih6SpMSaXbbxynHiCgx4Ea29gGJlpVWPb3v/
	Z1sopOGV+DGIgTleHjSxDpDoRLbgyvOeqSLoqQ6EdE1N5TMkM9bhx1BeHHOoJdKL
	FdyQKt1h9SfJHupUaIE2C2OoFbdjP3d/Q/L2/pTZiYTipfrLRmiDXQHz8rKMmdx2
	2NcHAs=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, grsecurity@grsecurity.net

Hi,

I set up a testbed for an HA firewall using Gentoo Hardened,
keepalived and conntrackd.
After running for several hours, the kernel (PaX) seems to
terminate the conntrackd process on the currently active
firewall (hafw2) due to some odd execution attempt in a
non-executable page:

--8<--
2008-11-13 07:38:34 +01:00; hafw2; kern.notice; kernel: ip4t_FW DENY_IN: IN=eth1 OUT= MAC=XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX SRC=XX.XXX.XX.XX DST=XX.XX.XXX.X LEN=48 TO
S=0x00 PREC=0x00 TTL=118 ID=23801 DF PROTO=TCP SPT=2608 DPT=21 WINDOW=65535 RES=0x00 SYN URGP=0
2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: execution attempt in: <NULL>, 00000000-00000000 00000000
2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: terminating task: /usr/sbin/conntrackd(conntrackd):6562, uid/euid: 0/0, PC: 0000000000000000, SP: 0000797077f7ea48
2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: bytes at PC: ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
2008-11-13 07:38:34 +01:00; hafw2; kern.err; kernel: PAX: bytes at SP-8:
2008-11-13 07:38:34 +01:00; hafw2; kern.alert; kernel: grsec: denied resource overstep by requesting 4096 for RLIMIT_CORE against limit 0 for /usr/sbin/conntrackd[conntrackd:
6562] uid/euid:0/0 gid/egid:0/0, parent /sbin/init[init:1] uid/euid:0/0 gid/egid:0/0
--8<--

The log messages look somewhat strange, especially the 'NULL',
'000..' and '??' parts :) I've always only seen such messages
with a more meaningful content so far, thus I'm a bit confused.

What might be the reason for that?

Used software:
- Gentoo Hardened
- Kernel: 2.6.27.5 (Gentoo hardened-sources-2.6.27-r1, that is
  vanilla 2.6.27.5 + grsecurity 2.1.12-2.6.27.5-200811071900 +
  some other smaller patches)
  .config: http://paste.frubar.net/9326/txt
- keepalived 1.1.15 (from Gentoo Portage)
- conntrack-tools 0.9.8 (from Gentoo Portage)

As you can see, a coredump was prevented by a resource limit.
I've now removed the limit and am trying to reproduce the
situation in order to get a coredump.
-- 
Regards,
Wolfram Schlich <wschlich@gentoo.org>
Gentoo Linux * http://dev.gentoo.org/~wschlich/
