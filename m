From: SoulBlazer <soul@lamp-post.net>
Subject: PPTP/GRE + Newnat Issues
Date: Wed, 12 Jun 2002 19:53:25 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020613000213.6C95F4490@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hey List,

I've been having a problem getting PPTP/GRE (ms-vpn) sessions to work 
properly using netfilter cvs (06/12/2002) and a 2.4.19-pre10 kernel (please 
note I have tried the following with a vanilla 2.4.18 kernel as well to which 
the same results have occurred).

After applying the newnat and pptp patches to my kernel I compile with the 
following :

CONFIG_IP_NF_CT_PROTO_GRE=y
CONFIG_IP_NF_PPTP=y

(I also have standard iptables options allowing for nat enabled)

After a recompile and reboot, I create the following rule for a winXP 
workstation on my LAN:

iptables -t nat -A POSTROUTING -s 192.168.12.19 -j SNAT --to 64.119.104.135

I then verify connectivity on the winXP box via the ping command and 
subsequent web browsing; all which yield success.

I then attempt to use the VPN adapter in Network places and it appears to 
work however gets stuck at the 'Verifying username/password' (the l/p is 
correct btw).  I go on the linux firewall and open up tcpdump to which I am 
getting the following:

my.ext.addr.1081 > remote.vpn.server.1723: tcp 0 (DF)
remote.vpn.server.1723 > my.ext.addr.1081: tcp 0
my.ext.addr.1081 > remote.vpn.server.1723: tcp 156 (DF)
remote.vpn.server.1723 > my.ext.addr.1081: tcp 156
my.ext.addr.1081 > remote.vpn.server.1723: tcp 168 (DF)
remote.vpn.server.1723 > my.ext.addr.1081: tcp 32
remote.vpn.server > my.ext.addr: gre-proto-0x880B (gre encap)
my.ext.addr > remote.vpn.server: icmp: my.ext.addr protocol 47 unreachable 

I have a feeling the pptp/gre support does not like being built internally 
opposed to modularly, so I recompile them as modules and attempt again.

With the same rules and the following loaded as modules :

Module                  Size  Used by
ip_nat_proto_gre        1248   0  (unused)
ip_conntrack_pptp       2352   1  (autoclean)
ip_nat_pptp             1712   0  (unused)
ip_conntrack_proto_gre    1952   0  [ip_conntrack_pptp ip_nat_pptp]


I again try to establish a vpn connection .. and again I get the same 
protocol 47 unreachable messages.

Any ideas ?

