From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: port scanning
Date: Thu, 18 Mar 2004 16:15:20 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040319001520.73563.qmail@web61008.mail.yahoo.com>
References: <20040318224754.5502418D76@smtp.latinmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040318224754.5502418D76@smtp.latinmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jorge Garcia <anarkophobia@latinmail.com>, netfilter@lists.netfilter.org


--- Jorge Garcia <anarkophobia@latinmail.com> wrote:
> hi, i need an example of script ( please, i need the example works, becuo=
use
> i found a lot on internet that doesnt work) for logging and dropping port
> scans with iptables.
> thanx
>=20
> http://www.latinmail.com - La forma m=E1s c=F3moda de enviar y recibir tus
e-mails

This is what I use and it works very well. You will need to allow services(=
if
you have any that is.) Those rules must be placed before these lines. Also =
of
course you must have the device reflect your internet device.

# NMAP and Connection killer
 #
 # iptables -A INPUT -p tcp -i eth0 -m state --state NEW -j LOG
 iptables -A INPUT -p tcp -i eth0 -m state --state NEW,INVALID -j DROP
 iptables -A INPUT -p tcp -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

 # UDP Filters
 #
 #iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j LOG
 iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
 iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

 # ICMP Filtration
 #
 iptables -A INPUT -p icmp -i eth0 -m state --state NEW,INVALID -j DROP
 iptables -A INPUT -p icmp -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

Proof that it works?

hogwarts:~# iptables -vnL
Chain INPUT (policy ACCEPT 789K packets, 166M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
15813 1383K LOG        tcp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        tcp dpt:80 LOG flags 0 level 4
 2137  128K DROP       all  --  eth0   *       12.175.0.35          0.0.0.0=
/0
    0     0 ACCEPT     all  --  eth0   *       68.1.132.236         0.0.0.0=
/0
13676 1255K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        tcp dpt:80
 3727  208K DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        state INVALID,NEW
 2516 3759K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        state RELATED,ESTABLISHED
  27M 3361M DROP       udp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        state INVALID,NEW
 1543  227K ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        state RELATED,ESTABLISHED
 1697 1426K DROP       icmp --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        state INVALID,NEW
  133  7448 ACCEPT     icmp --  eth0   *       0.0.0.0/0            0.0.0.0=
/0 =20
        state RELATED,ESTABLISHED

Chain FORWARD (policy ACCEPT 11M packets, 3359M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

Chain OUTPUT (policy ACCEPT 1452K packets, 1121M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion




=3D=3D=3D=3D=3D
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Yahoo! Mail - More reliable, more storage, less spam
http://mail.yahoo.com

