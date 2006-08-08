From: Marek Zachara <marek.zachara@telperion.pl>
Subject: Problem with router connected to two ISPs (connection marking?)
Date: Tue, 8 Aug 2006 21:40:03 +0200
Message-ID: <200608082140.03815.marek.zachara@telperion.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi there

I have spent a few days trying to figure it out, but either my mistake is very obvious or its buried quite deeply in the netfilter logic 
in either case i have little chance of progressing further ;)

I have a following setup: a router is connected on eth0 to a switch with two DSL modems (each for different ISP) and on eth1 to DMZ and on eth2 to internal network

I want to be able to connect to the WWW server using either of the two addresses (each belonging to one of the ISPs' pools) e.g 1.0.0.2 (via ISP1) and 2.0.0.2 (via ISP2).

However, the problem is i can connect via ISP1 address (1.0.0.2), but when i try to connect via the seconf IP (2.0.0.2) the connection state only gets to SYN_RCV and then its stuck - further communication is unsuccesful.

I guess there is some problem with routing, but i cant find out where.

I'm marking all incoming packets in the mangle table to keep track on which connection they have arrived - to route them correctly, but this somehow doesnt seem to work. The connection gets marked (according to iptables -t mangle -nvL it hits the marking rule, but then it never hits the matching rule...):

   97  9257 CONNMARK   all  --  eth0   *       0.0.0.0/0            0.0.0.0/0           CONNMARK restore
   64 11608 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           CONNMARK match 0x1
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           CONNMARK match 0x2
   57  6495 CONNMARK   all  --  eth0   *       0.0.0.0/0            1.0.0.0/29          CONNMARK set 0x1
    1    60 CONNMARK   all  --  eth0   *       0.0.0.0/0            2.0.0.0/29          CONNMARK set 0x2
   59  6633 CONNMARK   all  --  eth0   *       0.0.0.0/0            0.0.0.0/0           CONNMARK save

here is part of the contrack table (192.168.1.0/24 is DMZ):

# cat /proc/net/ip_conntrack |grep 2.0.0.2
tcp      6 49 SYN_RECV src=80.55.132.234 dst=2.0.0.2 sport=33852 dport=80 src=192.168.1.16 dst=80.55.132.234 sport=80 dport=33852 mark=0 use=1
tcp      6 19 SYN_RECV src=80.55.132.234 dst=2.0.0.2 sport=33853 dport=80 src=192.168.1.16 dst=80.55.132.234 sport=80 dport=33853 mark=0 use=1
tcp      6 22 SYN_RECV src=80.55.132.234 dst=2.0.0.2 sport=33854 dport=80 src=192.168.1.16 dst=80.55.132.234 sport=80 dport=33854 mark=0 use=1

here is the iptables script: ------------------------

EXTINT=eth0
DMZ=eth1
INTERN=eth2

MAIL=1.0.0.1
WWW=1.0.0.2
MAIL2=2.0.0.1
WWW2=2.0.0.2

INT_WWW=192.168.1.16

$IPT -P INPUT DROP
$IPT -F INPUT
$IPT -P OUTPUT ACCEPT
$IPT -F OUTPUT
$IPT -P FORWARD ACCEPT
$IPT -F FORWARD

$IPT -t filter -N keep_state
$IPT -t filter -A keep_state -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A keep_state -j RETURN
$IPT -t filter -A INPUT -j keep_state
$IPT -t filter -A OUTPUT -j keep_state
$IPT -t filter -A FORWARD -j keep_state

$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -p icmp -j ACCEPT
#silently discard all windows related worm attacks
$IPT -A INPUT -p tcp --destination-port 135:140 -j DROP
$IPT -A INPUT -p udp --destination-port 135:140 -j DROP
$IPT -A INPUT -p tcp --destination-port 445 -j DROP
#drop any traffic incomming on unprivileged ports
$IPT -A INPUT -p tcp --destination-port ! 1:1024 -j DROP
$IPT -A INPUT -p udp --destination-port ! 1:1024 -j DROP
#log any potential scans of privileged ports (ignore port 80)
$IPT -A INPUT -p tcp --destination-port 80 -j DROP
$IPT -A INPUT -i $EXTINT -j LOG --log-level info

$IPT -t nat -F


# WWW server
$IPT -t nat -A PREROUTING -d $WWW -p tcp --destination-port 80 -j DNAT --to-destination $INT_WWW
$IPT -t nat -A PREROUTING -d $WWW2 -p tcp --destination-port 80 -j DNAT --to-destination $INT_WWW

#masquerade all other outgoing transfers
$IPT -t nat -A POSTROUTING -o $EXTINT -j MASQUERADE

$IPT -t mangle -F
$IPT -t mangle -A PREROUTING -i $EXTINT -j CONNMARK --restore-mark
$IPT -t mangle -A PREROUTING -m connmark --mark 1 -j ACCEPT
$IPT -t mangle -A PREROUTING -m connmark --mark 2 -j ACCEPT
$IPT -t mangle -A PREROUTING -i $EXTINT -d 1.0.0.0/29 -j CONNMARK --set-mark 1
$IPT -t mangle -A PREROUTING -i $EXTINT -d 2.0.0.0/29 -j CONNMARK --set-mark 2
$IPT -t mangle -A PREROUTING -i $EXTINT -j CONNMARK --save-mark

and here are ip rules: -----------------------------------------

0:      from all lookup local
100:    from all fwmark 0x1 lookup ISP1
110:    from all fwmark 0x2 lookup ISP2
241:    from 1.0.0.0/29 lookup ISP1
242:    from 2.0.0.0/29 lookup ISP2
245:    from all lookup ISP1
32766:  from all lookup main
32767:  from all lookup default

-------------------------------------------------------------

the problem probably is the connection is not marked correctly - so during the routing its routed via default ISP1 table. But why this happens is unknown to me :(

any help will be greatly appreciated
Marek


