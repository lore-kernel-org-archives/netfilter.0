From: "David Busby" <busby@pnts.com>
Subject: Re: DHCP related problem
Date: Tue, 17 Jun 2003 09:58:01 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <066501c334f1$a4cee110$1100000a@busbydev>
References: <200306171130.h5HBUUWF027705@nycsmtp3out.rdc-nyc.rr.com> <000901c334d6$62853a90$c80da8c0@pisic>
Reply-To: "David Busby" <busby@pnts.com>
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
To: "PiSiC..." <pisic@service.agress.ro>, mattgrogan@bigfoot.com, netfilter@lists.netfilter.org

The ISC DHCP server has some hooks (see man) that can notify you of a lease.
Those events could drive a script that modifies you firewall rules.

/B


----- Original Message ----- 
From: "PiSiC..." <pisic@service.agress.ro>
To: <mattgrogan@bigfoot.com>; <netfilter@lists.netfilter.org>
Sent: Tuesday, June 17, 2003 06:43
Subject: Re: DHCP related problem


> I see that i wasn't very explicit...
> so... what i have: i have 12 stations in my LAN. I have set up DHCP with
> FixedAdress for those.
> I work in a computers service and i have a variable number of machines
that
> come and go .
> I set up a pool for those fixed address computers and another one for
> unknown clients which is more restrictive.
> To get to my problem ... I want to drop anyone who sets his IP address and
> GW etc. staticaly.
> I want to let them access only if they request their address by DHCP.
> Any hints ?
>
> Thanks in advance ,
>
>                 Danila Octavian
>
>
> ----- Original Message -----
> From: "Matt Grogan" <mattgrogan@nyc.rr.com>
> To: "'PiSiC...'" <pisic@service.agress.ro>;
<netfilter@lists.netfilter.org>
> Sent: Tuesday, June 17, 2003 2:24 PM
> Subject: RE: DHCP related problem
>
>
> > You could set up DHCP with a smaller set of addresses, for example
> > x.x.x.100- x.x.x.110 if you only have 10 workstations. Then drop
> everything
> > accessing the Internet except for those source addresses.
> >
> > If you want to go further than that, like stop someone from getting
their
> > information from DHCP and then statically defining it and keeping that
> > address, it gets a little more involved. Maybe reducing the lease time
and
> > scripting to check that all the stations in the DHCP range are also in
the
> > list of DHCP clients on the server would help.
> >
> > Matt Grogan
> >
> > ________________________________________
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of PiSiC...
> > Sent: Tuesday, June 17, 2003 4:31 AM
> > To: netfilter@lists.netfilter.org
> >
> > Hi all,
> >
> > I want to ask you something... You know a possibility to drop outgoing
> > traffic of clients who define their address staticaly instead of using
my
> > DHCP server ?
> > I also want to allow outgoing access to those who have their IP address
> > given by my DHCP server.
> >
> > Thank you in advance,
> > Danila Octavian
> >
> >
>
>


