From: Wolfgang Lonien <wolfgang@lonien.de>
Subject: SNMP through VPN?
Date: Thu, 01 Dec 2005 13:20:35 +0100
Message-ID: <438EEA93.10000@lonien.de>
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

Hi list,

I have an issue, and I think it's because of my linited knowledge of
iptables. The scenario:

linuxbox1---router1=====(IPSecTunnel)=====router2---linuxbox2
192.168.x.0/24============================10.a.b.0/24

I want to set up monitoring using SNMP. I *can* do this from linuxbox1
to linuxbox2 and vice versa, but not from linuxbox1 to router2 (internal
interface) or from linuxbox2 to router1 (internal interface). All other
services like ICMP or TCP (ssh) work in both directions, as do SNMP
requests from the internal side to the internal interfaces of the routers.

In the firewall rules of router1, I added:
iptables -I forwarding_rule -p all -s 10.a.b.0/24 -d 192.168.x.0/24 -j
ACCEPT
iptables -I forwarding_rule -p all -s 192.168.x.0/24 -d 10.a.b.0/24 -j
ACCEPT

to allow all traffic in both directions. I tried the same with input and
output and as the interface ipsec+, but still no luck. I can SNMP-query
devices *behind* the routers, but not the routers themselves.

What am I doing wrong?

kind regards,
wjl aka Wolfgang Lonien
www.lonien.de

-- 
Key ID 0x728D9BD0 - public key available at wwwkeys.de.pgp.net
'94 Honda NTV still running on fuel -
everything else here proudly runs Debian GNU/Linux

