From: Danny Rathjens <gmane@rathjens.org>
Subject: Re: generating icmp redirects
Date: Wed, 06 Sep 2006 18:17:53 -0400
Message-ID: <44FF4911.5050700@rathjens.org>
References: <edn5u0$fbn$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <edn5u0$fbn$1@sea.gmane.org>
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

I resolved my own issue, after some discussions on irc.
It turns out that the kenel does not issue ICMP redirects in
situations such as I set up below because the routing is dynamic.
The way I have it: A with gw of B, B redirecting to C if destination
port is 666.  Well B can't send ICMP redirect to A telling it
to send all traffic for 666 straight to C because those redirects
only occur at the host level(not the port), and A still needs to
send non 666 stuff to B since the redirect is only for port 666 packets.

Anyway, I was able to generate icmp redirects by simply redirecting
all traffic to the real gateway from my test gateway.  Which my
linux distro's network configuration/install handled fine, so I can
eliminate not handling icmp redirects properly as the source of the
problem and back off to the drawing board I go.

Danny Rathjens wrote:
> I want to redirect packets to a different machine (similar to 
> transparent proxy type setup).
> (I am trying to emulate a network at a bank where our linux distro is 
> having trouble
> configuring network/connecting to our server)
> 
> I chose a random box on my net to be my test gateway, enabled forwarding 
> and added rule to
> mark packets destined for port 666 and route them to a different machine:
> 
> on test gateway:
> echo 1 > /proc/sys/net/ipv4/ip_forward
> iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 666 -j MARK 
> --set-mark 2
> echo 202 eos >> /etc/iproute2/rt_tables
> ip rule add fwmark 2 table eos
> ip route add default via 192.168.1.16 dev eth0 table eos
> ip route flush cache
> 
> on eos(place being redirected to):
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 666 -j REDIRECT nc 
> -l -p 666 -c "echo eos"
> 
> on test host on internal net:
> route del default gw
> route add default gw 192.168.1.4 # test gateway
> perl -MIO::Socket -wle' my $sock = IO::Socket::INET->new( PeerAddr => 
> "4.2.2.2", PeerPort => 666, Proto => "tcp") or die;print <$sock>'
> # 4.2.2.2 is random host out in the world
> 
> This does print "eos" as it should, since the packets got routed to eos.
> But I am not seeing any ICMP redirects like I want when I do
> tcpdump tcp port 666 or icmp
> (just normal 3-way handshake, some data packets, ack, then reset.)
> 
> It seems that sending redirects is the default:
> cat /proc/sys/net/ipv4/conf/*/send_redirects
> 1
> 1
> 1
> 1
> 
> So any idea how to force the ICMP redirects to happen?


