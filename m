From: Andreas Schultz <aschultz@tpip.net>
Subject: tproxy with nftables
Date: Mon, 5 Jan 2015 14:05:43 +0000 (UTC)
Message-ID: <1981739983.1515764.1420466742999.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Is it possible to use tproxy with nftables?

It seem that nft has no support for the tproxy table. It might
be possible to use a mix of nft and xtable-compat to get tproxy
to work on nft.

But I would like to use a map to lookup a match and then use tproxy
as action. I there a way to get this working?

Andreas
