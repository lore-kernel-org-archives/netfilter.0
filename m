From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: port 389
Date: Fri, 23 Jan 2004 08:27:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401230827.13331.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hello , 
I asked for some frineds of mine to scan mly host , and they all find my 389 
port opened . here is the report , for those who understand french : 
http://www.tsenagasy.com/forum/viewtopic.php?p=33992#33992

i dont understand what's happening :

netstat | grep 389 
gives nothing , and
this is my set of rules .
would you help me to see , what is wrong ? or is the 389 just an "answer" 
port ?


iptables -P INPUT DROP
iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s 
-j ACCEPT
iptables -A INPUT -i ppp0 -m unclean -j LOG --log-level debug --log-prefix 
"unclean_: "
iptables -A INPUT -i ppp0 -m unclean -j DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 8090 -j ACCEPT
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 10080 -j ACCEPT
iptables -A INPUT -p tcp --dport 9000 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -p tcp --syn -m limit --limit 10/s -j LOG --log-level debug 
--log-prefix "syn_flood_attack_: "
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 10/s 
-j LOG --log-level debug --log-prefix "port_scan_attack_: "
iptables -A INPUT -j LOG --log-level debug --log-prefix "dropped_input_: "

-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina


