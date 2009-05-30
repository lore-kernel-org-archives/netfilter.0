From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Sat, 30 May 2009 17:37:58 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905301726540.31323@blackhole.kfki.hu>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saatvik Agarwal <saatvik.agarwal@stanford.edu>
Cc: netfilter@vger.kernel.org

[Back to your original mail.]

On Wed, 27 May 2009, Saatvik Agarwal wrote:

> For my research project in school, I am trying to establish TCP
> connections when both hosts are behind full-cone NATs using TCP's
> simultaneous open functionality. Unfortunately, it seems that iptables
> does not support TCP simultaneous open. For my test environment, I
> simulate a full-cone NAT using iptables. My iptables rule is exactly
> as follows:
> 
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> Of course, here my eth0 is the interface connected to the internet.
> Everything else is set to accept; there is no filtering or anything.
> In fact, I run iptables --flush before adding the above rule.
> 
> Using wireshark, the behavior I observe on both the iptables NAT boxes
> is that both of them send out/see a SYN coming from their NATted host
> before they receive a SYN from the other host. Unfortunately, both
> NATs respond with TCP RSTs to this incoming SYN (note that the
> incoming SYN corresponds to the exact same connection, i.e. port,
> endpoint tuple, as the outgoing SYN).

Netfilter conntrack/NAT does *not* generate any kind of packet. If you see 
RST segments, those are then sent by the receiver of the SYN packet 
because there's no open socket yet.

You can successfully build up simultaneous open connections only if you 
use good timings: both hosts send the initial SYNs *before* the SYN from 
the other side is delivered to them. Or, intentionally ignore (drop) the 
RST segments.

Adding TCP simultaneous open support to netfilter conntrack is not hard 
but needs more testing before release.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
