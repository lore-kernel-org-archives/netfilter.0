From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Counter broken in Fedora Core 1
Date: Sun, 30 Nov 2003 12:26:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070213194.10226.10.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Started testing some Fedora Core 1 stuff, found that the counter
is misbehaving for one line of my test input chain. The weird part
is if I originate icmp echo from the Fedora Core 1 box, the replies
do hit the counter, but no tcp or udp packets increment the counter
field.

rpm -q iptables
iptables-1.2.8-13
rpm -q kernel
kernel-2.4.22-1.2115.nptl

Opened up a bug report with Redhat as well.
Below is the test setup I am using, and yes I know I am not applying the
logging :-)

:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
COMMIT
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A POSTROUTING -o eth0 -j MASQUERADE
COMMIT
*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:dropwall - [0:0]
:firewall - [0:0]
:silent - [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth1 -j ACCEPT
-A INPUT -s 121.246.124.242 -j ACCEPT (Counter broken)
-A INPUT -s 66.121.212.96/255.255.255.224 -j ACCEPT
-A INPUT -s 38.113.7.102 -j ACCEPT
-A INPUT -i cipcb0 -j ACCEPT
-A INPUT -i cipcb1 -j ACCEPT
-A INPUT -i cipcb2 -j ACCEPT
-A INPUT -p icmp --icmp-type any -j ACCEPT
-A INPUT -p 50 -j ACCEPT
-A INPUT -p 51 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 53 -j ACCEPT
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -s 192.168.21.16/255.255.255.248 -i eth0 -j DROP
-A dropwall -m limit --limit 15/min -j LOG --log-prefix "Dropwall:"
-A dropwall -j DROP
-A firewall -m limit --limit 15/min -j LOG --log-prefix "Firewall:"
-A firewall -j DROP
-A silent -m limit --limit 15/min -j LOG --log-prefix "Silent:"
-A silent -j DROP
COMMIT


Ted


