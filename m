From: <peter.gehle@sbgit.com>
Subject: connection to vpn Server (pptp) behind iptables FW
Date: 12 Mar 2004 09:40:22 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000F700002A12@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

Hi,

since two weeks i try to create rules for my iptables fw who
let pass an vpn tunnel to my internel ms vpn server (pptp).
i have installed the kernel 2.4.25 and patched it with patch-o-matic (only the 
pptp/gre patch aplied).

i load the ip_conntrack_pptp, ip_conntrack_proto_gre, ip_nat_pptp and ip_nat_proto_gre modules,
and my script looks so:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT --to-destination 192.168.1.2
iptables -A FORWARD -i eth0 -m state --state NEW -p tcp -d 192.168.1.2 --dport 1723 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state NEW -p GRE  -d 192.168.1.2 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p GRE -j DNAT --to-destination 192.168.1.2
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I FORWARD 1 -m state --state ESTABLISHED,RELATED -j ACCEPT

So whats wrong, becaus i can connect to the vpn server behind the firewall, but the 
connection hangs at the authentification. after some minutes i receive an message that
the server does not respond.

netstat say this:
netstat-nat -d 192.168.1.2 
Proto NATed Address Foreign Address State 
tcp p42821a5e.dip.t-dialin.ne:4394 192.168.1.2:1723 ESTABLISHED 
tcp p42821a5e.dip.t-dialin.ne:4392 192.168.1.2:1723 TIME_WAIT

Scheme of my network:
vpn-client -> hw-router -> internet -> hw-router -> firewall -> vpn-server

so whats going wrong?

Thanx Peter


