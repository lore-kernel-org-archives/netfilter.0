From: "HareRam" <hareram@sol.net.in>
Subject: Re: transfer Bytes Counting
Date: Wed, 2 Oct 2002 19:09:20 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009a01c26a19$1e271680$7cfcc5cb@humanpc>
References: <FLEKIPPLAEDMJMOOBBDPIEMKDAAA.stewart.thompson@shaw.ca> <20021001233408.IGRL459.mta02-svc.ntlworld.com@there>
Reply-To: "HareRam" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Hi

thanks for the reply
i did the same, but iam not able to see the in and out bytes
is there any way i can send those packets to mysql
from there i can generate report

thanks
hare
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, October 02, 2002 5:04 AM
Subject: Re: transfer Bytes Counting


> On Tuesday 01 October 2002 11:50 pm, Stewart Thompson wrote:
>
> > Hi Hare:
> >
> > You seem to be loading a lot of modules
> > for the simple rules you are using. Perhaps you have plans for them
> > in the future. Hopefully Antony will jump in here and add to this
advice.
>
> Hi :-)
>
> I can't really comment on the list of modules - it *does* seem long, yes,
but
> I don't actually use modules on my firewalls - I compile everything in to
the
> kernel and I don't even have module support turned on (so it's not
possible
> to load a module I don't want running, or unload one I do want running...)
>
> So long as the system is working I'd suggest looking at the ruleset to
> increase security and then maybe think about whether all the modules are
> needed once the rules are settled.
>
> > Make a user defined chain for each on of your subnets.
>
> I like this suggestion - it makes for much more efficient traversal of the
> rules, however I'm not sure how many IP address in total we're talking
about
> here ?   How many machines do you have on your internal network ?
>
> > Also, if your looking for security, which you should be if this accesses
> > the Internet. Flush all your chains, and set your policies to DROP.
>
> Even if your system does not access the Internet, you should still aim for
> security.   You can't trust local users much more than N.E. Hakkr out on
the
> Internet...
>
> *Definitely* set your INPUT and FORWARD policies to DROP, and then add
rules
> to ACCEPT the traffic you want.   If you forget anything, add a rule to
allow
> it.   Otherwise, if you forget to block something, you're allowing it
through
> without knowing about it (and anyone who finds it is unlikely to tell you
:-)
>
> > If this is going to be involved, there are applications that might
> > be better suited for keeping track of packets. Since it appears you are
> > redirecting to a proxy, it may be a better place to do the packet
counting.
>
> Indeed.   The proxy logs will tell you some far more interesting
information
> about which websites have been visited and which pages have been
accessed -
> they should also give you byte counts for data transferred (although I'm
not
> a squid expert so I can't be sure about the tedium of data which is
> available).
>
> Depending on what you want to do with this data, you might want to look at
> iptraf, which is a console-based network monitor which will give you
traffic
> summaries by IP address - it's not very good for automated archiving of
stuff
> though.
>
> The only other thing I would say about the method of recording byte /
packet
> counts (aside from the comment I posted earlier today, which doesn't seem
to
> have got out on the list yet, that you don't have to have a "-j TARGET" at
> the end of a rule if you don't want one, so you can have a list of 'empty'
> rules purely for counting purposes) is that you should be very careful
about
> trying to use the nat tables for packet counting.   The nat mechanism in
> netfilter has been designed to be very efficient, and in fact only the
first
> packet of a connection will traverse any explicit rules in your nat
tables.
> All subsequent packets in a connection get automagically processed in the
> background, much more efficiently than if they went through all the rules
in
> the nat tables.   Therefore the INPUT or FORWARD chains, in the filter
table,
> are almost certainly the best place to do your counting - these will see
all
> the packets.
>
> Have fun :-)
>
> Antony.
>
> --
>
> This email is intended for the use of the individual addressee(s) named
above
> and may contain information that is confidential, privileged or unsuitable
> for overly sensitive persons with low self-esteem, no sense of humour, or
> irrational religious beliefs.
>
> If you have received this email in error, you are required to shred it
> immediately, add some nutmeg, three egg whites and a dessertspoonful of
> caster sugar. Whisk until soft peaks form, then place in a warm oven for
40
> minutes. Remove promptly and let stand for 2 hours before adding some
> decorative kiwi fruit and cream. Then notify me immediately by return
email
> and eat the original message.
>
>


