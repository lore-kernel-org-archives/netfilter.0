From: Metal Gear <finattack@gmail.com>
Subject: Port forwarding error
Date: Tue, 1 Mar 2005 15:07:17 +0500
Message-ID: <110c784405030102077fa30d3e@mail.gmail.com>
Reply-To: Metal Gear <finattack@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi all,

plz check the following diagram for pictorial details of my problem

http://www.antionline.com/attachment.php?s=&postid=824669

Squid (only one interface card)
I want to configure iptable rules on my squid machine such that if any
client connects on pop3, smtp, dns these request are redirected to
servers popserver, smtpserver and dnsserver. All three of these
servers are on untrusted network having public ips. My squid machine
and clients are on internal network and only squid machine can cross
the firewall to access the outerworld. I researched a lot but i m
unable to write a successful rule for that. I m posting my rules in
the end of the post. Currently i m using a port redirector (rinetd) in
place of that rules.

Thanks

(Your assistance will be greatly appreciated)


#!/bin/sh
iptables -F
iptables -A INPUT -p ALL -j ACCEPT
iptables -A PREROUTING -t nat -d squidip -p tcp --dport 110 -j DNAT
--to popserver
iptables -I PREROUTING -t nat -d squidip -p udp --dport 110 -j DNAT
--to popserver
iptables -A POSTROUTING -t nat -s popserver -p tcp --dport 110 -j SNAT
--to squidip
iptables -A POSTROUTING -t nat -s popserver -p udp --dport 110 -j SNAT
--to squdip
service iptables save
/etc/rc.d/init.d/iptables restart

