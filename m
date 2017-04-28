From: Robert White <rwhite@pobox.com>
Subject: Re: SYN packet "disappears"
Date: Fri, 28 Apr 2017 01:00:57 +0000
Message-ID: <adf6ae74-e152-a88f-d721-51f82f799534@pobox.com>
References: <1538022.l5gG4X5sYW@giles>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1538022.l5gG4X5sYW@giles>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kevin <kmg952@bigpond.com>, netfilter@vger.kernel.org

On 04/27/17 05:21, Kevin wrote:
> (... DROP rules and a tun+ device but virtually no rules that ACCEPT the packet so it can get into the tun+ device ...)

So you've got these policies...

> $IPT -t filter   --policy INPUT       DROP
> $IPT -t filter   --policy FORWARD     DROP
> $IPT -t filter   --policy OUTPUT      DROP

And you've got these post TUN/TAP decode rules

> $IPT -A INPUT   -i tun+ -s 999.999.999.999 -j ACCEPT
> $IPT -A FORWARD -i tun+ -s 999.999.999.999 -j ACCEPT
> $IPT -A OUTPUT  -o tun+ -d 999.999.999.999 -j ACCEPT

But you've got no

$IPT -A INPUT -i ethX (Whatever the tunnel needs) -j ACCEPT

So it's virtually impossible to see what you are doing with all these
logs, but those first three policy DROP rules pretty much mean that
you'll never get any packets as far as the TUN/TAP driver.

Without some rules letting packets to ACCEPT the tunnel traffic, the
tunnel driver never sees the packet to decode it for the later tunnel rules.


That tunnel allowance rule may need to be on both INPUT and OUTPUT, it
should list the --proto NN for the tunnel protocol, the remote and local
ip addresses of the tunnel participants in source and destination
(remember to reverse these for OUTPUT compared to INPUT).

You are also going to want an established/related rule at the head of
input and output.

Some tunnels need more than one protocol number (so more than one rule)
and some have parallel protocols for security.

But basically you've been explicitly dropping the packets with your
policies.

--Rob.



