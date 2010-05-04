From: Thomas Jacob <jacob@internet24.de>
Subject: Re: ACCOUNT target
Date: Tue, 04 May 2010 11:34:15 +0200
Message-ID: <1272965655.7011.11.camel@enterprise.ims-firmen.de>
References: <1272579734.8207.16523.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1272579734.8207.16523.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

On Thu, 2010-04-29 at 15:22 -0700, Bob Miller wrote:
> Hello,
> I am of the understanding that the ACCOUNT target does not count ARP,
> ICMP, etc, and that it does count TCP.  I am wondering if it counts UDP.
> I find no mention on google one way or the other...

AFAIK, the ACCOUNT target (the one developed by Intra2Net, there
are/were others) counts all IPv4 packets matched by the rule
you use this target in. 

So your ruleset determines what is counted and what isn't.

Now, ARP (which technically isn't an IPv4 layer 4 protocol but a
supporting layer 2/3 protocol for IPv4) isn't normally matched by
IPtables, unless you run a transparent (layer 2) firewall, and even then
you'll probably need to use ebtables or arptables to match ARP
packets.

http://ebtables.sourceforge.net/
http://linux.die.net/man/8/arptables

