From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Could Cogent be doing packet mangling that would confuse
 Netfilter about interfaces?
Date: Mon, 15 Aug 2011 16:33:35 -0400
Message-ID: <20110815203335.GB27440@black.transpect.com>
References: <20110723003617.GA17279@black.transpect.com>
 <20110725000139.GA10041@black.transpect.com>
 <20110815171353.GA15638@black.transpect.com>
 <097A5326-A354-436E-9932-91D3A912494A@shorewall.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <097A5326-A354-436E-9932-91D3A912494A@shorewall.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@vger.kernel.org

On Mon, Aug 15, 2011 at 10:52:35AM -0700, Tom Eastep wrote:

> On Aug 15, 2011, at 10:13 AM, Whit Blauvelt wrote:

> > We're now seeing the same behavior from both iptables 1.4.8 on Debian
> > Squeeze and 1.3.8 on Ubuntu 8.04 (on totally different hardware). The common
> > factor is that this is all traffic coming in via our Cogent pipe. When
> > traffic comes in via either of our two other Speakeasy/Megapath pipes
> > Netfilter sees all the interface specifications correctly.
> 
> This behavior is usually a sign that your Cogent external firewall
> interface and and your internal firewall interface have accidentally
> become part of the same broadcast domain. I would look for mis-cabling and
> for erroneous VLAN configuration.

Tom,

Thanks. We'll double check our cabling. No VLANs are in use here. Would the
broadcast domain diagnosis fit our most recent problem? Here it is:

- We have an external IP on each outside pipe DNAT'd to an internal web
  server, on a DMZ address. This has been working perfectly for several
  years.

- Suddenly last week connections to the Cogent IP (on eth5) stopped working.
  The logs showed those packets coming in from the DMZ interface (eth2)
  destined for the DNAT-assigned internal IP (also on eth2) - getting
  blocked by Netfilter since that made no sense.

- Adding an iptables rule to allow forwarding from that interface (eth2) to
  that IP (on eth2) restored service

- The other two external pipes work as always.

Trying to picture how a cable in the wrong place would allow this. The
Cogent router is just a router, not doing firewalling, so it's the Linux
firewall with Cogent and Speakeasy routers attached on two interfaces (with
a switch in between in each case, since there's an active backup firewall),
and the LAN and DMZ attached on two more.

What kind of miscabling could cause a packet which makes it through the
Linux firewall's DNAT to then be seen by the same firewall as coming from
the DMZ's interface, complete with DNAT-translated destination IP, asking to
be forwarded to an IP on the DMZ?

You're probably right - I hope you are since a solution would be good. Just
trying to narrow down what we're looking for by way of miscabling.

Best,
Whit
