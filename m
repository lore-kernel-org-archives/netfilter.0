From: Pieter van Leuven <pieter@vanleuven.org>
Subject: Typo in the 'Mangle TCP options' wiki pages
Date: Fri, 21 Feb 2020 19:08:55 +0100
Message-ID: <20200221180855.GA6851@vanleuven.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I think a found a typo in the wiki pages of nftables.
https://wiki.nftables.org/wiki-nftables/index.php/Mangle_TCP_options mentioned the following command:

nft add rule ip filter forward oifname ppp0 tcp flags syn tcp option maxseg size set rt mtu

But this didn't solved my problem.

In the release notes:
http://lists.netfilter.org/pipermail/netfilter-announce/2017/000225.html mentioned the following command:

nft add rule mangle forward tcp flags syn tcp option maxseg size set rt mtu

and this works. Logical, because now it is in the right table.

Best Regards,
   Pieter 



