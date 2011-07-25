From: Whit Blauvelt <whit@transpect.com>
Subject: Re: How might incoming SMB probes from public IPs be ariving on the
 internal interfaces?
Date: Sun, 24 Jul 2011 20:01:39 -0400
Message-ID: <20110725000139.GA10041@black.transpect.com>
References: <20110723003617.GA17279@black.transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110723003617.GA17279@black.transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Just to clarify and simplify the question my experience raises:

There's a system functioning as a firewall with two public lines coming in,
each with multiple IPs, and two LANs inside it. In this case the public
lines are on eth4 and eth5, the two LANs are on eth1 and eth2.

Rules for INPUT specify each of the ports which are to be open on eth4 and
eth5, with a separate rule for each IP/port combination, and with a rule
following them to reject all else on those interfaces. SMB ports are not
among the the accepted traffic for those interfaces at all, not for a single
public IP.

But there's no blocking of SMB traffic on eth1 and eth2. There's an SMB
service on the firewall by which workstations on the two LANs are able to
place files for public-facing (non-SMB) servers there. 

All SMB probes seen as coming in on eth4 and eth5 get blocked, just as
should be expected. But some SMB probes, of our public IPs, by outside
public IPs, are seen by iptables as coming in on eth1 and eth2, so not
blocked at that level. They can't connect successfully to our SMB server
anyway because of its own settings. But that's not the point.

The point is that some of the scans of our public IPs manage to appear to
the firewall as coming from the internal interfaces - and I provided an
example in the prior post where it is clearly a single, repeated scan that
hits the internal interfaces with several, but not all, of its instances.

Now, it's easy enough to block once it's recognized. It just takes adding
rules to block the SMB ports on _all_ interfaces to anything with an
external address, no matter which interface it appears to come in from. But
this also suggests that the apparent interface of a packet, perhaps, just
isn't to be trusted - that to be secure all rules must be 100% in terms of
IP ranges, with interface specifications only to be considered a secondary,
leaky line of defense.

Admittedly this is an older netfilter, on an older kernel, since firewalls
are the sort of thing where upgrade policies favor a conservative approach.
Is there some known bug where packets can "slip sideways" between
interfaces? What the heck can be going on here?

Thanks,
Whit
