From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: transfer Bytes Counting
Date: Wed, 2 Oct 2002 00:34:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021001233408.IGRL459.mta02-svc.ntlworld.com@there>
References: <FLEKIPPLAEDMJMOOBBDPIEMKDAAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPIEMKDAAA.stewart.thompson@shaw.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tuesday 01 October 2002 11:50 pm, Stewart Thompson wrote:

> Hi Hare:
>
> You seem to be loading a lot of modules
> for the simple rules you are using. Perhaps you have plans for them
> in the future. Hopefully Antony will jump in here and add to this advice.

Hi :-)

I can't really comment on the list of modules - it *does* seem long, yes, b=
ut=20
I don't actually use modules on my firewalls - I compile everything in to t=
he=20
kernel and I don't even have module support turned on (so it's not possible=
=20
to load a module I don't want running, or unload one I do want running...)

So long as the system is working I'd suggest looking at the ruleset to=20
increase security and then maybe think about whether all the modules are=20
needed once the rules are settled.

> 	Make a user defined chain for each on of your subnets.

I like this suggestion - it makes for much more efficient traversal of the =

rules, however I'm not sure how many IP address in total we're talking abou=
t=20
here ?   How many machines do you have on your internal network ?

> Also, if your looking for security, which you should be if this accesses
> the Internet. Flush all your chains, and set your policies to DROP.

Even if your system does not access the Internet, you should still aim for =

security.   You can't trust local users much more than N.E. Hakkr out on th=
e=20
Internet...

*Definitely* set your INPUT and FORWARD policies to DROP, and then add rule=
s=20
to ACCEPT the traffic you want.   If you forget anything, add a rule to all=
ow=20
it.   Otherwise, if you forget to block something, you're allowing it throu=
gh=20
without knowing about it (and anyone who finds it is unlikely to tell you :=
-)

> 	If this is going to be involved, there are applications that might
> be better suited for keeping track of packets. Since it appears you are
> redirecting to a proxy, it may be a better place to do the packet countin=
g.

Indeed.   The proxy logs will tell you some far more interesting informatio=
n=20
about which websites have been visited and which pages have been accessed -=
=20
they should also give you byte counts for data transferred (although I'm no=
t=20
a squid expert so I can't be sure about the tedium of data which is=20
available).

Depending on what you want to do with this data, you might want to look at =

iptraf, which is a console-based network monitor which will give you traffi=
c=20
summaries by IP address - it's not very good for automated archiving of stu=
ff=20
though.

The only other thing I would say about the method of recording byte / packe=
t=20
counts (aside from the comment I posted earlier today, which doesn't seem t=
o=20
have got out on the list yet, that you don't have to have a "-j TARGET" at =

the end of a rule if you don't want one, so you can have a list of 'empty' =

rules purely for counting purposes) is that you should be very careful abou=
t=20
trying to use the nat tables for packet counting.   The nat mechanism in=20
netfilter has been designed to be very efficient, and in fact only the firs=
t=20
packet of a connection will traverse any explicit rules in your nat tables.=
  =20
All subsequent packets in a connection get automagically processed in the=20
background, much more efficiently than if they went through all the rules i=
n=20
the nat tables.   Therefore the INPUT or FORWARD chains, in the filter tabl=
e,=20
are almost certainly the best place to do your counting - these will see al=
l=20
the packets.

Have fun :-)

Antony.

--=20

This email is intended for the use of the individual addressee(s) named abo=
ve=20
and may contain information that is confidential, privileged or unsuitable =

for overly sensitive persons with low self-esteem, no sense of humour, or=20
irrational religious beliefs.

If you have received this email in error, you are required to shred it=20
immediately, add some nutmeg, three egg whites and a dessertspoonful of=20
caster sugar. =A0 Whisk until soft peaks form, then place in a warm oven fo=
r 40=20
minutes. =A0 Remove promptly and let stand for 2 hours before adding some=20
decorative kiwi fruit and cream. =A0 Then notify me immediately by return e=
mail=20
and eat the original message.

