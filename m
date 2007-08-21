From: "michel banguerski" <banguerski+nfdev@gmail.com>
Subject: Re: Rout looping through local host.
Date: Tue, 21 Aug 2007 22:47:23 +0200
Message-ID: <cba9bb580708211347u459897bcofce3a48a59e50a93@mail.gmail.com>
References: <46CB0F78.3060107@riverviewtech.net>
	<cba9bb580708211026p721c0de8md6d66b3440d5b298@mail.gmail.com>
	<46CB3835.80401@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=emyPBTdUHcXO7hj8foK2aK31xPuRenaEafTHWQGe+VPjclDY+u8FLNUTfuZ8IDVshLx/zhlIzRF0CZK5Sn8+EaSY1fOGAnbmIAsECDQ4bflHohUqWHslTwRv/IbQW66m241RHW4zLnLdQw50asapOiS0rRKZpSKaH4+JHGzuhFE=
In-Reply-To: <46CB3835.80401@riverviewtech.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: gtaylor+reply@riverviewtech.net
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant, You are 100% right about return path, it needs to be set up and
I hope the VRF will prove to be more adequate for your needs.

For sake of completeness I'll still provide the missing commands.
It is much easier if you SNAT packets coming to eth0 using a dedicated
IP address from the subnet attached to eth2:
iptables -t nat -A POSTROUTING -i eth0 -j SNAT --to-source 10.0.2.254
iptables -t nat -A POSTROUTING -o eth3 -j MASQUERADE

then all you need is :
arp -s 10.0.2.254  <ETH addr of eth1>

no additional routes or PBR rules are needed because on return path
the packet will be DNATed to appropriate address before routing
decision.

As for NOARP and tunneling interfaces AFAIK it makes things even
easier because static arp is not even needed: the packet will be
exchanged between eth1 and eth2 just because of routing.

I've made the following to test the behaviour of NOARP interfaces:

#vtund -snf /usr/share/doc/vtun/examples/vtund-server.conf
#vtund -nf /usr/share/doc/vtun/examples/vtund-client.conf cobra 127.0.0.1

that brought up tun0 and tun1:
tun0      Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.3.0.1  P-t-P:10.3.0.2  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP  MTU:1450  Metric:1
          RX packets:192 errors:0 dropped:0 overruns:0 frame:0
          TX packets:235 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500
          RX bytes:21504 (21.0 KiB)  TX bytes:19740 (19.2 KiB)

tun1      Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.3.0.2  P-t-P:10.3.0.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP  MTU:1450  Metric:1
          RX packets:235 errors:0 dropped:0 overruns:0 frame:0
          TX packets:192 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500
          RX bytes:19740 (19.2 KiB)  TX bytes:21504 (21.0 KiB)


#ip ro add 192.168.0.0/24 dev tun0
#ip ro add 192.168.1.0/24 dev tun1

#iptables -t nat -A POSTROUTING -d 192.168.0.1 -s 10.3.0.1 -j SNAT
--to-source 192.168.1.1

# ping 192.168.0.1
PING 192.168.0.1 (192.168.0.1) 56(84) bytes of data.
From 192.168.0.1 icmp_seq=3D1 Time to live exceeded
...
Bingo! the icmp packet loops trough tun0 and tun1 till the TTL goes 0,
no 'arp -s' needed.

The fun starts if we want to avoid NAT, in that case more magic is needed.

2007/8/21, Grant Taylor <gtaylor@riverviewtech.net>:
> On 08/21/07 12:26, michel banguerski wrote:
> > here's  my 2=A2:
> > there is no need to patch the kernel.
> > what you should do is PBR and little arp hacking:
> > let's say your eth0 is 10.0.0.1/24
> > what i'd do is to put eth1 and eth2 in different subnets:
> > eth1 -> 10.0.1.1/24
> > eth2 -> 10.0.2.1/24
eth0 -> 10.0.0.1/32 # so we don't have that nasty connected route in
'local' table

>
> (For the sake of discussion) Ok...
>
> > default routes:
> > ip ro add default via 10.0.1.254 table 252 # from eth1 to eth2
ip ro add 10.0.0.0/24 via 10.0.2.254 table 252 # from eth3 to eth2
If you use tun devices, no need to give a gateway, just "dev tunX".

> > ip ro add default via <gateway on eth3 side> table default # from eth3
> > to outside
ip ro add 10.0.0.0/24 dev eth0 table default # from eth1 to eth0

>
> I can see how this might get packets from eth1 in to eth2, but I fail to
> see how returning packets will get from eth2 back to eth1 with out doing
> the same in reverse.  Doing the same in reverse will either require more
> routing tables or make routing table 252 more complex if possible.
>
> > PBR rules:
> > ip rule del prio 32766 # we need to put rules between lookup to main an=
d default
> > ip rule add prio 100 lookup main # rule 32766 becomes 100
> > ip rule add 200 lookup 252 iif eth0 # alternative default route for loc=
al LAN
> > ip rule add 201 lookup 252 iif eth3 # alternative default route for loc=
al LAN
No changes in PBR rules
>
> Again, returning traffic is going to be problematic.
>
> > arp override:
> > arp -s 10.0.1.254 <ETH addr of eth2>

arp -s 10.0.2.254 <ETH addr of eth1>

>
> Presuming that the reverse path can be worked out, this might work if I
> was really using cross over cables, but for scalability reasons I'm not
> doing so, but rather a program more like a tunnel than a physical
> interface.  Said program generates a NOARP interface, so I don't think
> this approach will work.

I belive on NOARP interfaces 'arp -s' is not needed at all.

>
> > disable antispoof on eth{1,2} (may be not needed if you do NAT)
> >  echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
> >  echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter
>
> Agreed.  I don't know for sure if reverse path protection is or is not
> needed yet, so for safety sake we'll turn it off and do our own reverse
> path filtering in IPTables or see if the kernel can do it for us later on=
.
>
> > there is one thing to look after: the dhcp client will put its default
> > route in table main(252) and you should move it from here to table
> > default(253)
>
> Agreed.  However this is what the options for dhcpcd (or the likes) are
> for to tell it not to over write any files or change any thing else for
> that matter.  In fact, I think I'll just have the client request the
> information and log it to files in the /etc/dhcp<what ever> directory
> and I'll alter interfaces and routing table(s) my self.
>
> > This setup should work with or without NAT
>
> Possibly.
>
> > Hope this works(did not test this exact setup) and helps
>
> In theory (what I understand of what you are suggesting) has merit, but
> lacks return path.  Even if the return path can be fixed, there is still
> the issue of the NOARP interfaces.
>
> Also, my project requires me to have multiple of these additional
> routers, so this will not scale very well and thus is not really an
> ideal solution.  (Look at a follow up post to my own question.)
>
>
>
> Thank you very much for your input and for providing a very unique
> solution, all be it fairly out side of the ball park one (sending
> traffic to an IP address that does not exist...).
It was an interesting exercise, I wished to be of help but at least it
was entertaining. Thank you :)

>
> Grant. . . .
>
Best regards
Michel

PS thank You for pointing to vrf, interesting indeed

