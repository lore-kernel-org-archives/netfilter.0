From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Deleting Connection Tracking information
Date: Tue, 9 Jul 2002 00:50:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708235054.PKTV16050.mta01-svc.ntlworld.com@there>
References: <AE696B0F5B44A348B8D18E40F976D9571BA92E@mailsrv.etagon.com> <200207081143.g68Bh6806571@vulcan.rissington.net> <20020708233153.GB30970@aaricia.hemmet.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708233153.GB30970@aaricia.hemmet.chalmers.se>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

On Tuesday 09 July 2002 12:31 am, Joakim Axelsson wrote:

> 2002-07-08 12:43:01+0100, Antony Stone <Antony@Soft-Solutions.co.uk> ->
>
> > If you are talking about TCP, then I do not believe this assumption is
> > valid, because only the very first packet of a connection contains the
> > SYN flag, and only the second packet contains the SYN/ACK, which are the
> > first two steps of the TCP three-way handshake.   Without those the
> > connection tracking system won't set up an ESTABLISHED connection, and
> > the automatic NAT rules won't apply.
>
> That is not true. I suggest reading some old mails in the archive and
> documents. Conntrack's state of NEW is NOT the same things as a TCP with
> SYN-flag. The FIRST packet is sees in a flow is marked state NEW.

Okay, let's think about this a little further...

Suppose I have two netfilter boxes sitting side by side with identical rules 
on them, including NAT, identical addresses on the interfaces (suppose for 
the time being I've arranged to have identical MACs on the ethernet cards as 
well) and identical routing tables.

One box is plugged into my network, client on one side, server on the other - 
the other netfilter box is switched on but disconnected from the network.

After a bit of traffic has flowed, the netfilter box has some conntracking 
table entries, and the client and server have an established connection (or 
maybe several).

Suddenly I decide to pull out the network cables from netfilter box 1 and 
connect them to netfilter box 2 instead.

Are you saying that the first packet to flow between the client and server 
through this second netfilter machine, which has no connection tracking table 
on it yet, will cause a NEW entry to be placed in the connection tracking 
table, and that the reply packet will cause that entry to become ESTABLISHED, 
and that the NAT rules will work ?

Even though both of these packets are just mid-connection ACK packets with no 
SYN flags in them ?

If this is true, what stops us having high-availability automatic-failover 
netfilter machines ?

 

Antony.

