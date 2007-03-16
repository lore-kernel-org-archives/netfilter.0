From: =?us-ascii?Q?Martin=20Korous?= <Mortals@seznam.cz>
Subject: forwarding local ports
Date: Fri, 16 Mar 2007 19:41:52 +0100 (CET)
Message-ID: <2700.4272-9683-164045092-1174070512@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello,

I want forward local ports to remote server, for example:
for `telnet localhost 80` must answer webserver from remote IP

I have this rule:
iptables -t nat -A OUTPUT -p TCP -d 127.0.0.1 --dport 80 -j DNAT --to 192.168.0.254:80
but doesnt work.
of course i have support of routing, iptables and nat in kernel 

Im sure that rule is right and in kernel 2.4 works.
Is problem in 2.6 or where?

kernel 2.6.18

regards 
Martin Korous

