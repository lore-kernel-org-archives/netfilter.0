From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Sat, 25 Feb 2006 00:17:53 +0100
Message-ID: <5f56302b0602241517w2140ffe7v2531d8543368d253@mail.gmail.com>
References: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<000301c6390b$3ff8eee0$0101000a@sterenborg.info>
	<5f56302b0602240214g1ea15a6ah4634a5a78d5bc5dc@mail.gmail.com>
	<54682.193.173.147.3.1140783730.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <54682.193.173.147.3.1140783730.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Chinh and Rob,

Let me first thank you both very much for your help and explanation,
now everything works, routing was the problem as well as me not
understanding the iptables rules properly so was always setting
something not correct.


> >>DEVICE=3Deth1
> >>BOOTPROTO=3Dnone
> >>BROADCAST=3D192.168.10.255
> >>IPADDR=3D192.168.10.101
> >>NETMASK=3D255.255.255.0
> >>NETWORK=3D192.168.10.0
> >>ONBOOT=3Dyes
> >>TYPE=3DEthernet
> >>GATEWAY=3D192.168.10.254
> >
> >
> > This NIC seems to be connected to your hub/switch/machine B.
> > I'd say, because machine A -> internet works, put this one on the
> > 192.168.11.0/24 network and machine B also. (You don't want to change
> things
> > that are already working.)
> >
> > Change :
> > BROADCAST=3D192.168.11.255
> > IPADDR=3D192.168.11.1
> > NETWORK=3D192.168.11.0
> > GATEWAY=3D192.168.11.1


I changed this, now the internal net is on 192.168.11.0.


> >>DEVICE=3Deth0
> >>BROADCAST=3D192.168.10.255
> >>IPADDR=3D192.168.10.105
> >>NETMASK=3D255.255.255.0
> >>NETWORK=3D192.168.10.0
> >>TYPE=3DEthernet
> >>ONBOOT=3Dyes
> >>GATEWAY=3D192.168.10.254
> >
> >
> > Because you can use the internet on machine A, I suppose the config for
> eth0
> > is correct.


Indeed, I didn't change that and it's still working :)


> Daniel, you should try Rob's advice and see if you can get further. Here =
are
> some my two cents. I've never done a PPPoE/DSL in Linux but I noticed a f=
ew
> odd things about your configuration.
>
> >
> >>USERCTL=3Dyes
> >>BOOTPROTO=3Ddialup
> >>NAME=3DDSLppp0
> >>DEVICE=3Dppp0
> >>TYPE=3DxDSL
> >>ONBOOT=3Dyes
> >>PIDFILE=3D/var/run/pppoe-adsl.pid
> >>FIREWALL=3DMASQUERADE
> >>PING=3D.
> >>PPPOE_TIMEOUT=3D80
> >>LCP_FAILURE=3D3
> >>LCP_INTERVAL=3D20
> >>CLAMPMSS=3D1412
> >>CONNECT_POLL=3D6
> >>CONNECT_TIMEOUT=3D60
> >>DEFROUTE=3Dyes
> >>SYNCHRONOUS=3Dno
> >>ETH=3Deth1
> >>PROVIDER=3DDSLppp0
> >>USER=3D02024784362
> >>PEERDNS=3Dyes
> >>DEMAND=3Dno
> >>PERSIST=3Dno
>
> The line ETH=3Deth1 suggests to me that your PPP connection is bound to e=
th1.
> However, in your previous messages you state that eth1 is on the private
> side
> (attached to machine B) and eth0 is on the public side. This seems odd.


Now you've got me. To tell the truth in my first post I accidently
interchanged eth0 and eth1 so in all further posts I systematically
kept interchanging them in order not to mix up the conversation, so
whenever I was talking about eth1 I meant eth0 and vica versa, in
principle it's not a problem if it's systematic (this was not the real
problem as I kept track of the interchange). But as you correctly
point out in this above file, ifcfg-ppp0, I forgot to change it and
left the original in :)


> Additionally, resources on the net regarding PPP connections (usually bou=
nd
> to eth0) has a similar ppp0 configuration as yours. But the associated
> interface (usually eth0) for a ppp0 connection is usually down and not co=
nfigured.
>
> DEVICE=3Deth0
> ONBOOT=3Dno


Thanks for this as well, I changed it to ONBOOT=3Dno.

At the moment my rules are:


echo 0 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables -t nat --flush
iptables --delete-chain
iptables -t nat --delete-chain
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
iptables -A FORWARD -o eth0 -i ppp0 -j ACCEPT
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

which I understand are not secure or in any way optimal, but at least
they work, so I'll start adding the suggestions of both of you to make
them what they really supposed to be.

Thanks again very much!

