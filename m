From: Joris <joriske@gmail.com>
Subject: routing broadcast mac ethernet frames
Date: Sat, 5 Feb 2005 08:24:23 +0100
Message-ID: <afcf620205020423242dbf2877@mail.gmail.com>
Reply-To: Joris <joriske@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Dear netfilter team,

I'd like to make a linux setup (both 2.4 and 2.6) accept and route
packets on a lan with a broadcast mac.

Maybe it's a setting somewhere we haven't discovered yet, perhaps it
can be done with an iptables rule, or perhaps someone can whip up a
kernel patch?


This is why: certain embedded devices, such as some wifi accesspoints
and some DSL modems, seem to have a common bug/feature.
They keep an arp table, and any traffic from any host not in that
table is re-sent with a broadcast mac address (ff:ff:ff:ff:ff:ff).

As far as I know, linux will happily accept packets like that when
they're adressed to itself, but will not route them. This makes
communication impossible in certain setups with linux as a router.
A lot of people, especially wireless communities, are (knowingly or
more likely unknowningly) suffering from this problem.

Of course, those devices are buggy and should use ARP, but making
linux 'compatible' is a lot easier than getting multiple hardware
manufacturers to rewrite their firmware.




Many thanks in advance,
Joris & zombie


A highly similar problem description I found on the linux-net list:
http://marc.theaimsgroup.com/?l=linux-net&m=108263333208537&w=2
Read this too: http://marc.theaimsgroup.com/?l=linux-net&m=108264197315176&w=2

