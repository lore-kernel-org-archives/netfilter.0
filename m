From: "Nick Bashev" <nick@bashev.com>
Subject: vpn+nat+routing
Date: Fri, 7 Jun 2002 22:21:19 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001b01c20e93$2d890110$0264a8c0@laptop>
References: <1103.24.168.132.35.1023470174.squirrel@mail.vistawiz.com> <3D010135.2070706@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello,
I have strange problem. I have VPN channel on my server for my internet
connection, I have peering network with other providers. I use iproute2 to
to get to my peering. everything looks nice. But since i want to implement
transparen proxy to my server i can make outgoing connections with only one
ip address the one from my VPN. So using proxy I'm loosing my iproute2
settings. All I need to know is can I use netfilter to masq my outgoing
proxy IP with the one from my peering interface so the iproute2 setting does
not forward the request trough my VPN. Does any body know what comes first
routing or netfilter and when i'm going to masq my outging packet from local
interface. Where i have to do the masq. Is there any chanse that i can mask
before entering the iproute2 rules.

I tried to find information on that but i got lost in docs,
Any help will be appreciated

BTW, on my rh7.1 kernel 2.4.18
mppe patched
iptables 1.2.7 from the cvs
including h323
compiles like a charm.10x guys for the awesome job.

Regards,
Nick
P.S. Sorry for my english.


