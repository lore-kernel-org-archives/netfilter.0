From: =?iso-8859-1?q?Sameer=20Gurung?= <sameersworld@yahoo.co.in>
Subject: NAT and Transparent proxy
Date: Thu, 13 May 2004 10:14:42 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040513091442.90722.qmail@web8304.mail.in.yahoo.com>
Reply-To: g_sameer75@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I have the current set up as follows;

Linux box running PCQLinux 2004 (based on fedora core
1...check out the site pcquest.com. its a great
distribution ) with 2 NIC .... eth1 connected 2 the
internet and eth0 to the local network


I run squid on the same box that runs the firewall
(iptables). I have turned on transparent proxying with
the following rules




iptables -t nat -A PREROUTING  -i $LAN_IFACE -p tcp -j
REDIRECT --to-port 3128 

iptables -t nat -A POSTROUTING -o $INET_IFACE -j SNAT
--to-source $INET_IP

The rule works fine....But I also use the firewall box
as a workstation and allow access from it to the
internet via the output chain. The rules being (where
LAN_IP=192.168.2.1 and INET_IP = static ip given by
isp )

iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
iptables  -A OUTPUT -p ALL -s $INET_IP -j ACCEPT


What i want now is all net access from this (firewall)
box to go through the squid server (i.e. port 3128).
So I add a rule above the OUTPUT rules that says  

iptables -t nat -A OUTPUT -o $INET_IFACE -p tcp -j
REDIRECT --to-port 3128
but it doesn't work..

Can anybody help me.

Thanks all,


Sameer


=====


________________________________________________________________________
Yahoo! India Matrimony: Find your partner online. http://yahoo.shaadi.com/india-matrimony/

