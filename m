From: pthyseba@intec.ugent.be
Subject: fwmark iptables/ip routing interaction question
Date: Wed, 7 May 2008 16:36:54 +0200 (CEST)
Message-ID: <49159.212.190.198.36.1210171014.squirrel@webserver6.intec.ugent.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello,

After reading docs on iptables and advanced linux routing using iproute2,
I'm left with the following question:

I have succesfully setup a routing policy on Red Hat Enterprise Linux 4
where one type of locally generated traffic is routed to a gateway
different from the default gateway. I have done this straight from the
book:

add a MARK target for these packets in the OUTPUT chain of table "mangle"
add a routing rule for marked packets to a different routing table
add a default gateway to the new routing table.


This setup works as expected: the targeted packets are routed to the
different gateway. However, my question is: why does this work?

After studying the iptables block diagrams, it seems that the packet
travels through the OUTPUT chains AFTER "routing". I assumed that
"routing" implied the lookup of the correct routing table and then
selection of the correct rule in that table, but putting the iptables and
my definition of "routing" together, it would seem that packets only get
marked (the MARK target is in the output chain) after "routing" has been
done (and I assumed filtering packets using the fwmark filter was done in
that step). Obviously, I'm misunderstanding something, as packets that get
marked in the OUTPUT chain do get routed correctly (meaning, have their
mark set when routing is looking for the correct routing table).

What's wrong in my understanding of the interaction between iptables and
"routing" ?

Thanks,
Pieter
