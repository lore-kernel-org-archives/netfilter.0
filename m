From: Maxim Berlin <mak@rtsnet.ru>
Subject: port forwarding
Date: Thu, 5 Dec 2002 23:56:27 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <285598680.20021205235627@rtsnet.ru>
Reply-To: Maxim Berlin <mak@rtsnet.ru>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

Players at my office asks me to give them access to outside counterstrike
server, UDP 21705. unfortunatelly, i am brand new in iptables, so i've
read the docs and started make rules, but they does not work.
Then i've tried simple
root@woody~/iptables>cat 1.sh
#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -v -F -t nat
iptables -v -F
iptables -v -A FORWARD -p tcp --dport 205 -j ACCEPT
iptables -v -t nat -A PREROUTING -p tcp --dport 205 -j DNAT --to-destination 172.17.32.12:25

, then telnet to woody:205 and there is no refusal and no answer.

root@woody~/iptables>cat /proc/net/ip_conntrack
[...]
tcp      6 118 SYN_SENT src=172.17.32.5 dst=172.17.144.110 sport=2020 dport=205 [UNREPLIED] src=172.17.32.12 dst=172.17.32.5 sport=25 dport=2020 use=1

Can someone please tell me, what i am doing wrong? why [UNREPLIED]?
should i create rule to pass packets back from 172.17.32.5 to client?

p.s. iptables v1.2.6a, kernel 2.4.18

Best wishes,
 Maxim                          mailto:mak@rtsnet.ru


