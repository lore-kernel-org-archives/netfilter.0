From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: Wed, 23 Oct 2002 00:31:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021023003146.D8681@funkyjesus.org>
References: <1035317344.8858.14.camel@elendil> <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain>; from rpjday@mindspring.com on Tue, Oct 22, 2002 at 04:10:46PM -0400
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Tue, Oct 22, 2002 at 04:10:46PM -0400, Robert P. J. Day wrote:
> On 22 Oct 2002, Cedric Blancher wrote:
> > > Le mar 22/10/2002 =E0 20:57, Robert P. J. Day a =E9crit :
> > >   i've had a number of people tell me that, while they put a good deal
> > > of thought into their INPUT filtering, they simply ACCEPT all outgoing
> > > traffic since, if their input filtering is working properly, there's
> > > no reason to stop outgoing packets.
> > >   comments?
> >=20
> > Once you have accepted the fact that your box can get compromised, you
> > easily understand why you should filter outgoing traffic. Moreover,
> > maximum security relies on the "lesser privilege rule" which specifies
> > that an object must not be allowed to do more than he has to. According
> > to this, you have to filter network output.

Agreed.

> i understand that, for extra security, you should also filter on the
> OUTPUT chain.  but someone suggested to me that, if i get hacked because
> someone gets through my INPUT filter rules, they have a good chance of
> being able to change my ruleset anyway and remove the filtering.

Not true.  Compromising some user level application, or some chrooted
server, does not automatically allow the malicious third party to alter your
firewall rules.

> this is why this person suggested that i should concentrate my efforts on
> hardening my INPUT filter, and not worry a whole lot about the OUTPUT
> ruleset.

Security is achieved through strength in depth.  If you're running any kind
of server you will have to allow packets in, to a webserver say.  However,
not allowing that webserver to do anything but send replies, rather than
permitting it to do anything ( DoS the Net, download files to the local
system, and so on ) will greatly restrict the options at the malicious third
party's disposal.

> in other words, if i get hacked, i'm pretty much toast anyway,

Not true.

> and can't trust *anything* about my system anymore.

Not true.

> i realize it sounds like having sloppier security not worrying about the
> OUTPUT ruleset.  i guess it would help me if someone could provide
> *specific* examples of how OUTPUT filtering adds to security beyond what
> would be provided by a well-designed INPUT ruleset.  a pointer to an FAQ
> or some other link would be fine.

"--cmd-owner" is your friend, your close, personal, bestest friend.

--=20
FunkyJesus System Administration Team


