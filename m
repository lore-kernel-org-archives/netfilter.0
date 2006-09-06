From: Danny Rathjens <gmane@rathjens.org>
Subject: generating icmp redirects
Date: Wed, 06 Sep 2006 15:01:19 -0400
Message-ID: <edn5u0$fbn$1@sea.gmane.org>
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
To: netfilter@lists.netfilter.org

I want to redirect packets to a different machine (similar to transparent proxy type setup).
(I am trying to emulate a network at a bank where our linux distro is having trouble
configuring network/connecting to our server)

I chose a random box on my net to be my test gateway, enabled forwarding and added rule to
mark packets destined for port 666 and route them to a different machine:

on test gateway:
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 666 -j MARK --set-mark 2
echo 202 eos >> /etc/iproute2/rt_tables
ip rule add fwmark 2 table eos
ip route add default via 192.168.1.16 dev eth0 table eos
ip route flush cache

on eos(place being redirected to):
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 666 -j REDIRECT 
nc -l -p 666 -c "echo eos"

on test host on internal net:
route del default gw
route add default gw 192.168.1.4 # test gateway
perl -MIO::Socket -wle' my $sock = IO::Socket::INET->new( PeerAddr => "4.2.2.2", PeerPort => 666, Proto => "tcp") or die;print <$sock>'
# 4.2.2.2 is random host out in the world

This does print "eos" as it should, since the packets got routed to eos.
But I am not seeing any ICMP redirects like I want when I do
tcpdump tcp port 666 or icmp
(just normal 3-way handshake, some data packets, ack, then reset.)

It seems that sending redirects is the default:
cat /proc/sys/net/ipv4/conf/*/send_redirects
1
1
1
1

So any idea how to force the ICMP redirects to happen?
-- 
    _.,-*~`^'~*-,._ Danny Rathjens _.,-*~`^'~*-,._
FireCast: Rock solid kiosk software: http://www.wirespring.com/


