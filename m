From: Charlie Reitsma <reitsmac@denison.edu>
Subject: Limiting number of connections
Date: Tue, 07 Jan 2003 11:26:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1AFFA5.8040207@denison.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

the iplimit patch applies easiest to protocol tcp...it leaves out udp. 
On my firewall the clients who are creating 200+ connections are using 
udp. I've seen examples of iplimit for udp but attempts to use
iptables -A INPUT -p udp -m iplimit --iplimit-above 80 -j DROP
results in "invalid argument." Being able to look at the connection 
table and limiting each source address to some number of entries is more 
like what one would expect of a module that limits the number of 
connections any client may create. I agree with Daniel that a script 
that adds/remove drop rules would work. Perhaps the script could make 
use of the "recent" module as discussed at 
http://www.stearns.org/doc/adaptive-firewalls.v0.1.html

Charlie
--------------
Alex wrote:
I presume this is exactly what you are asking?

From... patch-o-matic/base/iplimit.patch.help

Author: Gerd Knorr <kraxel@bytesex.org>
Status: ItWorksForMe[tm]

This adds CONFIG_IP_NF_MATCH_IPLIMIT match allows you to restrict the
number of parallel TCP connections to a server per client IP address
(or address block).

Examples:

# allow 2 telnet connections per client host
iptables -p tcp --syn --dport 23 -m iplimit --iplimit-above 2 -j REJECT

# you can also match the other way around:
iptables -p tcp --syn --dport 23 -m iplimit ! --iplimit-above 2 -j
ACCEPT

# limit the nr of parallel http requests to 16 per class C sized
# network (24 bit netmask)
iptables -p tcp --syn --dport 80 -m iplimit --iplimit-above 16		\
	--iplimit-mask 24 -j REJECT

Good luck - Alex.

On Fri, 2003-01-03 at 16:47, Daniel Fenert wrote:
 > Is there a simple way to limit number of connection coming from 
particular
 > client (ip address or subnet)?
 > I've searched through archive, and found only some patch to CVS version
 > of netfilter (it was year 2000)...
 >
 > I've got problem with a few clients, they' are able to make 200+
 > connections on 128Kbit connection (according to /proc/net/ip_conntrack)
 >
 > I thought about it today for a few minutes, and came with the idea:
 > 1) Parse /proc/net/ip_conntrack and get clients with more than xxx
 >    connections
 > 2) Setup rule to DROP NEW,RELATED to force them to close some connections
 > 3) wait a minute, go to 1) checking additionally number of connections
 >    for blocked IP's. If number drops below xxx, delete rule DROP NEW,...
 > This is ugly, but possibly will work.
 >
 > I hope that  there's better way to do it?


