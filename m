From: Miguel Manso <mmanso@yahoo.com>
Subject: Local IP not being local
Date: Mon, 28 Apr 2003 18:27:55 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030429012755.66519.qmail@web11501.mail.yahoo.com>
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

Hi there,

I've a linux machine acting as a router. I'm VERY happy with it and I'm
learning a lot (iptables rocks).

Now, I've something strange that I don't know how to solve.

I've a static public IP, let's imagine - 100.100.100.1

All the requests to that IP are redirected to the internal ip - 192.168.1.6

Now, inside 192.168.1.6 if I ping 100.100.100.1 I get:

64 bytes from 100.100.100.1: icmp_seq=16 ttl=61 time=23.7 ms

But, if I ping 'localhost' I get:

64 bytes from localhost.localdomain (127.0.0.1): icmp_seq=1 ttl=64 time=0.044
ms


This means that the ping that I'm doing to 100.100.100.1 is going to the
router, going to the outside, coming back to the router and to the internal
machine again.

Can I "say" something to the linux router to just redirect all the requests to
the 100.100.100.1 ip to the internal machine 192.168.1.6?

Thanks a lot for the help.

=====
Miguel Manso
mmanso@yahoo.com

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

