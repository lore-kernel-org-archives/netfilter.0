From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Thu, 3 Jun 2010 00:13:49 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006022254390.14733@blackhole.kfki.hu>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>  <alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
 <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Curby <curby@cur.by>
Cc: Jeremiah Crockett <jrmhcrcktt@gmail.com>, Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Wed, 2 Jun 2010, Curby wrote:

> This seems to get a bit murkier as some conditions that match INVALID,
> including invalid combinations of TCP flags, seem to be an "active
> match" instead of a "passive default."  In other words, if the state
> starts as INVALID, and conntrack determines that it should be state
> NEW, something somehow must be applied afterwards to force it back to
> INVALID due to it being a malformed packet. 

It depends on how one looks at conntrack and it's relation with the other 
parts of netfilter. I'd not say that "every packet starts with the state 
INVALID". Of course the state of the packet *before* conntrack invoked is 
INVALID, but what else could it be, if conntrack hadn't got a chance yet 
to associate a state to the packet?

The current documentations try to describe the states so that it does not 
need a deep TCP/IP knowledge from the readers. A rough description on how 
a packet traverses conntrack and what state are associated to it could be 
the following:

- loopback or untracked packets are ignored
- if the IP(v4/6) header cannot be extracted then the packet is dropped
- if the packet, according to the Layer 4 protocol, is broken (like
  for TCP: the packet does not carry a complete TCP header or it's 
  malformed or the TCP checksum/TCP flag combination is invalid; for UDP:
  the header is too small, truncated or malformed, etc.) then the INVALID 
  state is associated to the packet
- if the IP addresses or the protocol parameters (ports) for a unique
  tuple (src ip, dst ip, proto, src "port", dst "port") cannot be 
  extracted from the packet, it's state is set to INVALID
- then, using the tuple, we try to find an already existing connection
  to which the packet belongs. If we do find such a connection, then
  a lot of checking happens according to the protocol. Just for TCP, those 
  can result in dropping simply the packet (like when we cannot handle 
  reopened connections or when conntrack lost sync and that way we
  can force the client to resend an initial SYN); or set the state to 
  INVALID (when it's s SYN/ACK packet and we haven't seen a SYN 
  previously, or it's a FIN "answering" a SYN packet, or invalid RST
  segment, or out of window packet, etc). If the packet is OK and
  associated to a connection, then it's state will be ESTABLISHED.
- if we could not find an already existing connection for the packet
  then it's state will be NEW - or RELATED, if we expected the packet.
  Or INVALID, if the given packet may not initiate a new connection, 
  according to the protocol (and tcp_loose is disabled for TCP).

I left out smaller parts and referred TCP mostly. However there are ICMP 
subleties, and other handled protocols as well. So the full picture would 
need a complete article.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
