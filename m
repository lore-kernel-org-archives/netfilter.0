From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Multiple IPs to 2 interfaces problem with default route
Date: Thu, 4 Mar 2010 03:19:51 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1003040318220.21973@aurora.sdinet.de>
References: <4B7A7F39.5090808@perfaction.net> <4B7ABBED.1020404@chello.at> <4B8E1F71.6060806@perfaction.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8E1F71.6060806@perfaction.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Chemla <patrick.chemla@perfaction.net>
Cc: netfilter@vger.kernel.org

On Wed, 3 Mar 2010, Patrick Chemla wrote:

> I have set up a Fedora 11 NAT server to NAT outgoing traffic to 2 interfaces
> to 2 ISPs.

> It works very fine with one interface, but when I try to activate the second
> interface, I think I get a problem with the default route.
> 
> When I started the interfaces, eth1 got a public IP and a default gateway.
> This default gateway is the default gateway for all the server. eth2 has his
> own public IP, own gateway.
> 
> I tried to remove the default gateway, thinking the route will be according to
> the NAT setup, but no more packet can get out of the server.
> 
> But I need to split packets to interfaces eth1 and eth2 according to the
> public IP of the internal server, not according to a default route always
> pointing to eth1.
> 
> How can I set up these routes?

Look for "source based routing" or "policy routing" - this hasn't got 
much to do with NAT or netfilter.

Something like
http://lartc.org/howto/lartc.rpdb.html
may help you.

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
