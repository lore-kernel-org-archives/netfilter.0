From: "Philipp Stader" <me@ph1l.de>
Subject: RE: NATing PPTP GRE traffic
Date: Tue, 20 Jan 2004 15:37:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Aix0Q-0000Aw-RQ@vishnu.netfilter.org>
References: <00b901c3df5f$52597f30$686fa8c0@vincent>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00b901c3df5f$52597f30$686fa8c0@vincent>
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
Cc: 'Derek Vincent' <derek.vincent@kemikal.net>

 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Derek Vincent
> Sent: Tuesday, January 20, 2004 3:12 PM
> To: netfilter@lists.netfilter.org
> Subject: NATing PPTP GRE traffic
> 
> I have been try to setup a firewall that will pass PPTP/L2TP 
> traffic to a windows 2003 server inside the network...
> 
> I am using Mandrake 9.2 with the 2.4.22-10mdksecure 
> (delivered) kernel.
> 
> I believe that I have shorewall configured correctly  rules below:
> 
> DNAT:info       net     loc:192.168.105.1       tcp     1701    -
> DNAT:info       net     loc:192.168.105.1       udp    1701    -
> DNAT:info       net     loc:192.168.105.1       tcp     1723    -
> DNAT:info       net     loc:192.168.105.1       47      -       -
> 
> and I am loading the following netfilter modules for natting pptp:
> 
> ip_nat_pptp
> ip_conntrack_pptp
> ip_nat_proto_gre
> ip_conntrack_proto_gre
> 
> The issue I am having is the when I try to VPN in to the 
> nated windows server things seem to go ok for the initial 
> communication but I get the error below:
> 
> protocol 47 unreachable [tos 0xc0]
> 
> After this occurs a half dozen times the vpn client errors out.
> 
> I had found a googled message regarding something similar 
> with the 2.4.22 kernel and tried to the patch-o-matic on it 
> and I suspect that the mandrake 2.4.2-10mdk already has this 
> issue patched since I did not see any patches that discussed 
> this issue...
> 
> I was wondering if there is anything I have missed in the FW 
> rules or if I am missing load a module...
> 
> 
> Cheers and the for any help,
> 
> D.
> 

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT
--to-destination 192.168.200.99 
iptables -A FORWARD -i ppp0 -m state --state NEW -p tcp -d 192.168.200.99
--dport 1723 -j ACCEPT 

iptables -A FORWARD -i ppp0 -m state --state NEW -p 47 -d 192.168.200.99  -j
ACCEPT 
iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to-destination
192.168.200.99

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

This works for me. PPTP Connections. We didn't try anything else. The Box is
running Debian Woody with ADSL Internet connection. Kernel is unpatched as
nobody on the LAN needs VPN Connections to connect anywhere else.
192.168.200.99 is our Windows 2003 Server.

Hope that helps

Kind regards

Phil


