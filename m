From: Askar Ali Khan <askarali@gmail.com>
Subject: telnet question
Date: Wed, 7 Jul 2004 10:55:21 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e5040706225576326815@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

hi,

we got a machine to which we telnet only telnet is allow on that
machine (C) no ssh thingy, the problem is that we telnet the machine
from two different linux boxes "servers" here is the traceroute for
...

Linux Box :A tracetroute output for the machine C
     
     traceroute to xxx.xxx.xx.x (xxx.xxx.xx.x), 30 hops max, 38 byte packets
     1  abc.foo.net (xxx.xxx.xx.x)  4.440 ms  3.931 ms  4.406 ms
<---direct to machine C

Linux Box: B tracetroute output for the machine C
traceroute to xxx.xxx.xx.x (xxx.xxx.xx.x), 30 hops max, 38 byte packets
 1  xxx.xxx.xx.1 (xxx.xxx.xx.1)  5.056 ms  1.088 ms  1.109 ms <-----gateway
 2  xxx.xxx.xx.x (xxx.xxx.xx.x)  5.198 ms  5.887 ms  14.429 ms <-----machine C

my question is that how to makes Linux Box (B) direct to machine C i-e
like that Linux Box A.

regards

