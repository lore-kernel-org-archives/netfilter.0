From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Requestion for help with GRE tunnel
Date: Tue, 18 Jun 2002 13:53:36 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618175336.GB26150@cannon.eng.us.uu.net>
References: <20020618063945.A2662@inxservices.com> <20020618085953.C2662@inxservices.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020618085953.C2662@inxservices.com>
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
To: George Garvey <tmwg-netfilter@inxservices.com>
Cc: netfilter@lists.samba.org

On Tue, Jun 18, 2002 at 08:59:53AM -0700, George Garvey wrote:

>    Thanks for the fast response. I remembered that I have a spare IP on
> an ADSL, so changed the setup as follows, based on your mention of a
> requirement for a router. This setup still lets me experiment with both
> computers in the same room, but is more similar to the final desired
> setup:
> 
> eth0: 192.168.2.2 ---------- gigE switch ------ eth0: 192.168.1.12
> ------------------------			----------------------
> | salesns.inxsales.lan |			| ns.inxservices.com |
> ------------------------			----------------------
> eth1: 63.193.79.20 --------- 100 switch -------	eth2: 63.193.79.19
> 				|		eth1: 66.134.162.140
> 			    ADSL modem			|
> 			    	|		  SDSL modem/hub
> 				|			|
> 				------- internet --------
> 
> GRE tunnel (withvan):				GRE tunnel (withsales):
> 63.193.79.20 -> 63.193.79.19			63.193.79.19 -> 63.193.79.20
> IP: 192.168.3.1					IP: 192.168.3.2
> ip route add 192.168.1.0/24 dev withvan		ip route add 192.168.2.0/24
> 							dev withsales
> 
> I can ping 63.193.79.19 from 63.193.79.20.
> I can ping 63.193.79.20 from 63.193.79.19.
> I cannot ping 192.168.1.12 from salesns.

This is obvious. 192.168.2.2/24 and 192.168.1.12/24 are not in the
same subnet but are connected through a switch. What should this
gigE switch do here? If these interfaces are there only for you to
test the tunnel, you made a very expensive choice; no switch necessary or
just use some dummy interface... But for now, leave it be.

> 
> Here are the commands I'm using:
> 
> 192.168.1.12:
> 
> /sbin/ip link set dev eth0 up mtu 1500
> /sbin/ip address add 192.168.1.12/24 broadcast 192.168.1.255 dev eth0
> 
> /sbin/ip link set dev eth1 up
> /sbin/ip address add 66.134.162.140/29 broadcast 66.134.162.143 dev eth1
> 
> /sbin/ip link set dev eth2 up
> /sbin/ip address add 63.193.79.19/29 broadcast 63.193.79.23 dev eth2
> 
> /sbin/ip link set dev lo up
> /sbin/ip address add 127.0.0.1/8 broadcast + dev lo
> 
> /sbin/ip route add default via 63.193.79.17 dev eth2
> 
> /sbin/ip tunnel add withsales mode gre remote 63.193.79.20 local 63.193.79.19 ttl 255 dev eth0

Why are you saying here "dev eth0"? This dev has nothing to do with
your tunnel here. Just remove "dev eth0".

> /sbin/ip link set withsales up
> /sbin/ip address add 192.168.3.2/24 broadcast + dev withsales
> /sbin/ip route add 192.168.2.0/24 dev withsales

Change this to:
/sbin/ip route add 192.168.2.0/24 via 192.168.3.1 dev withsales

> 
> 192.168.2.2:
> 
> /sbin/ip link set dev eth0 up mtu 1500
> /sbin/ip address add 192.168.2.2/24 broadcast 192.168.2.255 dev eth0
> 
> /sbin/ip link set dev eth1 up
> /sbin/ip address add 63.193.79.20/29 broadcast 63.193.79.23 dev eth1
> 
> /sbin/ip link set dev lo up
> /sbin/ip address add 127.0.0.1/8 broadcast + dev lo
> 
> /sbin/ip route add default via 63.193.79.20 dev eth1
> 
> /sbin/ip tunnel add withvan mode gre remote 63.193.79.19 local 63.193.79.20 ttl 255 dev eth0

Same thing here. Remove "dev eth0".

> /sbin/ip link set withvan up
> /sbin/ip address add 192.168.3.1/24 broadcast + dev withvan
> /sbin/ip route add 192.168.1.0/24 dev withvan

Change this to:
/sbin/ip route add 192.168.1.0/24 via 192.168.3.2 dev withvan

It should work.

Ramin

