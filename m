From: Serge Kosyrev <skosyrev@ptsecurity.ru>
Subject: DNAT on loopback
Date: Wed, 28 Aug 2013 18:10:23 +0400
Message-ID: <87vc38taw7.fsf@wintermute.ptsecurity.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Good day folks!

Is it possible to DNAT locally-originated, locally-destined packets to a
non-local destination?

The use-case is port forwarding to a locally-routed VM guest.
For externally originating access the following is adequate:

iptables -t nat -A PREROUTING -d external.iface.ip -p tcp --dport 80 -j DNAT --to-destination target.ip.add.ress

A logical complement for locally originating accesses would have been:

iptables -t nat -A OUTPUT     -d 127.0.0.0/16      -p tcp --dport 80 -j DNAT --to-destination target.ip.add.ress

..but all I can observe is silent packet disappearance, which I presume
takes place during routing decision-making immediately following the
processing by the OUTPUT chain of the nat table.

So, is it possible at all, or should I go the userspace port forwarding way?


regards,
Samium Gromoff
