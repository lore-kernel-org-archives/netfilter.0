From: "HareRam" <hareram@sol.net.in>
Subject: Re: Fw: How to remove Established Connection
Date: Fri, 11 Oct 2002 19:33:26 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b501c2712e$f88e39e0$7cfcc5cb@humanpc>
References: <00e301c270e7$09c5a7e0$7cfcc5cb@humanpc> <002d01c270fe$86ca3c80$7cfcc5cb@humanpc> <3DA696C3.5000508@iprimus.com.au> <200210111230.g9BCUlL19231@vulcan.rissington.net>
Reply-To: "HareRam" <hareram@sol.net.in>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Hi all
thanks its working using my own methods,
but idea is lot of people, especially Mr Antony's

what is the Recomended DROP or REJECT
just now my Rule is work with DROP

but i saw now here REJECT
which one is powerfull to use to disable connections of Forward

thanks
hare
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Friday, October 11, 2002 6:00 PM
Subject: Re: Fw: How to remove Established Connection


> On Friday 11 October 2002 10:15 am, Michael wrote:
>
> > HareRam wrote:
> > >then ? how do i remove my establish client, when we do some accounting
> > >when he logged out, he should not get any browsing, as well as he
should
> > > be removed from internet
> > >how can i achieve
> > >
> > >please guide me alternative method to achieve this
> >
> > You remove the rule that accepts the established connection.
> >
> > I have a specific rule for each host that is forwarded through firewall.
> > If I want to allow the host, I add the rule in FORWARD chain:
> >
> > ACCEPT     all  --  *      eth0    <ip_of_host>
> > 0.0.0.0/0          state RELATED,ESTABLISHED
> >
> > When I want to stop them I just remove the rule. Even if the established
> > entry appears and lingers in /proc/net/ip_conntrack, it can't go
anywhere.
> > At least that's how it seems to work for me... Am I wrong??
>
> Depending on how many established connections you want to cut off,
compared
> to how many new connections you want to allow, it could be easier to do
this
> the other way around:
>
> have a standard rule:
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> in your FORWARD chain, and then insert a rule *before* this one to
> specifically block the IP you want to disconnect:
> iptables -I FORWARD -s a.b.c.d -j REJECT
>
> This will then make sure that packets from that address do not get as far
as
> the ESTABLISHED, RELATED rule, and therefore are no longer allowed through
> the machine.
>
> Antony.
>
> --
>
> KDE 3.0.3 contains an important fix for handling SSL certificates.  Users
of
> Internet Explorer, which suffers from the same problem but which
> does not yet have a fix available, are also encouraged to switch to KDE
3.0.3.
>
> http://www.kde.org/announcements/announce-3.0.3.html
>
>


