From: "Leonardo Rodrigues" <leolistas@solucoesip.net>
Subject: Re: Anyone using DNAT on the OUTPUT chain?
Date: Mon, 10 Jun 2002 11:23:59 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <010801c2108a$76f368b0$3201a8c0@leonardo>
References: <BC6421B0F2CC4C43897842092E0E00A94C14A1@TX1EX1NT.dyncorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter@lists.samba.org


    DNAT on OUTPUT works just fine ONLY if you applies the local-nat.patch
from patch-o-matic.

[root@firewall root]# iptables -t nat -nL -v
[ ..... ]

Chain OUTPUT (policy ACCEPT 15826 packets, 777K bytes)
 pkts bytes target     prot opt in     out     source
destination
   88  3872 DNAT       tcp  --  *      lo      0.0.0.0/0
my.external.address      tcp dpt:80 to:192.168.9.14:80
    0     0 DNAT       tcp  --  *      lo      0.0.0.0/0
my.external.address      tcp dpt:20 to:192.168.9.14:20
    0     0 DNAT       tcp  --  *      lo      0.0.0.0/0
my.external.address      tcp dpt:21 to:192.168.9.14:21

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Kellogg, Chris" <Chris.Kellogg@dyncorp.com>
To: <netfilter@lists.samba.org>
Sent: Monday, June 10, 2002 11:11 AM
Subject: RE: Anyone using DNAT on the OUTPUT chain?


> Hi, Antony
>
> > On Monday 10 June 2002 1:45 pm, Kellogg, Chris wrote:
> >
> > > iptables -A OUTPUT -s 192.168.0.0/24 -p tcp --dport 80 -t
> > nat -j DNAT
> > > --to-destination 192.168.4.4:80
> > >
> > > When I attempt to put this rule in, I get the error message
> > "iptables:
> > > Invalid argument".
> >
> > I should think it's the -s argument which netfilter is
> > complaining about - it
> > makes (almost) no sense to include this in a rule which only
> > applies to
> > packets coming from the local machine.
>
> ACK!  Talk about a serious brain cramp - I completely forgot that the
OUTPUT
> chain is for outbound connections sourced from the NetFilter box.
>
> > I assume you really are trying to DNAT packets originating
> > from the netfilter
> > box, and not ones which are being routed by it (which you
> > would do in the
> > POSTROUTING chain) ?
>
> I want to redirect packets being routed by the NetFilter box.  I guess
that
> means I need to use the PREROUTING change to handle these packets...since
I
> need the DNAT option, and that only on the PREROUTING and OUTPUT chains -
> and OUTPUT won't work. :)
>
> > Antony.
>
> Thanks for helping me pull my head out of my posterior.
>
> Any ideas on alternative methods to do what I'm trying to do?
>
> Cheers,
>
> Chris.
>


