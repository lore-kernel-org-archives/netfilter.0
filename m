From: Paul <lists@loudas.com>
Subject: Help with fwmark and shorewall
Date: Tue, 14 Dec 2004 14:44:05 +1300
Message-ID: <41BE4565.7090503@loudas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Netfilter Users (List)" <netfilter@lists.netfilter.org>

I'm using shorewall, 2 ISP connections, and I want to force udp 500 
traffic out one particular interface

here's what I have so far
/etc/shorewall/tcrules:
4       0.0.0.0/0       202.37.230.93   udp     500
4       202.37.230.93   0.0.0.0/0       udp     500


shorewall show mangle | grep MARK
    14  4203 MARK       udp  --  *      *       0.0.0.0/0 
202.37.230.93       udp dpt:500 MARK set 0x4
     0     0 MARK       udp  --  *      *       202.37.230.93 
0.0.0.0/0           udp dpt:500 MARK set 0x4

routing:
/sbin/ip rule add prio 223 fwmark 4 table 223
/sbin/ip route add default via 202.37.230.65 dev eth2 \
          src 202.37.230.93 proto static table 223

routing rules:
ip rule show
0:      from all lookup local
50:     from all lookup main
201:    from 202.37.230.64/26 lookup 201
202:    from 203.96.212.0/23 lookup 202
222:    from all lookup 222
223:    from all fwmark 0x4 lookup 223
32766:  from all lookup main
32767:  from all lookup default

ip route show table 223
default via 202.37.230.65 dev eth2  proto static  src 202.37.230.93

the load balancing work flawlessly :)
however I have racoon (kernel 2.6.8.1) on the firewall, and only 
sometimes it responds using 202.37.230.93 .. sometimes it uses my other 
ISP connection .. which is no good :(

I've got to the point where I guess I need to use fwmark before routing, 
but it doesn't seem to work :(

Any help

Thanks
Paul.


