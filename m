From: Boingo <b0ing0@yahoo.com>
Subject: PPTP and NAT
Date: Wed, 28 Apr 2004 09:22:42 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040428162242.44965.qmail@web80505.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,
    I had RH9 (default out of box) installed.  I could
do everything I needed to on iptables except get
outside connections to our internal Win2k PPTP server
to work.  So I went and got the kernel source (2.4.26)
from kernel.org and patched it with CVS patch-o-matic
(CVS date: April 27, 2004).  I only added patches
related to PPTP (ipv4 only).  Recompiled and booted
into the new kernel.
 
    Now even my old port forwards to internal nat'ed
servers wont work.  When restarting iptables I get an
"iptables-restore: line X failed" (with X being the
actual line number).  If I take out that line, then it
errors on a different line.  It continues like this,
until all the line with PREROUTING or POSTROUTING are
removed.  These lines (minus the PPTP ones) all worked
fined before the patch/recompile.  I have included my
iptables file below, external ip is 1.2.3.4 (real ip
changed to protect the innocent).  All the entries in
the nat table worked before the patch.  Can anyone
shed light on this issue?  Thanks in advance for any
help you can provide.
 
 
 
*nat
:OUTPUT ACCEPT [0:0]
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o eth0 -s 192.168.10.0/24 -d 0/0 -j
MASQUERADE
-A POSTROUTING -d 192.168.10.1 -j SNAT --to
192.168.10.3
-A POSTROUTING -d 192.168.10.2 -j SNAT --to
192.168.10.3
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 25 -j
DNAT --to-destination 192.168.10.2:25
-A PREROUTING -p udp -m udp -d 1.2.3.4 --dport 47 -j
DNAT --to-destination 192.168.10.1:47
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 80 -j
DNAT --to-destination 192.168.10.2:80
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 99 -j
DNAT --to-destination 192.168.10.2:99
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 110 -j
DNAT --to-destination 192.168.10.2:110
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 1723 -j
DNAT --to-destination 192.168.10.1:1723
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 1974 -j
DNAT --to-destination 192.168.10.2:1974
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 1975 -j
DNAT --to-destination 192.168.10.2:1975
-A PREROUTING -p tcp -m tcp -d 1.2.3.4 --dport 3389 -j
DNAT --to-destination 192.168.10.1:3389
COMMIT
*mangle
:PREROUTING ACCEPT [92:7225]
:INPUT ACCEPT [92:7225]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [92:7225]
:POSTROUTING ACCEPT [92:7225]
COMMIT
*filter
:FORWARD DROP [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -i eth1 -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -s 1.2.3.4 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.2 -i eth0
--dport 25 -j ACCEPT
-A FORWARD -p udp -m udp -d 192.168.10.1 -i eth0
--dport 47 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.2 -i eth0
--dport 80 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.2 -i eth0
--dport 99 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.2 -i eth0
--dport 110 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.1 -i eth0
--dport 1723 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.2 -i eth0
--dport 1974 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.2 -i eth0
--dport 1975 -j ACCEPT
-A FORWARD -p tcp -m tcp -d 192.168.10.1 -i eth0
--dport 3389 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 10000 -j ACCEPT
-A FORWARD -i eth1 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i eth0 -m state --state
ESTABLISHED,RELATED     -j ACCEPT
-A FORWARD -p tcp -d 192.168.10.1 --dport 1723 -m
state --state NEW -j ACCEPT
COMMIT

