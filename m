From: Andreas Schultz <aschultz@tpip.net>
Subject: nft iptable-compat and TCPMSS target
Date: Fri, 9 Jan 2015 12:36:41 +0000 (UTC)
Message-ID: <364870882.1567460.1420807001598.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

A few xt targets do check that the match condition is correct for them.
xt_TCPMSS is one of them. Since nft_compat does not (and probably can
not) pass the match condition into the target check, the target check
will fail.

So all xt targets that perform checks on their match conditions are
unusable with nft_compat.

Is this expected behavior or a bug?

Andreas
