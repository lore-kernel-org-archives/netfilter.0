From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT not working on one of 3 firewalls
Date: Mon, 24 Jun 2002 21:42:35 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624204237.JDLG2755.mta05-svc.ntlworld.com@there>
References: <20020624113121.B868@inxservices.com> <20020624192531.RSTF295.mta03-svc.ntlworld.com@there> <20020624124208.C868@inxservices.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020624124208.C868@inxservices.com>
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

On Monday 24 June 2002 8:42 pm, George Garvey wrote:

> On Mon, Jun 24, 2002 at 08:25:28PM +0100, Antony Stone wrote:
> >
> > Um, what are the other three for, then ?   If you can only use 2 IPs, why
> > has the ISP given you any more ?
>
>    Good question. I don't know. I have a lot of trouble getting
> information from them. I assume they're doing some kind of address
> translation on them. They said I can use all 5. They said that 2 of the
> 5 would be visible to the net. I had to buy a block of 5 IPs to get the
> DSL for some reason I don't understand. I only wanted 1 IP.

Okay.   Let's assume that's not important right now...

> > > If I ping an internet IP from the LAN, I'm pretty sure it goes out to
> > > the internet with the source IP still the LAN IP, without translation.
> >
> > I'm not so sure about that (why do you think that's what's happening ?).
>
>    I'm probably wrong. I noticed that, too. I ran iptables with a lot
> more logging, and never say the source being changed. But I may have
> missed it. The machine is an old 586 and drops fast logs a lot.

How were you doing the logging ?   Was it in the POSTROUTING chain, after the 
rule which would change the address ?   If the LOG line was any earlier than 
that, then you would still see the original source address...

> This is what ip says:
>
> 66.123.115.208/29 dev eth1  proto kernel  scope link  src 66.123.115.210
> 192.168.3.0/24 dev withvan  proto kernel  scope link  src 192.168.3.2
> 192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.2
> 192.168.1.0/24 via 192.168.3.2 dev withvan
> default via 66.123.115.209 dev eth1
>
> I have trouble reading that (you probably don't ;), so here's the ip
> commands if that's better:
>
> + /sbin/ip link set dev eth0 up mtu 1500
> + /sbin/ip address add 192.168.2.2/24 broadcast 192.168.2.255 dev eth0
> + /sbin/ip link set dev eth1 up
> + /sbin/ip address add 66.123.115.210/29 broadcast 66.123.115.215 dev eth1
> + /sbin/ip link set dev lo up
> + /sbin/ip address add 127.0.0.1/8 broadcast + dev lo
> + /sbin/ip route add default via 66.123.115.209 dev eth1
> + /sbin/ip tunnel add withvan mode gre remote 63.193.79.19 local
> 66.123.115.210 ttl 255 + /sbin/ip link set withvan up
> + /sbin/ip address add 192.168.3.2/24 broadcast + dev withvan
> + /sbin/ip route add 192.168.1.0/24 via 192.168.3.2 dev withvan

I see (from the bit I've chopped out of your ip output) that you still have 
the IPsec stuff in there - I'll assume for the time being that that's not 
interfering with things in any way ?

However, I do not recognise what the "withvan" device is doing.   I assume 
it's the GRE stuff that you're trying to debug here, so if I asked you to get 
rid of it, that wouldn't help solve the problem ?   Maybe someone else on the 
list has more experience of GRE stuff than me, so can offer some advice here ?

Any chance you can put another machine running ethereal or similar on the 
eth1 interface and see what's really coming out of the box ?

 

Antony.

