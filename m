From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: destinations interface must be eth0?
Date: Tue, 16 Sep 2003 19:07:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063732030.784.35.camel@elendil.intranet.cartel-securite.net>
References: <1063637259.2318.3.camel@dod-secure.e-masi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063637259.2318.3.camel@dod-secure.e-masi.com>
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
To: jburnett@e-masi.com
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le lun 15/09/2003 =E0 16:47, Jim Burnett a =E9crit :
> I have found that my destination IP in my rules MUST be bound on eth0
> what is this? I thought I could use any working IP on my internal
> network as the --to-destination IP...??
> Example:
> internal machine:
> eth0:192.168.1.55
> eth1:192.168.1.56

There's a wierd thing in your setup. Can you show us your routing table,
as I don't see how you could assign 192.168.1.55 and 192.168.1.56 in two
different subnets.

Btw, I tried on my box that has two interfaces the same thing, and it
works :

cbr@elendil:~$ ifconfig
eth0      Lien encap:Ethernet  HWaddr 00:0A:41:EE:A5:50
          inet adr:192.168.100.10  Bcast:192.168.100.127
		Masque:255.255.255.128
[...]
eth1      Lien encap:Ethernet  HWaddr 00:01:02:50:0E:0E
          inet adr:192.168.100.130  Bcast:192.168.100.255=20
Masque:255.255.255.128
[...]
cbr@elendil:~$ sudo iptables -v -t nat -A PREROUTING -i eth0 -p tcp
--dport 80 -j DNAT --to 192.168.100.15:80
DNAT  tcp opt -- in eth0 out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:80
to:192.168.100.15:80
cbr@elendil:~$ sudo iptables -v -t nat -A PREROUTING -i eth0 -p tcp
--dport 80 -j DNAT --to 192.168.100.155:80
DNAT  tcp opt -- in eth0 out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:80
to:192.168.100.155:80
cbr@elendil:~$ sudo iptables -t nat -L PREROUTING -v
Chain PREROUTING (policy ACCEPT 140 packets, 23585 bytes)
 pkts bytes target     prot opt in     out     source             =20
destination                                                              =
                  =20
    0     0 DNAT       tcp  --  eth0   any     anywhere           =20
anywhere        tcp dpt:www to:192.168.100.15:80
    0     0 DNAT       tcp  --  eth0   any     anywhere           =20
anywhere        tcp dpt:www to:192.168.100.155:80

And :

cbr@elendil:~$ iptables --version
iptables v1.2.8
cbr@elendil:~$ uname -r
2.4.22

Patch-o-matic pending and submitted sections are applied.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

