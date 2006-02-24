From: "Giacomo A. Catenazzi" <cate@debian.org>
Subject: connectionless port forwarding
Date: Fri, 24 Feb 2006 14:03:24 +0100
Message-ID: <43FF041C.4050005@debian.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello.

I'm searching if I can do (or why not) a connectionless
port forwarding. Google didn't help me, and now I'm
using a std port forwarding using nat tables, but
a smaller solution is better IMHO.

I admin an "high" traffic web site. In last time there was
an huge increment of web-spam/blog-spam traffic, which I would
avoid.

I want to direct traffic from a blacklist into
an other port, so that a simple http server will
advise user (and offer a graphical challenge) to unblock.

Practically I want to mangle the port of blacklist-originated
packets, from 80 to 81, and the opposite for outgoing traffic.
Port 81 will be firewalled from extern, so I think there cannot
be problem with connection identification / collision.

Would it be possible?
Would it be lighter than std nat solution (and conncetion tracking)?
Are there already some netfilter module? (or
i should implement myself one?)

ciao
	cate

PS: please CC: me. It is easier to reply

