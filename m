From: Adam Majer <adamm@galacticasoftware.com>
Subject: DNAT forwarding problems
Date: Wed, 04 Aug 2004 17:44:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411166D5.30105@galacticasoftware.com>
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

Hi all,

I'm not subscribed to the list so please cc me any replies. Thank you.

I seem to have a major problem with DNAT. The setup is as follows,

external IP addresses: [A], [B]
internal IP address: [C] - not the NAT box

I want all udp port 53 traffic from [A]->[C] and from [B]->[C]. So I set
up the following rules

iptables -t nat -N dns-forward
iptables -t nat -A dns-forward -p udp --dport 53 -j DNAT --to-dest [C]
iptables -t nat -A PREROUTING -i A_interface -j dns-forward
iptables -t nat -A PREROUTING -i B_interface -j dns-forward

and in the packet table I set up forwarding as

itpables -P FORWARD DROP
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -N dns
iptables -A dns -d [C] -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -j dns


When a packet comes over interface [A], (also the default route), it
hits the PREROUTING chain, gets forwarded to [C] and then goes though
FORWARD and gets to the DNS server.

When the packet comes over interface[B], it also gets to the PREROUTING
chain, but it never gets to the FORWARD chain and thus never even gets
to [C]. It just dissapears into thin air. My routing seems correct..

The routing is setup with the iproute2 tool. There are rule tables the
specify correct paths for packets from interface_A and interface_B to
all other interfaces and proper default routes (so that packets from B
go back though B). The only difference is that [A] is also the default
route in the default rule table. I can get from internal network D to C
as it does not go though DNAT.

Any ideas? Can someone reproduce this problem?

- Adam

PS. kernel 2.6.7, iptables 1.2.9

-- 
Building your applications one byte at a time
http://www.galacticasoftware.com



