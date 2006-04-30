From: "Tony" <tony@games-master.co.uk>
Subject: Redirecting web traffic out of eth1
Date: Sun, 30 Apr 2006 19:34:19 +0100
Message-ID: <200604301830.k3UIUgqs025150@main.games-master.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

We currently running a squid server which proxies requests that get send to
it from our Cisco router.
The Cisco router terminates and L2TP tunnel and our users connect over this
tunnel.
We don't need to proxy all web traffic so each user that needs to be proxied
is assigned a policy map via a radius attribrute.
The policy map sends all web requests to our squid server and the squid
server has the following iptables entries to forward the port 80 requests to
squid on port 3128.

###############
/sbin/iptables --table nat --append POSTROUTING --out-interface eth0 -j
MASQUERADE /sbin/iptables -A PREROUTING -t nat -p tcp -s 10.0.0.0/20 --dport
80 -j DNAT --to 192.168.0.4:3128 
###############

This all works fine and has been for a while now, and all users on
10.0.0.0/20 get forwarded to squid.
However since we added another subnet on a different interface on the Cisco
we've had some issues. 
If a user is being proxied via a policy map they can't browse any web sites
on the second subnet.
The natural route to the second subnet from the squid server is out the
server, through a switch, onto the Cisco and into the interface the second
subnet is on.


L2tp-tunnel---switch---cisco--switch--second-subnet
                |
                |
              squid

However the request never even reaches the web server on the second subnet.
I've run tcpdump on the web server and it shows no traffic coming in.
A tcpdump on the squid server just shows the request trying to be made to
the web server.
It seems that the Cisco is just send the port 80 traffic back to squid,
although no interface on the router has the redirect policy map assigned to
it, other than the per user virtual interfaces. And besides the access list
the policy map uses has a rule to deny web requests from the squid IP
address.

So I thought the solution was to connect eth1 on the squid server to the
switch on the second subnet, thus giving the natural route out through eth1
bypassing the Cisco. This I did and from a command prompt a traceroute to
the second subnet goes out through eth1. A printing of the route table shows
a route for the subnet out through eth1 also.

L2tp-tunnel---switch---cisco--switch--second-subnet
                |                |
                |                | 
              Squid---------------

However I'm still getting the same problem.
Any user with the policy map assigned still cannot view web sites on the
second subnet.
It seems that squid isn't sending this traffic via eth1, again I run tcpdump
on the squid server and the web server on the second subnet and get the same
results.

Is there a way with iptables to force any web traffic for the second subnet,
10.1.1.0/24 out through eth1 before the squid redirect rules?

#####
/sbin/iptables --table nat --append POSTROUTING --out-interface eth0 -j
MASQUERADE /sbin/iptables -A PREROUTING -t nat -p tcp -s 10.0.0.0/20 --dport
80 -j DNAT --to 192.168.0.4:3128
####

I thought since I'm already doing some POSTROUTING/MASQUERADING out through
eth0, that isn't wasn't possible.
I'm not an expert with iptables so I'm seeking some advice and help.

Thanks
Tony


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


