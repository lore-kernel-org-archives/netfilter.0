From: Jeff Mesch <mesch@NanoTech.Wisc.EDU>
Subject: Newbie - Default Deny Setup
Date: Wed, 07 May 2003 14:52:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB963EF.2060506@nanotech.wisc.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm completely new to iptables, and am having a problem setting up a 
basic firewall, that follows default deny. I'm guessing it's a very 
basic error that I'm overlooking. I'm using FWBuilder to create the rules.

I cannot get any traffic out from the internal side. According to the 
log file, it is dropping the traffic as a result of RULE_4.

Any suggestions would be greatly appreciated.

Thanks.

->Jeff

-------
#
#  Rule 0(NAT)
#
#
$IPTABLES -t nat -A POSTROUTING -o eth0  -s 192.168.0.0/24 -j SNAT 
--to-source 198.150.6.16
#
#


$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Rule 0(eth0)
#
# Anti-spoofing rule
#
$IPTABLES -N eth0_In_RULE_0
$IPTABLES -A INPUT  -i eth0  -s 198.150.6.16  -j eth0_In_RULE_0
$IPTABLES -A INPUT  -i eth0  -s 192.168.1.1  -j eth0_In_RULE_0
$IPTABLES -A INPUT  -i eth0  -s 192.168.0.0/24  -j eth0_In_RULE_0
$IPTABLES -A FORWARD  -i eth0  -s 198.150.6.16  -j eth0_In_RULE_0
$IPTABLES -A FORWARD  -i eth0  -s 192.168.1.1  -j eth0_In_RULE_0
$IPTABLES -A FORWARD  -i eth0  -s 192.168.0.0/24  -j eth0_In_RULE_0
$IPTABLES -A eth0_In_RULE_0   -j LOG  --log-level info --log-prefix 
"RULE 0 -- DROP "
$IPTABLES -A eth0_In_RULE_0  -j DROP
#
# Rule 1(eth0)
#
# Anti-spoofing rule
#
$IPTABLES -N Cid3EB03CD7.0
$IPTABLES -A OUTPUT  -o eth0  -j Cid3EB03CD7.0
$IPTABLES -A Cid3EB03CD7.0  -o eth0  -j RETURN
$IPTABLES -A Cid3EB03CD7.0  -o eth0  -j DROP
$IPTABLES -N Cid3EB03CD7.1
$IPTABLES -A FORWARD  -o eth0  -j Cid3EB03CD7.1
$IPTABLES -A Cid3EB03CD7.1  -o eth0  -s 192.168.0.0/24  -j RETURN
$IPTABLES -N eth0_Out_RULE_1_3
$IPTABLES -A Cid3EB03CD7.1  -o eth0  -j eth0_Out_RULE_1_3
$IPTABLES -A eth0_Out_RULE_1_3   -j LOG  --log-level info --log-prefix 
"RULE 1 -- DROP "
$IPTABLES -A eth0_Out_RULE_1_3  -j DROP
#
# Rule 0(lo)
#
# allow everything on loopback
#
$IPTABLES -A INPUT  -i lo  -j ACCEPT
$IPTABLES -A FORWARD  -i lo  -j ACCEPT
$IPTABLES -A OUTPUT  -o lo  -j ACCEPT
$IPTABLES -A FORWARD  -o lo  -j ACCEPT
#
# Rule 0(global)
#
# block fragments
#
$IPTABLES -N RULE_0
$IPTABLES -A OUTPUT -p ip  -f   -j RULE_0
$IPTABLES -A INPUT -p ip  -f   -j RULE_0
$IPTABLES -A FORWARD -p ip  -f   -j RULE_0
$IPTABLES -A RULE_0  -j LOG  --log-level info --log-prefix "RULE 0 -- 
DROP "
$IPTABLES -A RULE_0  -j DROP
#
# Rule 1(global)
#
# ssh access to firewall
#
$IPTABLES -A OUTPUT -p tcp  -d 198.150.6.16  --destination-port 22  -m 
state --state NEW  -j ACCEPT
$IPTABLES -A OUTPUT -p tcp  -d 192.168.1.1  --destination-port 22  -m 
state --state NEW  -j ACCEPT
$IPTABLES -A INPUT -p tcp  --destination-port 22  -m state --state NEW 
-j ACCEPT
#
# Rule 2(global)
#
# firewall uses DNS server on Inet
#
$IPTABLES -A INPUT -p udp  -s 198.150.6.16  --destination-port 53  -m 
state --state NEW  -j ACCEPT
$IPTABLES -A INPUT -p udp  -s 192.168.1.1  --destination-port 53  -m 
state --state NEW  -j ACCEPT
$IPTABLES -A OUTPUT -p udp  --destination-port 53  -m state --state NEW 
  -j ACCEPT
#
# Rule 3(global)
#
# 'masquerading' rule
#
$IPTABLES -A INPUT  -s 192.168.0.0/24  -m state --state NEW  -j ACCEPT
$IPTABLES -A FORWARD  -s 192.168.0.0/24  -m state --state NEW  -j ACCEPT
#
# Rule 4(global)
#
# 'catch all' rule
#
$IPTABLES -N RULE_4
$IPTABLES -A OUTPUT  -j RULE_4
$IPTABLES -A INPUT  -j RULE_4
$IPTABLES -A FORWARD  -j RULE_4
$IPTABLES -A RULE_4  -j LOG  --log-level info --log-prefix "RULE 4 -- 
DROP "
$IPTABLES -A RULE_4  -j DROP
#
#
echo 1 > /proc/sys/net/ipv4/ip_forward


