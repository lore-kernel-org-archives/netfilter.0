From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Deleting Connection Tracking information
Date: Mon, 8 Jul 2002 20:44:29 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709004429.GA25300@cannon.eng.us.uu.net>
References: <AE696B0F5B44A348B8D18E40F976D9571BA92E@mailsrv.etagon.com> <200207081143.g68Bh6806571@vulcan.rissington.net> <20020708233153.GB30970@aaricia.hemmet.chalmers.se> <20020708235054.PKTV16050.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020708235054.PKTV16050.mta01-svc.ntlworld.com@there>
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter <netfilter@lists.samba.org>

On Tue, Jul 09, 2002 at 12:50:51AM +0100, Antony Stone wrote:

> > That is not true. I suggest reading some old mails in the archive and
> > documents. Conntrack's state of NEW is NOT the same things as a TCP with
> > SYN-flag. The FIRST packet is sees in a flow is marked state NEW.
> 
> Okay, let's think about this a little further...
> 
> Suppose I have two netfilter boxes sitting side by side with identical rules 
> on them, including NAT, identical addresses on the interfaces (suppose for 
> the time being I've arranged to have identical MACs on the ethernet cards as 
> well) and identical routing tables.
> 
> One box is plugged into my network, client on one side, server on the other - 
> the other netfilter box is switched on but disconnected from the network.

It doesn't have to. You can connect both and run vrrpd.

> 
> After a bit of traffic has flowed, the netfilter box has some conntracking 
> table entries, and the client and server have an established connection (or 
> maybe several).
> 
> Suddenly I decide to pull out the network cables from netfilter box 1 and 
> connect them to netfilter box 2 instead.
> 
> Are you saying that the first packet to flow between the client and server 
> through this second netfilter machine, which has no connection tracking table 
> on it yet, will cause a NEW entry to be placed in the connection tracking 
> table, and that the reply packet will cause that entry to become ESTABLISHED, 
> and that the NAT rules will work ?

Yes.

> 
> Even though both of these packets are just mid-connection ACK packets with no 
> SYN flags in them ?

Yes.

> 
> If this is true, what stops us having high-availability automatic-failover 
> netfilter machines ?

1) Just think about the case where the NEW packet arrives in the wrong
   direction.
2) What happens to the helper information gathered by the first one?
3) What happens to the information you had from many other modules like
   ipt_recent...
4) ...

Ramin

> 
>  
> 
> Antony.

