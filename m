From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: Bridges
Date: Tue, 17 Aug 2010 16:34:05 -0700
Message-ID: <20100817163405.0713cee9@nehalam>
References: <4C6B10CA.4090604@abpni.co.uk>
	<alpine.LSU.2.01.1008180049370.17078@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008180049370.17078@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

On Wed, 18 Aug 2010 00:56:49 +0200 (CEST)
Jan Engelhardt <jengelh@medozas.de> wrote:

> On Wednesday 2010-08-18 00:44, Jonathan Tripathy wrote:
> >
> > When using a single Linux host with lots of bridges, would there ever be a
> > time, even for a few seconds, where traffic would "jump" bridges?
> >
> > I know a previous poster mentioned that when adding a host to a bridge, for a
> > few seconds all packets get sent everywhere
> 
> That seems unlikely. The bridge keeps a table of (mac, bridgeport) 
> tuples (cf. `brctl showmacs br0`), and a "broadcast" should only occur 
> when there is no matching entry or when the destination L2 address is 
> broadcast. (Ignoring multicast for now.)
> 
> > Reason I ask is that I am considering have one bridge for public traffic and
> > one bridge for private, and don't want private traffic to be seen by hosts
> > connected to the public bridge.
> 
> Bridges link Ethernet (sub)segments together to form a (large) Ethernet 
> segment. In other words, if you keep the trees separate, they will be 
> separate.

The forwarding database has aging so if a host does not send or receive
traffic for that interval (default is 5 minutes), then the entry is forgotten.
This is part of the 802.1d standard and is used to allow host to be moved
from one segment to another.
