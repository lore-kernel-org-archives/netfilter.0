From: zanoic <zanoic@bigfoot.com>
Subject: iptables SNAT quiestions (+)
Date: Wed, 29 Oct 2003 11:46:54 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053710435.20031029114654@bigfoot.com>
Reply-To: zanoic <zanoic@bigfoot.com>
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

Hi there,

  I'm setting up inet access for W2k LAN comps and W2k "external"
  client. Get success with LAN's (int.) clients (inet, e-mail) and
  e-mail for ext. client. Get success with ext.client <=> int.server
  link (routing based). Stucked with inet access for ext. client.
  Here some questions:
  1. Can iptables SNAT packets from ext. iface (eth0) to the same ext.
iface (eth0)? Some kind'a looping 'em back with NAT.
  2. If yes, why doesn't my config (posted bellow) work?
  3. If no, is where any way to make it possible (may be using fake
ifaces, like lo)?
  Actually, there may be other ways to solve the problem of inet
access for ext. client through my router. I need such kind'a config,
'cause it gives me abilities to control the traffic, and hides client
from inet crackers.
  Here's my config:
distro:   RH 7.2 (updated with up2date)
kernel:   2.4.22-ac1
iptables: 1.2.8
squid:    2.4.STABLE6
eth0   pu.bl.ic.ip/30
eth0:1 10.0.0.1/30    (ext.client IP: 10.0.0.2/30,    default GW:
10.0.0.1)
eth1   192.168.0.1/24 (int.client IP: 192.168.0.x/24, default GW:
192.168.0.1)
eth1:1 10.0.0.5/30    (int.server IP: 10.0.0.6/30,    default GW:
10.0.0.5)
Kernel IP routing table:
Destination Gateway     Genmask           Flg M  Ref Use Iface
pu.bl.ic.0  0.0.0.0     255.255.255.252   U   0  0    0  eth0
10.0.0.0    0.0.0.0     255.255.255.252   U   0  0    0  eth0
192.168.0.0 0.0.0.0     255.255.255.0     U   0  0    0  eth1
10.0.0.4    0.0.0.0     255.255.255.252   U   0  0    0  eth1
127.0.0.0   0.0.0.0     255.0.0.0         U   0  0    0  lo
0.0.0.0     pu.bl.ic.gw 0.0.0.0           UG  0  0    0  eth0
iptables rules:
Chain INPUT (policy DROP)
target   prot opt in     out  source           destination
ACCEPT   all  --  lo     *    0.0.0.0/0        0.0.0.0/0
DROP     all  --  *      *    0.0.0.0/0        0.0.0.0/0    state INVALID
ACCEPT   all  --  eth1   *    192.168.0.0/24   0.0.0.0/0
ACCEPT   all  --  eth1   *    10.0.0.4/30      0.0.0.0/0
ACCEPT   all  --  *      *    0.0.0.0/0        0.0.0.0/0    state ESTABLISHED
ACCEPT   all  --  eth0   *    0.0.0.0/0        0.0.0.0/0    state RELATED
CHECK   !icmp --  eth0   *    0.0.0.0/0        0.0.0.0/0    state NEW
CHECK    icmp --  eth0   *    0.0.0.0/0        0.0.0.0/0    state NEW limit: avg 10/sec burst 50
Chain FORWARD (policy DROP)
target     prot opt in   out  source           destination
TCPMSS     tcp  --  *    *    0.0.0.0/0        0.0.0.0/0    tcp flags:0x06/0x02 TCPMSS clamp to PMTU
DROP       all  --  *    *    0.0.0.0/0        0.0.0.0/0    state INVALID
ACCEPT     all  --  *    *    0.0.0.0/0        0.0.0.0/0    state ESTABLISHED
ACCEPT     all  --  *    *    0.0.0.0/0        0.0.0.0/0    state RELATED
ACCEPT     all  --  eth1 *    10.0.0.4/30      0.0.0.0/0    state NEW
ACCEPT     all  --  eth1 *    192.168.0.0/24   0.0.0.0/0    state NEW
DROP       all  --  eth0 *    10.0.0.0/30      192.168.0.0/24
ACCEPT     all  --  eth0 *    10.0.0.0/30      0.0.0.0/0    state NEW
Chain OUTPUT (policy ACCEPT)
target     prot opt in   out  source           destination
TCPMSS     tcp  --  *    *   !10.0.0.0/29     !10.0.0.0/29  tcp flags:0x06/0x02 TCPMSS clamp to PMTU
DROP       all  -f  *    eth1 0.0.0.0/0        0.0.0.0/0
Chain CHECK (2 references)
target     prot opt in   out  source           destination
DROP       tcp  --  *    *    0.0.0.0/0        0.0.0.0/0    tcp dpt:0
DROP       udp  --  *    *    0.0.0.0/0        0.0.0.0/0    udp dpt:0
ACCEPT     icmp --  *    *    10.0.0.0/30      0.0.0.0/0    icmp type 3 limit: avg 10/sec burst 5
ACCEPT     icmp --  *    *    10.0.0.0/30      0.0.0.0/0    icmp type 4 limit: avg 10/sec burst 5
ACCEPT     icmp --  *    *    10.0.0.0/30      0.0.0.0/0    icmp type 11 limit: avg 10/sec burst 5
ACCEPT     icmp --  *    *    10.0.0.0/30      0.0.0.0/0    icmp type 12 limit: avg 10/sec burst 5
ACCEPT     icmp --  *    *    10.0.0.0/30      0.0.0.0/0    icmp type 8 limit: avg 5/sec burst 5
ACCEPT     icmp --  *    *    10.0.0.0/30      0.0.0.0/0    icmp type 0 limit: avg 5/sec burst 5
ACCEPT     all  --  *    *    10.0.0.0/30      0.0.0.0/0
DROP       tcp  --  *    *    0.0.0.0/0        0.0.0.0/0    tcp flags:!0x16/0x02
DROP       all  --  *    *    0.0.0.0/0        0.0.0.0/0
Chain PREROUTING (policy ACCEPT)
target     prot opt in   out  source           destination
REDIRECT   tcp  --  eth1 *    192.168.0.0/24   0.0.0.0/0    tcp dpt:80 redir ports 3128
REDIRECT   udp  --  eth1 *    192.168.0.0/24   0.0.0.0/0    udp dpt:80 redir ports 3128
REDIRECT   tcp  --  eth0 *    10.0.0.0/30     !10.0.0.0/29  tcp dpt:80 redir ports 3128
REDIRECT   udp  --  eth0 *    10.0.0.0/30     !10.0.0.0/29  udp dpt:80 redir ports 3128
Chain POSTROUTING (policy ACCEPT)
target     prot opt in   out  source           destination
TCPMSS     tcp  --  *    *    0.0.0.0/0        0.0.0.0/0    tcp flags:0x06/0x02 TCPMSS clamp to PMTU
SNAT       all  --  *    eth0 192.168.0.0/24   10.0.0.2     to:10.0.0.1
SNAT       all  --  *    eth0 192.168.0.0/24  !10.0.0.0/29  to:pu.bl.ic.ip
SNAT       all  --  *    eth0 10.0.0.2        !10.0.0.0/29  to:pu.bl.ic.ip
Chain OUTPUT (policy ACCEPT)
target     prot opt in   out  source           destination

squid.conf (some lines):
http_port 3128
cache_mem  100 MB
acl localhost src 127.0.0.1/255.255.255.255
acl lan src 192.168.0.0/255.255.255.0
acl client src 10.0.0.0/255.255.255.252
http_access allow localhost
http_access allow lan
http_access allow client
http_access deny all
miss_access allow all
httpd_accel_host virtual
httpd_accel_port 80
httpd_accel_with_proxy on
httpd_accel_uses_host_header on

  I'll appreciate any help.
  Thank's a lot.
  DENim



