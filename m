From: msk@cloudmark.com
Subject: Stateful packet inspection
Date: Thu, 3 Nov 2011 11:46:43 -0700 (PDT)
Message-ID: <201111031846.pA3IkhbR081886@medusa.blackops.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm looking into doing some work that involves an application doing stateful
inspection of packets for a specific application layer protocol.  I can't
tell from the descriptions if "netfilter" or "netfilter-devel" is the right
place to ask, so please feel free to point me at the right list if this is
the wrong one.

The idea is this:

Machine A is connected to the general Internet, acting as a filter or firewall
for machine B.  Machine B provides a well-known Internet service of some
kind but is subject to abuse and needs protection.

Machine A is equipped with a two-port NIC with a fail-open capability, so that
if A is powered off or the software on it crashes, Internet traffic goes
directly to and from B, allowing transparent fail-over.

A connection from outside hits A, which passes it to an application-layer
policy application that does stateful analysis while packets are also
relayed between the Internet and B.  If A decides the session needs to
be aborted for policy reasons, it terminates the relaying to B (so B
thinks the connection was interrupted) and sends an application-specific
permanent error code back to the client.  This means B doesn't know A is
there, and neither does the client, whether the session is allowed to
complete, or is aborted, or A fails.

Does netfilter provide APIs that could accomplish this?  If not, is there
something else that does, or gets me close?

Thanks for any advice!

-MSK
