From: Andreas Schultz <aschultz@tpip.net>
Subject: nft: bitoperations between ct and nf mark
Date: Fri, 3 Jul 2015 11:23:17 +0200 (CEST)
Message-ID: <1998516528.1793161.1435915397699.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

With iptables CONNMARK, one could something like:

 ... -j CONNMARK --restore-mark --nfmask 0xAA --ctmask 0x0F

There seems to be no way to replicate this with nftables meta ct
and mark.

Attemting so use something like:

meta mark set (meta & 0xffffff55) | (ct mark & 0xfffffff0)

results in:

> Error: Right hand side of binary operation (&) must be constant

How i can replicate the restore mark with masks behavior in nft?

Regards
Andreas
