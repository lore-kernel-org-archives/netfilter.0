From: Peteris Krumins <newsgroups@lf.lv>
Subject: iptables icmp protocol match bug.
Date: Thu, 31 Jul 2003 23:26:35 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <68268272785.20030731232635@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-Id: <200307312029.h6VKTM5l021296@mail.lf.lv>
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

Hello,

 A quick bug report:
 (sorry for crossposting to devel and user list, but i am interested
 if anyone else can reproduce)

 iptables -A INPUT -p icmp --icmp-type 255 -i lo -j REJECT

 this rule also denies icmp ping and i think anything else of icmp.

 Works for me at least on 2.4.22-pre6 and patch-o-matic-20030714
 havent tried w/ newer versions.
 
 Does not work on base 2.4.20 and iptables 1.2.7a

proof:
--
z@xor:/[1032]# iptables -A INPUT -p icmp --icmp-type 255 -i lo -j REJECT
z@xor:/[1033]# ping localhost -c 5
PING localhost (127.0.0.1): 56 octets data

--- localhost ping statistics ---
5 packets transmitted, 0 packets received, 100% packet loss

z@xor:/[1034]# iptables -D INPUT -p icmp --icmp-type 255 -i lo -j REJECT
z@xor:/[1035]# ping localhost -c 5
PING localhost (127.0.0.1): 56 octets data
64 octets from 127.0.0.1: icmp_seq=0 ttl=128 time=0.3 ms
64 octets from 127.0.0.1: icmp_seq=1 ttl=128 time=0.3 ms
^C


P.Krumins







netfilter-devel@lists.netfilter.org


