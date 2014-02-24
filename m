From: Thomas =?ISO-8859-1?Q?Sch=E4fer?= <tschaefer@t-online.de>
Subject: 464XLAT with iptable nftables?
Date: Mon, 24 Feb 2014 14:26:42 +0100
Message-ID: <2235402.mafHSQGN3F@eee-box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

464XLAT (RFC 6877) uses for IPv4/v6-translations SIIT (different RFCs). 
One part of 464XLAT is NAT64 the provider-side translator (PLAT) and one part 
is the customer-side translator CLAT. 

For NAT64(PLAT) and CLAT there is working solution called: tayga
http://www.litech.org/tayga/
https://mail.gnome.org/archives/networkmanager-list/2014-February/msg00039.html

tayga still works with kernel 3.x, no doubt about it. But it es quite old.

Therefore my question: Is it possible to configure CLAT only with iptables or 
the new nftables?

Thomas




