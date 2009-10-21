From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: Ramdom NAT drop
Date: Wed, 21 Oct 2009 14:52:20 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD509C4@HSSBS.holdstead.local>
References: <034DEBCAE934A74991E6E76B8DA72D14182B54DFB0@HSSBS.holdstead.local>
 <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local>
 <4ADEBE76.20700@chello.at>
 <034DEBCAE934A74991E6E76B8DA72D14185DD509A2@HSSBS.holdstead.local>
 <034DEBCAE934A74991E6E76B8DA72D14185DD509C1@HSSBS.holdstead.local>
 <4ADF7ACB.8080203@chello.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADF7ACB.8080203@chello.at>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> > > I have setup a Linux firewall on the edge of the network and doing
> SNAT for
> > > internal IPs. When I sniff on external interface for internal
> source IPs,I
> > > am seeing FIN packets from internal IPs going out without being
> NAT-ed.
> >
> > These packets are probably classified in the INVALID state by the
> > connection tracking. Such packets are ignored by the NAT. A reason
> may
> > be that they belong to old connections the connection tracking has
> > forgotten about or considers already closed.
> >
> > Does your rulest DROP outgoing packets in the INVALID state ?
> 
> Maybe it's the same thing just with DNAT at your end.

We don't drop any outgoing packets.  I'll have to look for that thread and see how that might impact it.  

My understanding is that any packets that aren't matched in conntrack are sent through the NAT chain and if there are no match then it must be local, therefore input chain, otherwise forward chain.  Therefore they should always go through forward if they are either in conntrack with a NAT destination or just processed by NAT and matched with a destination.

LOGIC:
1) Conntrack with nat, yes, forward, otherwise input
2) No conntrack, check nat, if nat, add conntrack, then forward, otherwise input

Either case should result in a forward.

Can any of the dev's confirm this logic:

