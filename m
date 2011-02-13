From: Pandu Poluan <pandu@poluan.info>
Subject: DSCP bit-order confusion
Date: Sun, 13 Feb 2011 12:26:21 +0700
Message-ID: <AANLkTi=nrN55HWi5yS_JA5kjhYtLaJCayKFkMb6Zx24g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all.

Okay, this have been driving me nuts for the past 2 days.

According to RFC2474, there are three pools of DSCP. I want to use
Pool 2 for local use. According to the said RFC, the DSCP field should
be set to xxxx11 (leftmost is bit 0, rightmost id bit 5)

So, that means if I use -j DSCP --set-dscp, the 16 values of Pool 2
would be between 0x30 and 0x3f, inclusive.

Am I right?

(The reason why I want to use the DSCP Pool 2 is to provide a 'key' to
iproute2 to perform policy-based routing based on tos/dsfield; I can't
use fwmark because it's used for tc)

Rgds,


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
