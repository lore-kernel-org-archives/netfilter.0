From: Mike Sowka <msowka@sce.carleton.ca>
Subject: Couple of Newbie Questions
Date: Fri, 19 Dec 2003 02:37:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071819450.19436.11.camel@sql-01>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Z3N/D/x4OQtxMHSgUhnJ"
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
To: netfilter@lists.netfilter.org


--=-Z3N/D/x4OQtxMHSgUhnJ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Everyone,

I just have a few "entry-level" questions:

#1 Just installed Redhat AS, and can't figure out why vsftpd doesn't
work in passive mode. I have NEW tcp packets with --dport 21 -j to
ACCEPT, and the following line

-m state --state ESTABLISHED,RELATED -j ACCEPT

that should jump RELATED ftp packets to accept too... ?right?? Well it
doesn't work.

#2 Disclaimer: this one is VAIN... after messing around with the nat
table, I took out any reference to the nat table from my
/etc/sysconfig/iptables but when I `/sbin/service iptables status` the
nat table still prints with all of the chains empty... where does this
info for the nat table persist? 

Thanx for your patience in swatting any confusion for me,
Mike

P.S. attaching iptable for reference concerning Q #1

--=-Z3N/D/x4OQtxMHSgUhnJ
Content-Disposition: attachment; filename=iptables
Content-Type: text/plain; name=iptables; charset=UTF-8
Content-Transfer-Encoding: 7bit

# Firewall configuration written by redhat-config-securitylevel
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -p 50 -j ACCEPT
-A RH-Firewall-1-INPUT -p 51 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT

--=-Z3N/D/x4OQtxMHSgUhnJ--


