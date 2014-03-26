From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: ICMP redirects routing non-web traffic to proxy
Date: Wed, 26 Mar 2014 09:46:27 -0700
Message-ID: <53330463.8090506@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1395852391;
	bh=2A1SPRMflmD8TvjTW2wWnE7AfuhFrGstpdXpXRz0dKk=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=oGBf+in0oNHKyX3g5h0Uqq+y9EpdXELrzQ9XuNLvvb5AD3Bl0Zh0gc+Vx9DYpUa3Z
	 matZMQXDFjbnEkqoUuiwB6vMG/+byEIRpIxzn6pjhkCa7qT7rzvcbJabp81MTu2PTK
	 f1YB87799rtm+XR8oYT9+dlQMcmwrshALl0mMxQ0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've read cautions that ICMP redirects are a sign you should fix your 
routing, but we've been using them in our small network as a poor man's 
routing protocol. We have a wifi point-to-multipoint setup connecting 
five routers (five subnetworks) and a default gateway. Static routes to 
each of the subnets are manually configured in the default gateway. We 
want to keep traffic between the subnets off the main gateway, but ICMP 
redirects already achieve this pretty effectively. The network is at a 
school in East Africa with limited network administration capacity, so 
we decided that relying on ICMP redirects (which work out of the box) 
was preferable to manually keeping static routes synchronized, or 
setting up RIP. I confirmed that the routing cache in each router 
contains routes directly to the other subnets, and that traffic reaching 
the main gateway mostly doesn't include traffic between the subnets.

Great.

Until we installed an intercepting proxy. We installed a caching proxy 
to cut down on latency and save bandwidth, and we decided against an 
explicit proxy to avoid reconfiguring workstations, again because there 
is limited network administration capacity available.

We added the proxy (192.168.1.2) to the wifi point-to-multipoint network 
(192.168.1.0/24) it's on the same switch as the main gateway 
(192.168.1.1). The gateway is running OpenWrt and the proxy is running 
Apache Traffic Server on Debian.

We use the following commands on the gateway to route web traffic to the 
proxy:

# Route web traffic to the proxy, except traffic already originating
# from the proxy.  Matching web traffic by port number isn't perfect,
# but it's good enough.  This is the MAC address of the proxy.
# Because it's configured to make origin connections transparent, this
# is the only way to match traffic already originating from the proxy:
# 
http://thread.gmane.org/gmane.comp.security.firewalls.netfilter.general/45405

ip route add table 1 via 192.168.1.2
ip rule add fwmark 1/1 table 1

iptables -A PREROUTING -t mangle -m mac --mac-source 00:23:8b:3c:a3:14 
-j RETURN
iptables -A PREROUTING -t mangle -p tcp --dport 80 -j MARK --set-mark 1/1
iptables -A PREROUTING -t mangle -i eth1 -p tcp --sport 80 -j MARK 
--set-mark 1/1

On the proxy we use the following commands to deliver traffic to the 
proxy software:

ip route add local default table 1 dev lo
ip rule add fwmark 1/1 table 1

iptables -A PREROUTING -t mangle -m addrtype --dst-type LOCAL -j RETURN\
iptables -A PREROUTING -t mangle -p tcp -j TPROXY --on-port 8080 
--tproxy-mark 1/1\

When a client in one of the subnets visits a website 
(http://example.com) the gateway routes the request to the proxy and the 
proxy routes the response back to the client via the gateway. No problem.

The problem is that the gateway then sends an ICMP redirect to the 
router in the client's subnet which caches a route to the origin 
(example.com) via the proxy (192.168.1.2). This is a problem if any 
client in the same subnet then attempts to exchange any non-web traffic 
with the same origin, e.g. if the client is redirected from 
http://example.com to https://example.com. The cache routes traffic to 
the proxy that we wouldn't normally intercept. Fail.

Do you see any simple or elegant solutions to this problem?
