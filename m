From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT of ICMP fragmentation-needed
Date: Mon, 10 Jun 2002 12:29:50 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101129.g5ABTwU08003@vulcan.rissington.net>
References: <Pine.LNX.4.44.0206101315540.30649-100000@albert.ha-vel.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206101315540.30649-100000@albert.ha-vel.cz>
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

On Monday 10 June 2002 12:17 pm, jakub@angel.cz wrote:

> when I use :
>
> iptables -I POSTROUTING  -t nat -p icmp --icmp-type \
> fragmentation-needed -j LOG --log-prefix "icmp SNAT POST "
>
> iptables -I PREROUTING -t mangle  -p icmp --icmp-type \
> fragmentation-needed -j LOG --log-prefix "icmp SNAT PRE "
>
> I can see them in PREROUTING but not in POSTROUTING...

Do you have a suitable FORWARDing rule to transfer these packets across the 
box ?

When you log them in the PREROUTING chain, they don't have the destination 
address of the netfilter box itself, do they ?   (ie they're stopping on the 
local box and not trying to route any further...)

Antony.

> On Mon, 10 Jun 2002, Antony Stone wrote:
> > On Monday 10 June 2002 11:36 am, jakub@angel.cz wrote:
> > > > > I would like to SNAT icmp fragmentation-needed messages that have
> > > > > source address from private network range (RFC1918), I have tried
> > > > > something like:
> > > > >
> > > > > iptables -t nat  -I POSTROUTING -j SNAT --to real_address -p icmp 
> > > > > \ --icmp-type fragmentation-needed -s 192.168.0.0/16
> > > > >
> > > > > but it does not work.
> > > >
> > > > What happens if you put a logging rule immediately before this one:
> > > >
> > > > iptables -I POSTROUTING -t nat -s 192.168.0.0/16 -p icmp --icmp-type
> > > > fragmentation-needed -j LOG --log-prefix "icmp SNAT"
> > > >
> > > > Do you get any packets logged ?
> > >
> > > Nothing gets logged......
> >
> > In that case you have no packets of the type you are trying to match.....
> >
> > ...which is why they don't get SNATted.
> >
> >
> >
> > Antony.

