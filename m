From: "Grant Furick" <furick1@attglobal.net>
Subject: Help for 2nics, 2isps, email out to only use 1isp
Date: Tue, 15 Oct 2002 08:47:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c27449$1563eca0$0efe10ac@GDF>
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
To: netfilter@lists.netfilter.org

The scenario is as follows.  2 network cards and 2 isps (DSL and CABLE).
DSL is static IP (eth0) and eth1 is actually an internal 192.168.0.10 ip
that is nat'd by an appliance (192.168.0.1) to then get out over the
cable modem.  I want all traffic coming in over DSL to go out over DSL
and any traffic coming in to the internal ip from other lan clients to
respond on the internal ip.  This all works except when I try and
specify that all outgoing email should use the DSL connection.  The
default route for the box is set to go out over the cable modem so as to
take advantage of the faster connection.  The reason that I want to use
DSL for all outgoing email is because external mail servers
(mindspring/earthlink) are rejecting receiving mail from my server
because it is coming from the cable modem which is dhcp.

Here is the script I run on my redhat 7.3 box at startup but also there
is an iptables command that I have saved and is restored automatically
that marks traffic going out over port 25 so it can be routed over DSL.
Can someone help with this script and the iptables/iproute2 connection?
The email is still sending over the cable modem and I can't figure out
why.  I have mixed two scripts together and there are probably obvious
conflicts but I am trying to learn.

# $IF1 is DSL (eth0)
# $IF2 is internal ip that goes out over CABLE via NAT from an appliance
= faster than DSL (eth1)

P1_NET=65.X.X.208
P2_NET=192.168.0.0
IF1=eth0
IF2=eth1
IP1=65.X.X.210
IP2=192.168.0.10
P1=65.X.X.209
P2=192.168.0.1

ip route add $P2_NET dev $IF2 src $IP2 table CABLE
ip route add default via $P2 table CABLE
ip route add $P1_NET dev $IF1 src $IP1 table DSL
ip route add default via $P1 table DSL
ip route add $P1_NET dev $IF1 src $IP1
ip route add $P2_NET dev $IF2 src $IP2
ip route del default
ip route add default via $P2
ip route add default via $P1 dev $IF1 table mail.out
ip rule add from $IP2 table CABLE
ip rule add from $IP1 table DSL
ip rule add fwmark 1 table mail.out
ip route flush cache

# this cmd is actually not part of the script but was what I executed
before saving the iptables configuration
iptables -A PREROUTING -i eth1 -t mangle -p tcp --dport 25 -j MARK
--set-mark 1

Here is the rt_tables:
#
# reserved values
#
#255    local
#254    main
#253    default
#0      unspec

#
# local
#
#1      inr.ruhep

200     DSL
201     CABLE
202 mail.out



