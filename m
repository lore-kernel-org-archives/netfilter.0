From: "Diego R. Rodriguez Herlein" <diegorh@infovia.com.ar>
Subject: Re: dual gateways
Date: Thu, 6 Feb 2003 01:01:37 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c2cd94$72556c50$8201a8c0@lw1dqwin>
References: <F213bNDN4CxpAOAkK5L0000d3bd@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: per j <perj8@hotmail.com>, netfilter@lists.netfilter.org

let's have a look at www.lartc.org may can help you!!
regards,

diego

----- Original Message -----
From: "per j" <perj8@hotmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, February 05, 2003 2:25 PM
Subject: Re: dual gateways


> How about this?  Use at to ping something on the Internet periodically or
> ping the T3 router.  Modify the defaultroute by using route whenever ping
> returns false.  Use MASQUERADE instead of SNAT in Netfilter.
>
> >I'm sure this is possible, but I just haven't gotten it to work right by
> >playing around with the settings.
> >
> >I've got three NICs in the firewall box.  I've also got two routers that
go
> >to the Internet via two separate lines (a T1 and a partial T3).  I've got
> >my
> >default gateway set on the linux box to go out via the T3 and NAT setup
for
> >my clients to route out via that interface.  I'd like to know if it's
> >possible to setup a failover route to redirect clients out the T1 should
> >the
> >T3 not be available, even if the router is.  Here's the basic diagram:
> >
> >
> >                           (default route)
> >                           eth2 <---> |T3 Router| <---> Internet
> >LAN <---> eth1 |firewallBox|
> >                           eth1 <---> |T1 Router| <---> Internet
> >
> >
> >Khanh Tran
> >Network Operations
> >Sarah Lawrence College
>
>
> _________________________________________________________________
> The new MSN 8: advanced junk mail protection and 2 months FREE*
> http://join.msn.com/?page=features/junkmail
>
>


