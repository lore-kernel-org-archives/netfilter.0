From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: Tue, 22 Oct 2002 16:10:46 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain>
References: <1035317344.8858.14.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035317344.8858.14.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter mailing list <netfilter@lists.netfilter.org>

On 22 Oct 2002, Cedric Blancher wrote:

> Le mar 22/10/2002 =E0 20:57, Robert P. J. Day a =E9crit :
> >   i've had a number of people tell me that, while they put a
> > good deal of thought into their INPUT filtering, they simply
> > ACCEPT all outgoing traffic since, if their input filtering
> > is working properly, there's no reason to stop outgoing
> > packets.
> >   comments?
> =

> Once you have accepted the fact that your box can get compromised, you
> easily understand why you should filter outgoing traffic. Moreover,
> maximum security relies on the "lesser privilege rule" which specifies
> that an object must not be allowed to do more than he has to. According=

> to this, you have to filter network output.

i understand that, for extra security, you should also filter on =

the OUTPUT chain.  but someone suggested to me that, if i get hacked
because someone gets through my INPUT filter rules, they have a good
chance of being able to change my ruleset anyway and remove the
filtering.  this is why this person suggested that i should concentrate
my efforts on hardening my INPUT filter, and not worry a whole lot
about the OUTPUT ruleset.  in other words, if i get hacked, i'm =

pretty much toast anyway, and can't trust *anything* about my
system anymore.

i realize it sounds like having sloppier security not worrying
about the OUTPUT ruleset.  i guess it would help me if someone
could provide *specific* examples of how OUTPUT filtering adds to
security beyond what would be provided by a well-designed INPUT
ruleset.  a pointer to an FAQ or some other link would be fine.

rday


