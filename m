From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Could Cogent be doing packet mangling that would confuse
 Netfilter about interfaces?
Date: Mon, 15 Aug 2011 16:47:46 -0400
Message-ID: <20110815204746.GA30290@black.transpect.com>
References: <20110723003617.GA17279@black.transpect.com>
 <20110725000139.GA10041@black.transpect.com>
 <20110815171353.GA15638@black.transpect.com>
 <097A5326-A354-436E-9932-91D3A912494A@shorewall.net>
 <20110815203335.GB27440@black.transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110815203335.GB27440@black.transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@vger.kernel.org

On Mon, Aug 15, 2011 at 04:33:35PM -0400, Whit Blauvelt wrote:

> Trying to picture how a cable in the wrong place would allow this. The
> Cogent router is just a router, not doing firewalling, so it's the Linux
> firewall with Cogent and Speakeasy routers attached on two interfaces (with
> a switch in between in each case, since there's an active backup firewall),
> and the LAN and DMZ attached on two more.

Just to make it weirder, on the second system we tested this on we have
Cogent on eth3, DMZ on eth1, LAN on eth0 and Speakeasy on eth2. In this case
the Cogent traffic shows up on the wrong interface too - but a different
wrong interface - the LAN interface rather than the DMZ interface. It shows
up as coming in on eth0 headed for the DNAT translated address on eth1 -
despite that the traffic arrived on eth3.

What is consistent (probably coincidence) is that Cogent traffic coming in
on eth5 in the first case appears as if coming in on eth2, and Cogent
traffic coming in on eth3 in the second case appears as if it's coming in on
eth0 - so "subtract 3 from real interface number" would do it. 

Again, the same traffic coming in over through a Speakeasy pipe doesn't get
confused about interfaces at all.

Whit
