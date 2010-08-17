From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 00:56:49 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008180049370.17078@obet.zrqbmnf.qr>
References: <4C6B10CA.4090604@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6B10CA.4090604@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-08-18 00:44, Jonathan Tripathy wrote:
>
> When using a single Linux host with lots of bridges, would there ever be a
> time, even for a few seconds, where traffic would "jump" bridges?
>
> I know a previous poster mentioned that when adding a host to a bridge, for a
> few seconds all packets get sent everywhere

That seems unlikely. The bridge keeps a table of (mac, bridgeport) 
tuples (cf. `brctl showmacs br0`), and a "broadcast" should only occur 
when there is no matching entry or when the destination L2 address is 
broadcast. (Ignoring multicast for now.)

> Reason I ask is that I am considering have one bridge for public traffic and
> one bridge for private, and don't want private traffic to be seen by hosts
> connected to the public bridge.

Bridges link Ethernet (sub)segments together to form a (large) Ethernet 
segment. In other words, if you keep the trees separate, they will be 
separate.
