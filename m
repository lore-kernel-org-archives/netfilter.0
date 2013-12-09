From: Chris Elston <celston@katalix.com>
Subject: Curious breakage with nested prio qdiscs
Date: Mon, 09 Dec 2013 11:30:13 +0000
Message-ID: <1386588613.6112.4.camel@Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

This was posted to the LARTC list a few days ago, but received no
response. I hope that it's not bad form to cross-post, I'm hoping that
this list has a wider audience.

---------

Background: I've implemented a system which requires distinct TBF limits
for a large number of different user sessions. Therefore I'm using two
layers of nested prio qdiscs, each with 16 bands - giving a maximum
total of 256 TBF user session limits. Where packets get queued is
determined by iptables packet marks and tc filters (this bit is not
immediately relevant)

I've discovered either a bug, or a major misunderstanding on my part :) 

The following commands:

tc qdisc add dev eth1 root handle 1: prio bands 16
tc qdisc add dev eth1 parent 1:2 handle 11:2 prio bands 16
tc qdisc add dev eth1 parent 11:2 handle 111: tbf rate 65536 burst 15000
latency 70
tc qdisc del dev eth1 parent 11:2 handle 111: tbf rate 65536 burst 15000
latency 70

prevent any traffic from leaving eth1 (tried on kernels 3.8.19 and
3.2.56)

So that's 2 nested prio qdiscs: one at the root, and one in the second
band of the root prio qdisc/

Then I add a TBF to the second band of the nested prio qdisc and
immediately remove it.  This leaves just the nested prio qdiscs in
place, and me unable to ping anything across eth1.

It seems to matter that the handle of the nested prio qdisc is 11:2 -
the values 11:1 and 11:3 don't cause the same problem.

It seems to matter that the nested prio qdisc is in band 2 of the root
prio qdisc - if I try the same with the nested prio qdisc in 1:1 and 1:3
the problem doesn't occur.

Problems only start when the TBF is deleted - it is possible to do all
the add commands and the interface still works.

One would assume that the delete command simply reverses the add
command, but it seems to have some side effect :(

Any thoughts?

Cheers,

Chris.




