From: "denis stauffer" <denis.stauffer@gmail.com>
Subject: Problem with libiptc : compatibility between gcc 4.0 and iptables
	1.3.0
Date: Mon, 18 Sep 2006 17:00:57 +0200
Message-ID: <2b76460a0609180800y34d1c52as590d9014df558246@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: fessahi@gmail.com

Hi,

I'm trying to develop a dynamic router firewall based on libiptc
library. I'm trying to reuse a source code written with iptables
1.2.6.

I encounter some problems when using the g++ 4.0 in Fedora Core 4.
Indeed, when I execute my program, compiled with g++  4.0, I get the
following message error returning from iptc_commit call :
 protocol wrong type for socket
( generated after setsockopt with SO_SET_REPLACE option in libiptc.c ).

After that, I've upgaded libiptc with iptables  1.3.5, always with g++
4.0. Doing this, I get an other message error :
 unknown error 4294967295
( generated after setsockopt with SO_SET_ADD_COUNTERS and no more
SO_SET_REPLACE like before with iptables 1.3.0 ).

Finally, I modify my g++ compilator to g++ 3.2. Surprisingly, the
program seems to work fine.But in fact, I've problems to forward udp
packets through my router firewall. ip_forward in /proc/sys/net/ipv4
is set to 1. When I look at iptables counters ( iptables -t nat -L -nv
), I can see that packet counters in PREROUTING and POSTROUTING chains
are increasing and equals, but no packet is generated on output
interface.

My aim is to use g++ 4.0 with iptables 1.3.0 ( standard components in FC4 )

PS : no modification have been realized in libiptc API


If someone has encountered the same kind of problem, can he tell me
how to resolve that ?
Best regards, and thanks in advance
Denis

