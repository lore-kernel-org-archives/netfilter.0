From: "James.Q.L" <shijialeeee@yahoo.ca>
Subject: dhcp renew rules question
Date: Thu, 26 Dec 2002 01:13:06 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021226061306.28775.qmail@web41414.mail.yahoo.com>
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

i am using the rules from ipmasq howto.

iptables -A INPUT -i eth0 -p tcp --sport 68 --dport 67 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 68 --dport 67 -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp -s 192.168.0.1 --sport 67
-d 255.255.255.255 --dport 68 -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp -s 192.168.0.1 --sport 67
-d 255.255.255.255 --dport 68 -j ACCEPT 

Reading DHCP howto, i know When the client reaches 50 percent of its assigned lease time, it will
enter the renewal phase. The client sends a DHCPREQUEST packet directly to the server that gave it
its TCP/IP address.  my question is will the server respond with a broadcast or a direct
answer(DHCPACK) to the client ?  but the rules from ipmasq seems only care about the broadcast.
what about the renewal ?

 

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

