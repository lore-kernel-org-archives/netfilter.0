From: Jan Kirchhoff <kirchy@gmx.de>
Subject: Special routing for incoming pop3-requests
Date: Fri, 05 Sep 2003 18:35:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F58BB42.20306@gmx.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am new to this List and I'm not really sure if this is really an 
iptables-issue, but I think iptables is the tool I need for this:

We have a server (server1) that acts as mailserver, fileserver, 
nameserver and default gateway for the intranet. We have 2 
internet-connections (isp1 with dynamic IP, isp2 with static IPs), each 
with a firewall (fw1, fw2).

server1 has a default route on fw1 and a special route for certain IPs 
(our servers) on fw2. This way all workstations only use server1 as 
gateway and automatically get their packets routed through the right isp.

There is a port-forwarding on fw2 that redirects external pop3-requests 
to the pop3-daemon on server1 (for employees that check their mail from 
home). This does not work when the default route on server1 is pointing 
to fw1 since it sends the responses for the packets that were originally 
received via isp2 to isp1. It works as soon as I change the default 
route on server1 to fw2, but this doesn't make sense since I want all 
traffic on isp1 except the connections that go our own servers.

How do I get to work (with iptables-rules on server1?), that all packets 
from server1 port 110 that have a destination other than the LAN go out 
on fw2 but all other traffic goes to fw1?
I need a special route based on source-ip and source-port. I do not want 
to rewrite the destination ip (which would not help since its already 
right) but have influence on the routing to the next gateway.

Any help would be great, I couldn't find anything in howtos or tutorials 
but I also think this is not really a common question...
If I'm wrong and iptables is the wrong tool please let me know any ideas 
on how to solve that problem.

Jan


