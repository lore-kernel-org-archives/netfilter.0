From: "Nick" <mailist@3wsi.com>
Subject: SNAT-ing between different iface in same gway.
Date: Mon, 28 Apr 2003 02:30:11 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004401c30cf3$6c417040$b9105e3d@stargazer>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I got one gateway acting as masquerading + pakcet filter.

It has 3 interfaces :
eth1 - internet ( e.g : 1.2.3.4.5 )
eth0 - Lan1 ( 10.0.3.0/24 ) Gateway : 10.0.0.11
eth2 - Lan2 ( 192.168.2.0/24 ) Gateway : 192.168.2.1

All workstations in LAN are NATed to outside as 1.2.3.4.5
it's catched by the latest rule number in POSTROUTING's SNAT :

SNAT       all  --  *      eth1    0.0.0.0/0            0.0.0.0/0
to:1.2.3.4.5  ( SNAT Rule number 2)


There is one HTTP webserver in a workstation,
redirected to a machine in lan1 : 10.0.3.16 by the gateway.
as written in the the netfilter howto, it's working, and the rule
listing are :

PREROUTING:
DNAT       tcp  --  *      *       0.0.0.0/0            1.2.3.4.5
tcp dpt:80 to:10.0.3.16:80

POSTROUTING
SNAT       tcp  --  *      *       10.0.3.0/24         10.0.3.16
tcp dpt:80 to:1.2.3.4.5  ( SNAT Rule Number 1)





Now another webserver should be advertised to the internet.
I add one more IP to the gateway , which i added with `ip addr add dev
eth1  1.2.3.4.6`
now the machine should redirect any request to 1.2.3.4.6 port 80 to a
machine on Lan2 192.168.2.18
rules listing are :

PREROUTING :
DNAT       tcp  --  eth1   *       0.0.0.0/0            1.2.3.4.6    tcp
dpt:80 to:192.168.2.18:80
DNAT       tcp  --  !eth1  *       0.0.0.0/0            1.2.3.4.6    tcp
dpt:80 to:192.168.2.18:80

POSTROUTING :
SNAT       tcp  --  *      *       192.168.2.18         0.0.0.0/0
to:1.2.3.4.6


and what SRC IP should I use if a machine on lan1 wants to connect to
1.2.3.4.6 port 80 ?
e.g :


SNAT       tcp  --  *      *       10.0.3.0/24          192.168.2.18
tcp dpt:80 to:1.2.3.4.5

OR

SNAT       tcp  --  *      *       10.0.3.0/24          192.168.2.18
tcp dpt:80 to:10.0.0.11

which rule is to be put on top of others ( Specially on POSTROUTING ) ?


Currently the lan2 webserver is reacheable from the internet ( eth1 )
but not from the inside.



















