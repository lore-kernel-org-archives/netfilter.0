From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: verifying set-mark
Date: Fri, 22 Feb 2008 21:44:16 +0100
Message-ID: <005301c87593$b13f0a00$13bd1e00$@info>
References: <30567908.61203711240579.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <30567908.61203711240579.JavaMail.root@tomcat.phantombsd.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> How can I detemine whether or not a iptables set-mark operation
> is working? iptables -t mangle -nvL shows packets matching the
> rules with the set-mark. However, with a tcpdump -vvv -i
> <interface>
> I can not see the mark. I am looking at the tos field, and I
> don't see a tos field matching the marks I am trying to set.

Did you try to match the mark in a subsequent rule and LOG the packet when the rule hits?
See also man iptables:

mark
This module matches the netfilter mark field associated with a packet (which can be set using the  MARK  target below).
--mark value[/mask] Matches packets with the given unsigned mark value (if a mask is specified, this is logically ANDed with the mask before the comparison).


Grts,
Rob


