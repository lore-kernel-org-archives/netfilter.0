From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: banning bot ips with ipset
Date: Tue, 25 Nov 2008 22:25:17 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0811252145030.31197@mail3.jubileegroup.co.uk>
References: <492C6780.4020909@xprima.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <492C6780.4020909@xprima.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Heron <nigel-ml@xprima.com>
Cc: netfilter@vger.kernel.org

Hi there,

On Tue, 25 Nov 2008, Nigel Heron wrote:

> We're being attacked by a botnet ... started dropping them in
> iptables, once we got to ~1700 banned ips the server stopped nat'ing
> completely (not sure why..)

It probably just ran out of steam.  The performance of iptables with
thousands of rules can be poor if you don't structure them carefully.

> Is ipset stable enough to be deployed on live environments?

I've been using it for years with absolutely zero problems.

> iphash seems like the best set type for us, how many
> ips can the set handle before there's a noticeable slowdown?

I currently have about 50,000 ipset (iphash) rules on modest hardware,
with no noticeable performance impact.  There's a good report here:

http://people.netfilter.org/kadlec/nftest.pdf

One of the authors also wrote ipset.  He's on this list.

> obviously, we don't expect ipset to help us with the syn flood, at
> ~30Mb/s of syn traffic, syn cookies aren't helping either, is there
> a syn-proxy implementation for linux?

Sorry, never looked at it, but a quick Google for /"syn proxy" linux/
gave me over 1,000 hits.

--

73,
Ged.
