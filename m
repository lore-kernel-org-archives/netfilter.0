From: A G <utopian201@hotmail.com>
Subject: Force routing
Date: Thu, 23 Aug 2012 01:12:29 +1200
Message-ID: <COL124-W41DC84ADA57640D31B0ACF84BF0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi
I have a bridge setup with an application listening on port 8080. What I want is for the traffic on port 80 to be intercepted by the bridge and sent to my listening application.
I have the following setup:
#setup the bridge
brctl addbr0
brctl addif br0 eth1
brctl addif br0 eth2
ifconfig eth1 0.0.0.0
ifconfig eth2 0.0.0.0
ip link set br0 up

#set the ebtables to force intercept any frame coming in on port 80
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp --ip-dport 80 -j redirect --redirect-target DROP

#set iptables to forward this traffic to msy app listening on port 8080
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY --on-port 8080 --tproxy-mark 1/1
iptables -t mangle -A PREROUTING -p tcp -j MARK --set-mark 1/1

#once the flows are marked, have them delivered locally via loopback interface
ip rule add fwmark 1/1 table 1
ip route add local 0.0.0.0/0 dev lo table 1

#enable ip packet forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

However nothing is coming into my application. Am I missing anything? My understanding is that the target DROP on the broute BROUTING chain will push it up to be processed by iptables.

Thanks

 		 	   		  