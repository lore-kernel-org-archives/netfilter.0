From: <bigman@monster-solutions.net>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Mon, 28 Oct 2002 05:36:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c27e6d$e4efc8d0$8f33e40f@lsmith5953>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <20021027080906.OMSF9836.mta01-svc.ntlworld.com@there> <001c01c27d96$fafd0ed0$8f33e40f@lsmith5953> <20021028084908.MGPW27595.mta05-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

yeah the DHCRELAY is running on the firewall... below is how I am setting up
these rules.

iptables -N lan1-in
iptables -N ext-int-in
iptables -N lan2-in
iptables -N lan1-lan2-fwd
iptables -N lan2-lan1-fwd
iptables -N ext-int-fwd
iptables -N lan1-ext-fwd
iptables -N lan2-ext-fwd
iptables -N lan1-lan2

iptables -A INPUT -i eth1 -j lan1-in
iptables -A INPUT -i eth0 -j ext-int-in
iptables -A INPUT -i eth2 -j lan2-in

iptables -A FORWARD -i eth1 -o eth2 -j lan1-lan2-fwd
iptables -A FORWARD -i eth2 -o eth2 -j lan2-lan1-fwd
iptables -A FORWARD -i eth0 -j ext-int-fwd
iptables -A FORWARD -i eth1 -j lan1-ext-fwd
iptables -A FORWARD -i eth2 -j lan2-ext-fwd

iptables -A OUTPUT -o eth2 -j lan1-lan2
iptables -A OUTPUT -o eth0 -j ACCEPT
iptables -A OUTPUT -s 192.168.1.0/24 -j ACCEPT
iptables -A OUTPUT -p tcp -d x.x.x.x (ISP Assigned IP) -j ACCEPT

iptables -A ext-int-fwd -i eth0 -m state --state RELATED,ESTABLISHED -j
ACCEPT
iptables -A ext-int-fwd -i eth0 -j DROP

iptables -A ext-int-in -i eth0 -m state --state RELATED,ESTABLISHED -j
ACCEPT
iptables -A ext-int-in -i eth0 -j DROP

iptables -A lan1-ext-fwd -i eth1 -m state --state NEW,RELATED,ESTABLISHED -j
ACCEPT
iptables -A lan1-ext-fwd -i eth1 -j DROP

iptables -A lan1-in -i eth1 -s 192.168.1.0/24 -j ACCEPT
iptables -A lan1-in -i eth1 -j DROP

iptables -A lan1-lan2 -p udp -o eth2 --dport 68 -j ACCEPT
iptables -A lan1-lan2 -o eth2 -d 192.168.2.0/24 -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A lan1-lan2 -j DROP

iptables -A lan1-lan2-fwd -o eth2 -d 192.168.2.0/24 -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A lan1-lan2-fwd -o eth2 -j DROP

iptables -A lan2-ext-fwd -i eth2 -m state --state NEW,RELATED,ESTABLISHED -j
ACCEPT
iptables -A lan2-ext-fwd -i eth2 -j DROP

iptables -A lan2-in -i eth2 -p udp --dport 67 -j ACCEPT
iptables -A lan2-in -i eth2 -s 192.168.2.0/24 -j ACCEPT
iptables -A lan2-in -i eth2 -j DROP

iptables -A lan2-lan1-fwd -i eth2 -o eth1 -j ACCEPT
iptables -A lan2-lan1-fwd -i eth2 -o eth1 -j DROP


iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/16 -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward


----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Monday, October 28, 2002 3:49 AM
Subject: Re: DHCRELAY through IPTABLES Firewall


> On Sunday 27 October 2002 8:58 am, bigman@monster-solutions.net wrote:
>
> > I am running DHCRELAY as below
> >
> > dhcrelay -i eth2 192.168.1.70
> >
> > 192.168.1.70    DHCP Server (W2K)
> > LAN1 192.168.1.0
> > LAN2 192.168.2.0
> >
> > Here is my routing tables
> > Destination     Gateway         Genmask         Flags Metric Ref    Use
> > Iface
> > 192.168.2.0     *               255.255.255.0   U     0      0        0
> > eth2 192.168.1.0     *               255.255.255.0   U     0      0
> > 0 eth1 x.x.x.x (ISP Subnet)     *               255.255.252.0   U     0
> >  0 0 eth0
> > 127.0.0.0       *               255.0.0.0       U     0      0        0
lo
> > default         x.x.x.x (ISP Assigned IP) 0.0.0.0         UG    0      0
> > 0 eth0
>
> Okay, that all looks sensible.   By the way, just thought I'd check - I
> assume you are running dhcrelay on the firewall machine ?
>
> > Here are my Netfilter settings
>
> Please post the iptables commands used to set up your ruleset.
>
> You sent the ouput of iptables -L which doesn't show all the information
we
> need: even the verbose version iptables -L -v is not as informative as the
> original commands.   Thanks,
>
> Antony.
>
> --
>
> With thanks to God,
> For all that's come before,
> For all that will come after,
> But most of all, for this bit right here now.
>


