From: zakinthinos@freemail.gr
Subject: stateful filtering, ppp dialup link, secure ?
Date: Mon, 31 Jul 2006 22:04:59 +0300
Message-ID: <44ce545bf2c5c8.10134588@freemail.gr>
Reply-To: zakinthinos@freemail.gr
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



hi

i was wondering if there are any obvious security
security concerns in the following script

the script is placed into /etc/ppp/ip-up
($PPP_LOCAL is the dynamic ip and $DNS{1,2}
is the address of the dns server)

iptables -F
iptables -X
iptables -Z


iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -s $PPP_LOCAL -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1/32 -d 127.0.0.1/32 -o lo -j ACCEPT


iptables -A INPUT -p udp -d $PPP_LOCAL -s $DNS1 --sport 53 -j ACCEPT
iptables -A INPUT -p udp -d $PPP_LOCAL -s $DNS2 --sport 53 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -p tcp -d $PPP_LOCAL --dport 1024: -j ACCEPT
iptables -A INPUT -s 127.0.0.1/32 -d 127.0.0.1/32 -i lo -j ACCEPT


iptables -A OUTPUT -j LOG --log-prefix " OUTPUT: " --log-level debug --log-uid
iptables -A INPUT -j LOG --log-prefix " INPUT: " --log-level debug --log-uid



