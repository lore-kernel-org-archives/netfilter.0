From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Memory consumption
Date: Wed, 30 Mar 2005 16:14:28 +0200
Message-ID: <fad9d4840503300614a09baa6@mail.gmail.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
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

(Sent this message to the LARTC list as well, I apologise in advance
for people subscribed to both lists)

Hope everyone had a festive easter weekend!

Is it possible to monitor how much memory iptables or kernel consumes
while processing packets as they go through the firewall? The same
question goes for having a large number of routes in the routing table
(>700).

A few reasons for asking, but the two major ones are from the
following situations:

1. We provide 420 flats in a complex with broadband internet from one
source where I do the shaping and firewalling. The number of rules are
already insane, over a 1000. I need to match mac and ip's and only
allow certain destination ports and so forth. This works but the you
can feel the box is lagging under heavily loads although top and free
reports there is still some memory available. I wanna add rules to
have all packets dumped in a SQL database using ulogd to perform some
extensive analysis myself (and move the project into the public domain
later this year...)

2. Just to have all packets logged as in example 1, but without the
number of users and other rules.

Just to restate my questions:
1. How can I monitor the amount of CPU and memory usage of the kernel
spent on processing each packet as it traverses the various chains and
tables?
2. What would be the recommended CPU for using on an iptables firewall
machine for heavy loads?

Thanks in advance

-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

