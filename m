From: Peter Johnson <peter@thejohnsons.com.au>
Subject: IPTables Port Forwarding Problem
Date: 16 Jan 2003 10:28:14 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042673295.2092.39.camel@wizardslair>
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
To: Netfiler E-Mail List <netfilter@lists.netfilter.org>


Hi all,

I am having a problem with port forwarding. From what I can gather the
packet is dropped just after the DNAT rule.

My config is such that I have 3 interfaces:
eth0 - external internet connection
eth1 - internal LAN
dot  - GRE Tunnel

All SMTP, DNS, HTTP etc traffic comes in on the dot interface (and hence
should also go out it).
All LAN traffic is NAT'ed out the eth0 interface.
Only routing and related/established traffic is allowed in on the
external interface.

In trying to diagnose this problem I made the first line in each
built-in rule (including mangle table rules) a LOG rule. As this would
generate substantial traffic I restricted this to HTTP traffic in
general.

From what I can see once the packet has been DNAT'ed it disappears but
all internal traffic which is MASQ'ed does 
NAT PREROUTE -> MANGLE PREROUTE -> MANGLE FORWARD -> FILTER FORWARD ->
MANGLE POSTROUTE -> NAT POSTROUTE -> NAT OUTPUT

but internal HTTP on the dot (tunnel) interface does:

MANGLE PRE-HTTP: IN=dot OUT= PROTO=TCP SPT=45576 DPT=80 
NAT    PRE-HTTP: IN=dot OUT= PROTO=TCP SPT=45576 DPT=80 
NAT    DNAT-HTTP: IN=dot OUT= PROTO=TCP SPT=45576 DPT=80
then silence (well actually repeat)

Running `netstat -tupan` on the internal box (where the packet should be
forwarded) show no new connections on port 80. However, I am not sure if
a full handshake is required for a connection to be "established" or
not. If this is the case then all I can think of is that the response is
not travelling back properly.

tcpdump shows no SYN packets to port 80 hitting the internal box.

I would be greatly appreciative of any thoughts that people may have on
how to fix this.

Thanks in advance.

PJ



-- 

Adding manpower to a late software project makes it later.



