From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 17:11:20 +0200
Message-ID: <200807211711.20463.vladislav.kurz@webstep.net>
References: <48847F16.8040604@itool.com> <200807211649.20343.vladislav.kurz@webstep.net> <4884A414.10408@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4884A414.10408@itool.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Dimitri GOURDON <dgourdon@itool.com>

On Monday 21 of July 2008, Dimitri GOURDON wrote:
> Vladislav Kurz a =E9crit :
> > On Monday 21 of July 2008, you wrote:
> >> Vladislav Kurz a =E9crit :
> >>> On Monday 21 of July 2008, Dimitri GOURDON wrote:
> >>>> Hi all,
> >>>>
> >>>> I've setup LVS on a box using Keepalived (and Iptables) to load
> >>>> balance traffic between 2 web servers. I have a problem :
> >>>>
> >>>> A lot of TCP packets with FIN or RST flags (all I think) from cl=
ients
> >>>> are dropped by Iptables as state INVALID. The consequence is tha=
t I
> >>>> have a lot of connection in FIN_WAIT state (shown by netstat) on=
 the 2
> >>>> web servers...
> >>>
> >>> I have similar problem, and asked about it here. I was told to tr=
y
> >>> newer kernel (I run debian stable - 2.6.18). However I didn't upg=
rade
> >>> yet, but If you run the same kernel as I do and upgrade would hel=
p you
> >>> I'd like to here about that.
> >>
> >> I run 2.6.18-4-bigmem kernel. I've passed just a little to test a =
more
> >> recent but I stop because I've encountered problem with some iptab=
les
> >> rules...
> >
> > Temporary workaround is only to LOG invalid packets instead of DROP=
=2E The
> > system then becomes quite usable. Anyway try newer kernel if you ca=
n.
> > Or describe more in detail what problems with what rules did you ha=
ve.
>
> Here are my rules :
>
> $IPTABLES is iptables bin file
> $EXT is external interface
> $IP_V1 is the virtual IP clients reach
>
>
> $IPTABLES -N LOG_INVALID
> $IPTABLES -A LOG_INVALID -j LOG --log-prefix '[iptables_invalid] : '
> $IPTABLES -A LOG_INVALID -j DROP
>
> $IPTABLES -A INPUT -i $EXT -p TCP --dport 443 -d $IP_V1 -m state --st=
ate
> NEW,ESTABLISHED,RELATED -j ACCEPT $IPTABLES -A INPUT -i $EXT -p TCP
> --dport 443 -d $IP_V1 -m state --state INVALID -j LOG_INVALID
>
> I don't want to accept invalid packet because they are suppose to be
> invalid... All (I think) FIN and RST flagged packets from clients are
> dropped.

I was told that 2.6.18 has some bug in conntrack which causes valid pac=
kets to=20
be marked as invalid. So you probably want to accept some of those inva=
lid=20
packets. Anyway try this setting it may lower the number of invalid pac=
kets:

echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

However in my case even after this I see a lot of invalid packets.


--=20
Regards
        Vladislav Kurz
