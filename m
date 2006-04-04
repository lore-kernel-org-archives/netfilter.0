From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: DNAT/port forward to PPTP server does not work
Date: Tue, 04 Apr 2006 14:12:06 -0700
Message-ID: <BAY106-F22DA5843DEAC8FF83CDC82D6CA0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Howdy,

Summary: Am I doing something wrong or does iptables not support having a 
PPTP server behind the firewall where DNAT/port forwarding is required?

I am unable to get PPTP clients to successfully connect to my PPTP server 
that resides behind my iptables/netfilter firewall.  As a test, I tried the 
reverse - having a PPTP client behind the firewall connect to an external 
PPTP server - and that works fine.

So this...

WAN PPTP client -> DNAT -> LAN PPTP server

...is no good but this...

LAN PPTP client -> SNAT -> WAN PPTP server

...works.

For the failed DNAT/port forward case, what I see in network traces taken on 
both the WAN and LAN sides is that the call ID of the server in GRE packets 
from the WAN PPTP client are valid on the WAN side but are erroneously 
showing up as 0 on the LAN side to the PPTP server.  The PPTP server does 
not send any replies and I am guessing that the bad call ID is the reason.

The relevant rules I am using for PPTP/GRE to (try to) allow PPTP clients to 
connect to the PPTP server behind the firewall:

iptables -t nat -A PREROUTING -i $EXTIF -p tcp --dport 1723 -j DNAT --to 
$PPTPSERVER
iptables -t nat -A PREROUTING -i $EXTIF -p 47 -j DNAT --to $PPTPSERVER

iptables -t filter -A -j ACCEPT -m state --state RELATED,ESTABLISHED
iptables -t filter -A FORWARD -i $EXTIF -o $LANIF -d $PPTPSERVER -p tcp 
--dport 1723 -j ACCEPT
iptables -t filter -A FORWARD -i $EXTIF -o $LANIF -d $PPTPSERVER -p 47 -j 
ACCEPT

$EXTIF is the name of the interface from which PPTP clients are trying to 
connect through the firewall to the PPTP server on $LANIF, the interface to 
the local network.

$PPTPSERVER is the IP address of the PPTP server that resides on the local 
network.

Versions:
o Kernel 2.4.20
o ip_conntrack_pptp, ip_nat_pptp, ip_conntrack_proto_gre, ip_nat_proto_gre 
are all loaded, their source says they are rev 1.11.

Miscellaneous observations:
o A "TODO" comment at the top of ip_nat_pptp.c says: "Support other NAT 
scenarios than SNAT of PNS".
o I added the DNAT rule for GRE above to see if it helped.  Initially I was 
using only a DNAT rule for TCP port 1723 as that is what the example given 
in the text for the PPTP patch on the netfilter site said, to wit:

"The GRE connection is marked as RELATED to the TCP session on port 1723, so 
all
you need is something like

iptables -j ACCEPT -m state --state RELATED,ESTABLISHED
iptables -j ACCEPT -d my_pptp_server -p tcp --dport 1723 -m state --state 
NEW"

o Under "limitations" in that same verbiage appears the warning, "can only 
NAT connections from PNS to PAC" but I am not clear on how PNS and PAC map 
to PPTP clients and servers (are PNS and client equivalent?).

Thank you,

- Andrew

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


