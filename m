From: Tommy W <tommy@svearike.sytes.net>
Subject: 3 Nics - 2 internet connections 1 localnet - Forwarding not working
	properly
Date: Fri, 25 Feb 2005 03:55:46 +0100
Message-ID: <200502250355.47176.tommy@svearike.sytes.net>
Reply-To: 189@telia.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

As the short subject line informs you
I have 3 network cards and 2 internet connections
eth0 - default internet
eth1 - localnet
eth2 - secondary internet (used mainly for http)

I wrote a script that puts up some portforwarding:
---------------------------
#!/bin/bash
if [ "$4" ]; then
  PROTO=$4
  else
  PROTO="tcp"
 fi
IP=`ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`
IP2=`ifconfig eth2 | grep inet | cut -d: -f2 | cut -d\  -f1`
iptables -A PREROUTING -t nat -d $IP -p $PROTO -m $PROTO --dport $1 -j DNAT 
--to-destination $2:$3
iptables -A PREROUTING -t nat -d $IP2 -p $PROTO -m $PROTO --dport $1 -j DNAT 
--to-destination $2:$3
iptables -A FORWARD -d $2 -i eth0 -o eth1 -p $PROTO -m $PROTO --dport $3 -j 
ACCEPT
iptables -A FORWARD -d $2 -i eth2 -o eth1 -p $PROTO -m $PROTO --dport $3 -j 
ACCEPT
---------------------------
basically that would setup portforwarding typing: 
add_portforward 6000 192.168.0.5 21

that would portforward port 6000 to 192.168.0.5:21
it all works fine for my main ip.
but when it comes to the second ip . *gee* 
it doesn't know how to handle it.. 
my qualified guess says the signal going back to the initiator of the 
connection is going through eth0 instead of eth2 ..thus not working.
What am I missing ?

my eth0 is setup using dhcpcd
and my eth2 is setup using static ip
plus these iproute2 settings:

ip rule add from 0/0 dev eth2 table bostream
ip rule add from $BOSTREAMIP table bostream
ip rule add fwmark 0x02 lookup bostream
ip route add default via $BOSTREAMGW dev $BOSTREAMIF table bostream
ip route add 192.168.0.0 dev $INTIF table bostream


So to clarify things. What I want to achieve is for a connection initated from 
the outside (eth2) to be forwarded to a local host (via eth1).
And all the answers from this host should go back (via eth1) and be forwarded
out to the originating server (via eth2) instead of being stopped 'cause of 
reaching the server with the ip of eth0.
.... eehm.. when I think of it, that didn't really come out any more 
comprehensive :)
sure hope anyone can help


Tommy
-----------
2 is the only even prime-number therefore it is odd

