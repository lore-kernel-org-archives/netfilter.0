From: Robert White <rwhite@pobox.com>
Subject: (suggestion) A common verb for all "inet_service" protocols would be
 nice and efficient
Date: Tue, 4 Apr 2017 08:58:40 +0000
Message-ID: <c91444d2-2d53-f021-9ca2-345bfdc5557a@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

So there are a number of protocols (tcp, udp, sctp, udplite, etc) that
all start with the sixteen bit "source port" and "destination port"
values. I find myself writing a lot of duplicate rules, first one for
TCP then one for UDP to catch connection attempts to a lot of ports I do
not offer.

It would save time and effort if there were a generic verb that would
match all of these port/service protocols that have that same 32 bit
layout and introduce "sport" and "dport" syntax.

ASIDE: the word "generic" here will be used, it's not a bad choice for
the actual word to use since "generic dport" reads correctly... but that
may _not_ be the best wording for ESL readers. So I've got no real
opinion on what word to use. "meta" is already busy for other purposes
so...?

Example:

table inet example {
	set SANS_alerts {
		type inet_service
	}

	chain guards {
		generic dport @SANS_alerts drop
	}
}

The example is suspiciously trite, but the ability to just sweep up
services you know you are never going to offer and, or indeed being able
to list the very limited services you do offer all in one go seems like
a win.

additionally, with the default option discussed in bug 1132 this becomes
especially powerful.

table inet example {
  chain input {
    generic dport vmap {http     : jump webstuf,
                        ssh      : jump ssh_secure,
                        ntp      : jump udp_throttle,
                        diameter : jump sctp_checks,
                        *        : drop }
  }
}

So this one rule sweeps up all the inet_service protocols but doesn't
touch arp, icmp, dccp, ah, esp, and any other non-service stuff.

The only two sub-keys I've been able to identify as usefully common and
therefore fast at runtime are sport and dport.

ASIDE: I don't know if it is smart to have it in the inet instead of
just ip or ip6, but the broadest case seemed to be the best.

I know that something like this could be hacked together with u16 rules
in iptables, but there is clarity to this sort of structure and it
sweeps up so much common logic.

-- Rob.
