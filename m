From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Multi source/destination ip address
Date: Mon, 21 Feb 2005 15:33:19 +0100
Message-ID: <200502211533.19645.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

Hello...

Today I have stopped on next problem. I've just want to block almost all 
connection on 80 port in my router with destination list's addresses. 
"Almost" because some connection are forwarded to another router in my LAN. 
So this is the rule:

iptables -A FORWARD -p tcp -port 80 -d ! 192.168.131.0/24 && 192.168.110.0/24 
-j  DROP

But it doesn't work.... in iptables spec. -d is only connect with single 
address not list. I found also iprange extension but it doesn't suit me. Is 
it possible to have list destination/source addresses in iptables rule?

Thanks,
Marcin

