From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: IPV6 and Pre/post routing
Date: Tue, 2 Feb 2010 12:35:43 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D141884A192A0@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D141884A1929E@HSSBS.holdstead.local>
 <4B687862.7010204@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B687862.7010204@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> > What I'm wondering, after reading some old documentation on iptables,
> > if this is possible with IPV6.
> 
> Netfilter has no support for IPv6 NAT, and hopefully never will.
> Can't the DNS records for mail just point directly to the addresses of
> the mail servers ?

If there is no support for NAT in IPV6, then we will need to do something like that.  The problem is getting clients to update their settings with as little intrusion (from us) as possible.  We inherited some of the configuration which has many of the client using a single hostname name for most services.  So when we needed to migrated to a split platform (where hosted www, imap, and smtp) are all on different servers NAT was the easy part.

But it's good to know what the limitations are (since this is just the information gathering stage) so we can start implementing a plan to get parts of the network onto IPV6.


