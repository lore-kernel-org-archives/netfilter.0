From: Wouter Vanwalleghem <wouter@belnet.be>
Subject: Unable to stop tunnel from being "connection-tracked"
Date: 02 Oct 2003 13:10:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065093009.24289.193.camel@wouter.fw.belnet.be>
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
To: netfilter@lists.netfilter.org

hi all,

I have setup a 6-in-4 tunnel which is giving me head-aches.
FYI, I use kernel 2.4.21 and iptables 1.2.8.

As soon as I start using the tunnel the output of "cat
/proc/net/ip_conntrack" shows a protocol 41 connection between my
firewall and the IPv4 PoP of the tunnelbroker. 
OK so far. 

But if I then stop using the tunnel, above-mentioned connection
disappears from the connection tracking table after 600 seconds.
Normal behaviour.

Thing is that the tunnel "dies" as soon as the connection has
disappeared from the connection tracking table.

After some research I followed a suggestion to keep the tunnel from
being connection tracked.
However, the following iptables rules do not prevent the tunnel from
popping up in the connection tracking table:


#####------------ IPv6 tunnel to SixXS-----
iptables -A INPUT -p 41 -s tunnelserver.concepts-ict.net -j ACCEPT
iptables -A OUTPUT -p 41 -d tunnelserver.concepts-ict.net -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -s
tunnelserver.concepts-ict.net -j ACCEPT
iptables -t nat -A POSTROUTING --protocol ! 41 -s 192.168.100.0/24 -o
ppp0 -j MASQUERADE

The ip6tables tables are all empty and all policies are set to ACCEPT.
I cannot do without the MASQUERADE'ing rule because I still want my LAN
to have connectivity.

Anybody have a clue?

TIA

kind regards,

Wouter



