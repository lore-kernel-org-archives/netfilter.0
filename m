From: "Daniel Nogradi" <nogradi@gmail.com>
Subject: Re: updated iptables doesn't work with old rules
Date: Fri, 24 Feb 2006 11:14:06 +0100
Message-ID: <5f56302b0602240214g1ea15a6ah4634a5a78d5bc5dc@mail.gmail.com>
References: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
	<000301c6390b$3ff8eee0$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000301c6390b$3ff8eee0$0101000a@sterenborg.info>
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

Hi Rob, thanks a lot for the enlightening remarks.

> You can only have one 192.168.10.0/24 subnet. If both your NIC's have an
> IP from that range, your routing rules will point to both NIC's as
> gateway. The first gateway that matches a routing rule is "accepted".
>
> So, machine A :
> eth0: 192.168.10.1 (192.168.10.0/24)
> eth1: 192.168.10.2 (192.168.10.0/24)
>
> Your kernel IP routing table will looke like :
> Destination     Gateway         Genmask         Iface
> 192.168.10.0    192.168.10.1    255.255.255.0   eth0
> 192.168.10.0    192.168.10.2    255.255.255.0   eth1
>
> Say, machine B is connected to eth1 on machine A. Machine A sends a
> packet. The first rule matches so it will send that packet via eth0, not
> eth1. So machine B will never see the packet.
>

> Yeah.
> If you don't use different subnets on each NIC, I still think you have a
> routing problem.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Hi Chinh, I tried interchanging eth0 and eth1 and still no luck.
>
> No. It won't work if you only allow forwarding from eth1 to eth0 (or
> vv). You *also* need the reverse rule (not *instead of*).
>
> If you do :
> $ipt -A FORWARD -i eth1 -o eth0 -j ACCEPT
>
> And do not accept RELATED,ESTABLISHED, you also need :
> $ipt -A FORWARD -i eth0 -o eth1 -j ACCEPT
>
> But that would be less secure. It's better to accept packets that are
> already accepted by another (specific) rule. So, you'd have a rule like
> :
> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED \
>   -j ACCEPT
> instead of the one above this.


Yes I understand the security issues, but first would like to see that
it works at all (accessing the outside world from 'machine B') and
then tighten security.


> =3D=3D=3D=3D=3D Later post =3D=3D=3D=3D=3D
> > And I'm also quite confused about eth0/ppp0, perhaps a related
> > issue is that the kernel ip table of 'machine A' is
> >
> > Destination    Gateway        Genmask         Iface
> > 213.191.89.30     *           255.255.255.255 ppp0
> > 192.168.10.0      *           255.255.255.0   eth1
> > 192.168.10.0      *           255.255.255.0   eth0
> > 169.254.0.0       *           255.255.0.0     eth0
> > default        213.191.89.30  0.0.0.0         ppp0
>
> Ah.. I never saw anything about you using a ppp0 device before... From
> your diagram I thought the modem(/router ?) was doing NAT also...
> In that case, yes : you need MASQUERADE.


Well, that's only because of my not understanding how things work :)


> I think that your routing table shows the routing problem I'm talking
> about.
> If a packet gets sent to 192.168.10.100, you don't know via which NIC
> it's going out, eth0 or eth1, because there are 2 rules for the same
> subnet via different interfaces.
> (I'm not sure if the routing table is showing the routes in processing
> order.)


Okay, so it's a routing problem. I guess in order to change that and
make it right is through the ifcfg-eth0, ifcfg-eth1, ifcfg-ppp0 files,
isn't it? At the moment they are (on 'machine A'):

DEVICE=3Deth1
BOOTPROTO=3Dnone
BROADCAST=3D192.168.10.255
IPADDR=3D192.168.10.101
NETMASK=3D255.255.255.0
NETWORK=3D192.168.10.0
ONBOOT=3Dyes
TYPE=3DEthernet
GATEWAY=3D192.168.10.254

DEVICE=3Deth0
BROADCAST=3D192.168.10.255
IPADDR=3D192.168.10.105
NETMASK=3D255.255.255.0
NETWORK=3D192.168.10.0
TYPE=3DEthernet
ONBOOT=3Dyes
GATEWAY=3D192.168.10.254

USERCTL=3Dyes
BOOTPROTO=3Ddialup
NAME=3DDSLppp0
DEVICE=3Dppp0
TYPE=3DxDSL
ONBOOT=3Dyes
PIDFILE=3D/var/run/pppoe-adsl.pid
FIREWALL=3DMASQUERADE
PING=3D.
PPPOE_TIMEOUT=3D80
LCP_FAILURE=3D3
LCP_INTERVAL=3D20
CLAMPMSS=3D1412
CONNECT_POLL=3D6
CONNECT_TIMEOUT=3D60
DEFROUTE=3Dyes
SYNCHRONOUS=3Dno
ETH=3Deth1
PROVIDER=3DDSLppp0
USER=3D02024784362
PEERDNS=3Dyes
DEMAND=3Dno
PERSIST=3Dno

So I need to modify the NETWORK and GATEWAY parameters for eth0 and/or eth1=
?

