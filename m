From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: TOS problem
Date: Mon, 25 Jul 2005 14:48:41 +0200
Message-ID: <200507251448.41773.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello

A few days ago I wrote post about "Ip:Port REDIRECTION problem". Since that 
time I have searched once again iptables HOW-TOs and find that one of the 
solutions for my problem is changing TOS to other value. This is done by 
simple rule:
iptables -t mangle -A PREROUTING -p tcp --dport 4000 -j TOS --set-tos 0x10
Next I redirect port 4000 from this router to another machine:
iptables -t nat -A PREROUTING -p tcp --dport 4000 -j DNAT 192.168.49.60:80

This works OK on router when this rule is being ran but when I dump (tcpdump) 
packtes on 192.168.49.60, "ToS" value is changed to 0x0. No any rules are 
being set on 192.168.49.60 - simple machine. Why "ToS" is changing? What do I 
wrong?

Thanks,
Marcin


