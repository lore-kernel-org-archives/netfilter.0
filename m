From: Richard Mueller <mueller@teamix.net>
Subject: Strange netfilter/iproute behav.
Date: Sat, 7 Dec 2002 23:01:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11126858610.20021207230114@teamix.net>
Reply-To: Richard Mueller <mueller@teamix.net>
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

Hello netfilter developers,

Some strange things are happening, when I try to use routing decisions
based on fwmark.

A short dump should explain it better than I can do with my bad english
skills ;) :

[DUMP ON]
host:~# ip rule add fwmark 19 lookup inet
host:~# iptables -t mangle -F
host:~# iptables -t mangle -A OUTPUT -j MARK --set-mark 19
host:~# ip route flush cache
host:~# ping www.heise.de # <- Should work because a defgw is set inet
PING www.heise.de (193.99.144.71): 56 data bytes

--- www.heise.de ping statistics ---
3 packets transmitted, 0 packets received, 100% packet loss
host:~# ip rule del fwmark 19 lookup inet
host:~# iptables -t mangle -F
host:~#
host:~# ip rule add fwmark 1 lookup inet
host:~# iptables -t mangle -A OUTPUT -j MARK --set-mark 1
host:~# ip route flush cache
host:~# ping www.heise.de  # <- Works as fwmark 19 should do
PING www.heise.de (193.99.144.71): 56 data bytes
64 bytes from 193.99.144.71: icmp_seq=0 ttl=243 time=5.2 ms

--- www.heise.de ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max = 5.2/5.2/5.2 ms
host:~#
host:~# ip rule ls
0:      from all lookup local
32765:  from all fwmark        1 lookup inet
32766:  from all lookup main
32767:  from all lookup default
host:~# ip route show
172.16.0.0/16 dev eth0  proto kernel  scope link  src 172.16.90.5
172.17.0.0/16 via 172.16.254.254 dev eth0
default via 172.16.1.1 dev eth0
host:~# ip route show table inet
172.16.0.0/16 dev eth0  proto kernel  scope link  src 172.16.90.5
default via 172.16.254.254 dev eth0
host:~#
host:~# cat /proc/version
Linux version 2.4.20 (root@host) (gcc version 2.95.4 20011002 (Debian prerelease)) #7 SMP Sat Dec 7 19:59:45 CET 2002
host:~# iptables -v
iptables v1.2.7a: no command specified
Try `iptables -h' or 'iptables --help' for more information.
host:~# iptables --version
iptables v1.2.7a
host:~#

[DUMP OFF]

I am running iptables v.1.2.7a compiled against the running kernel.
A "iptables -t mangle -L -v" shows that the rule applies.
No patch'o'matic is used.

I have no idea what I have done wrong and  the  workaround  (by  using
"1") isn't really a good idea because is need plenty ( > 10) of fwmark
targets.

If this is a beginner's problem please say something like
# man iptables

Thanks a lot

Richard

-- 
Richard Mueller     mailto:mueller@teamix.net  Fon: +49 9171 896287
Teamix GmbH         http://www.teamix.de       Fax: +49 9171 896286


