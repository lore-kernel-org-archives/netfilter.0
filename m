From: Tommy W <tommy@svearike.sytes.net>
Subject: My Gateway won't listen on second internet interface (internally)
Date: Thu, 20 Jan 2005 19:57:21 +0100
Message-ID: <200501201957.21813.tommy@svearike.sytes.net>
Reply-To: 189@telia.com
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

I have the box configured like this
root@svearike:~# ip rule
0:      from all lookup local 
32762:  from all fwmark 0x2 lookup bostream 
32764:  from 82.182.37.52 lookup bostream 
32766:  from all lookup main 
32767:  from all lookup default

root@svearike:~# ip route show
192.168.0.0/24 dev eth1  proto kernel  scope link  src 192.168.0.8 
82.182.37.0/24 dev eth2  proto kernel  scope link  src 82.182.37.52 
83.251.64.0/21 dev eth0  proto kernel  scope link  src 83.251.70.192 
127.0.0.0/8 dev lo  scope link 
default via 83.251.64.1 dev eth0

root@svearike:~# ip route show table bostream
default via 82.182.37.1 dev eth2

ip route add default via $BOSTREAMGW dev eth2 table bostream
ip rule add from $BOSTREAMIP table bostream
ip rule add fwmark 0x02 lookup bostream
$IPTABLES -t mangle -m tcp -A PREROUTING -p tcp -s 192.168.0.5 --dport 80 -j 
MARK --set-mark 0x02
$IPTABLES -I FORWARD -i $TELIAIF -o $INTIF -m state -d 192.168.0.5 --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -I FORWARD -i $BOSTREAMIF -o $INTIF -m state -d 192.168.0.5 --state 
ESTABLISHED,RELATED -j ACCEPT


it's working perfectly .. putting all the outbound port 80 traffic on eth2 and 
the rest on eth0 .. 
It listens and serves ftp on both eth0 and eth2 
Everything works fine.. EXCEPT!! I can't even do ping 82.182.37.52 (eth2) from 
my local net (eth1) if I am on 192.168.0.5 (eth1) and do ping 83.251.70.192 
(eth0) it works.
but if I do from 192.168.0.5 (eth1) ping 82.182.37.52 (eth2) it doesn't work.
For some reason the gateway doesn't know what to do when a request is sent to 
it on that ip.
Something strange in the routing table?


