From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Kaaza 2 jammer.
Date: Thu, 9 Jan 2003 21:18:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301092118.21946.netfilter@newkirk.us>
References: <IMEDICLPAGAOCBLCCKLPGENAEKAA.netfilter@darrelldieringer.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <IMEDICLPAGAOCBLCCKLPGENAEKAA.netfilter@darrelldieringer.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Darrell Dieringer <netfilter@darrelldieringer.com>, netfilter@lists.samba.org

On Thursday 09 January 2003 01:58 pm, Darrell Dieringer wrote:
> I've always wondered something about the string matching, but never
> having used it, I haven't researched it enough to know...
>
> Wouldn't netfilter also see the string "KazzaClient" in this email
> message?  I can imagine how that might cause problems if the string
> matching rules aren't well crafted.
>
> I see in the example posted by Tomasz Wrona that it only applies to
> tcp packets forwared from the internal interface, narrowing the focus
> qiute a bit.  But wouldn't that also block an email message having
> that string if sent from an internal machine?
>
> Of course, the sender of that message may have indeed sent it from a
> client on his internal network, and since I'm reading it, it must have
> worked as intended.
>
> I imagine placing a string matching rule, like the example, _after_
> rules which accept other legitimate traffic (like smtp) would work
> completely fine.
>
> Looking for eduction on the topic.

With any rules you're usually better off accepting 'normal' traffic and=20
very precise matches before trying to catch others.  This helps prevent=20
the situation you mentioned, and it also helps with large rulesets to=20
get the common traffic through the firewall with minimal testing=20
necessary. (IE if all 3000 client machines have port 80 access, but only=20
some have 110 and 25, don't waste time and power matching IP's for http)=20

There are surely counter-examples that will come to mind, but as a=20
general rule putting the most important/common traffic and most specific=20
matches earlier in the chain is better.  Especially with things like=20
DNAT to a DMZ, it is easy to break a service by putting a general rule=20
ahead of a specific one, and if there are many rules (or subchains of=20
rules) the cause may not be obvious.  Also, with a default DROP policy=20
and mostly ACCEPT rules, you have to be careful where you put a DROP=20
rule in the sequence, unless it is a very specific match.

Finally, in the case of the string match, it takes quite a bit more to=20
search for a string in the packet than to compare IPs in the header, so=20
you DON'T want to have this rule early in the chain if speed is an=20
issue.  (and it usually is, isn't it?  :^)  As an experiment, try a site=20
that measures bandwidth, (like http://bandwidthplace.com/speedtest/ )=20
then insert a string match rule (with no target, so the packets all=20
continue past it) first in the INPUT chain and try again. I don't have=20
p-o-m added in, so I don't have string match available to me.  I'm=20
curious though how much overhead this match actually incurs....

> Darrell Dieringer - Madison, WI

j


