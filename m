From: amateurguy@telus.net
Subject: iptables / FTP masquerading: Port command illega
Date: Wed, 23 Mar 2005 07:12:58 -0800
Message-ID: <1111590778.4241877a4e631@webmail.telus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Everyone,

I finally got my FTP server working on my Red Hat 9 Linux firewall box. For 
some reason, I could only get it to work on a port other than 21. I elected for 
port 29 and changed /etc/services ftp entry and my firewally rules accordingly. 
For some reason, if I change back to 21, no response sent by ftp server to syn 
pkt from client ftp. If anyone has any ideas why it works on any other port 
than 21, please let me know.

Anyways, i got passive mode ftp to work on this box. However, active mode 
fails. and it complains:
ftp> dir
500 Illegal PORT command.
ftp: bind: Address already in use

When i look at the packets, I see the client sending a Port cmd using its non-
routable IP. This then passes through a firewall, and the source IP gets 
translated to a public IP. Then hits my Linux firewall and I the vsftpd process 
it and sends back that Illegal port response.

My firewall is using DHCP over my DSL connection. Hence I am using MASQUERADING 
in iptables:

-A POSTROUTING -o eth1 -j MASQUERADE

modules in memory are:

ip_conntrack_ftp 5296 1 (autoclean)
ip_nat_ftp 4112 0 (unused)
iptable_mangle 2776 0 (autoclean) (unused)
ipt_MASQUERADE 2200 1 (autoclean)
iptable_nat 21720 2 (autoclean) [ip_nat_ftp ipt_MASQUERADE]
ipt_state 1048 10 (autoclean)
ip_conntrack 26976 3 (autoclean) [ip_conntrack_ftp ip_nat_ftp ipt_MASQUERADE 
iptable_nat ipt_state]
iptable_filter 2412 1 (autoclean)
ip_tables 15096 7 [iptable_mangle ipt_MASQUERADE iptable_nat ipt_state 
iptable_filter]

Anybody know whats going on?

My actual firewall rules are:

filter table:
-A INPUT  -p tcp -m tcp -i eth1 --sport 1024: --dport 20:21 -j ACCEPT
-A OUTPUT -p tcp -m tcp -o eth1 --sport 20:21 --dport 1024: -j ACCEPT
-A INPUT -i eth1 -p tcp --sport 1024: --dport 1024: -m state --state NEW,ESTABLI
SHED -j ACCEPT
-A OUTPUT -o eth1 -p tcp --sport 1024: --dport 1024: -m state --state ESTABLISHE
D,RELATED -j ACCEPT
-A INPUT  -i eth1 -p tcp --dport 29 -m state --state NEW,ESTABLISHED  -j ACCEPT
-A OUTPUT -o eth1 -p tcp --sport 29 -m state --state ESTABLISHED,RELATED -j ACCE
PT
-A INPUT  -i eth1 -p tcp --dport 20 -m state --state NEW,ESTABLISHED  -j ACCEPT
-A OUTPUT -o eth1 -p tcp --sport 20 -m state --state ESTABLISHED,RELATED -j ACCE
PT

nat table:
:POSTROUTING ACCEPT [0:0]
-A POSTROUTING -o eth1 -j MASQUERADE

Thanks Gurus!






