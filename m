From: kannel sms <kannel_sms@yahoo.com>
Subject: DHCP /MAC
Date: Sat, 8 Nov 2003 05:05:17 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031108130517.88285.qmail@web60210.mail.yahoo.com>
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


As u said i did all , but it will not reach my
requirement, because when i added that rule with a
specific MAC address , according to ur mail it will
allow  to get all the dhcp facilities . 
But other machines also doing samething . so seems to
be somewhere has a small problem , 

i will give u my tabless info

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
#######################################################################################################################
iptables -A INPUT -i lo -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o lo -m state --state NEW -j
ACCEPT

iptables -A INPUT -m state --state RELATED,ESTABLISHED
-j ACCEPT
iptables -A OUTPUT -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state NEW -j ACCEPT
####################################################################################################################
iptables -N MACcheck
iptables -A MACcheck -m mac --mac-source
00.50.BA.50.36.25 -j ACCEPT
iptables -A MACcheck -j DROP

iptables -I INPUT -i eth0 -j MACcheck
######################################################################################################################
iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 67
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT
iptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 67
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT

iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 68
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT
iptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 68
-i eth0 -m state --state NEW -m mac --mac-source
00:50:BA:50:36:25 -j
ACCEPT


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

