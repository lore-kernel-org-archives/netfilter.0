From: George Garvey <tmwg-netfilter@inxservices.com>
Subject: Re: Requestion for help with GRE tunnel
Date: Tue, 18 Jun 2002 08:59:53 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618085953.C2662@inxservices.com>
References: <20020618063945.A2662@inxservices.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020618063945.A2662@inxservices.com>; from tmwg-netfilter@inxservices.com on Tue, Jun 18, 2002 at 06:39:45AM -0700
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

   Thanks for the fast response. I remembered that I have a spare IP on
an ADSL, so changed the setup as follows, based on your mention of a
requirement for a router. This setup still lets me experiment with both
computers in the same room, but is more similar to the final desired
setup:

eth0: 192.168.2.2 ---------- gigE switch ------ eth0: 192.168.1.12
------------------------			----------------------
| salesns.inxsales.lan |			| ns.inxservices.com |
------------------------			----------------------
eth1: 63.193.79.20 --------- 100 switch -------	eth2: 63.193.79.19
				|		eth1: 66.134.162.140
			    ADSL modem			|
			    	|		  SDSL modem/hub
				|			|
				------- internet --------

GRE tunnel (withvan):				GRE tunnel (withsales):
63.193.79.20 -> 63.193.79.19			63.193.79.19 -> 63.193.79.20
IP: 192.168.3.1					IP: 192.168.3.2
ip route add 192.168.1.0/24 dev withvan		ip route add 192.168.2.0/24
							dev withsales

I can ping 63.193.79.19 from 63.193.79.20.
I can ping 63.193.79.20 from 63.193.79.19.
I cannot ping 192.168.1.12 from salesns.

Here are the commands I'm using:

192.168.1.12:

/sbin/ip link set dev eth0 up mtu 1500
/sbin/ip address add 192.168.1.12/24 broadcast 192.168.1.255 dev eth0

/sbin/ip link set dev eth1 up
/sbin/ip address add 66.134.162.140/29 broadcast 66.134.162.143 dev eth1

/sbin/ip link set dev eth2 up
/sbin/ip address add 63.193.79.19/29 broadcast 63.193.79.23 dev eth2

/sbin/ip link set dev lo up
/sbin/ip address add 127.0.0.1/8 broadcast + dev lo

/sbin/ip route add default via 63.193.79.17 dev eth2

/sbin/ip tunnel add withsales mode gre remote 63.193.79.20 local 63.193.79.19 ttl 255 dev eth0
/sbin/ip link set withsales up
/sbin/ip address add 192.168.3.2/24 broadcast + dev withsales
/sbin/ip route add 192.168.2.0/24 dev withsales

192.168.2.2:

/sbin/ip link set dev eth0 up mtu 1500
/sbin/ip address add 192.168.2.2/24 broadcast 192.168.2.255 dev eth0

/sbin/ip link set dev eth1 up
/sbin/ip address add 63.193.79.20/29 broadcast 63.193.79.23 dev eth1

/sbin/ip link set dev lo up
/sbin/ip address add 127.0.0.1/8 broadcast + dev lo

/sbin/ip route add default via 63.193.79.20 dev eth1

/sbin/ip tunnel add withvan mode gre remote 63.193.79.19 local 63.193.79.20 ttl 255 dev eth0
/sbin/ip link set withvan up
/sbin/ip address add 192.168.3.1/24 broadcast + dev withvan
/sbin/ip route add 192.168.1.0/24 dev withvan

