From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: more questions about kernel config options for iptables
Date: Tue, 8 Apr 2003 11:09:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304081109.42705.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0304080951320.10915-100000@dell>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304080951320.10915-100000@dell>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Tuesday 08 April 2003 09:54 am, Robert P. J. Day wrote:
> On 8 Apr 2003, Cedric Blancher wrote:
> > My 0.02=A4 about this is that I personaly prefer a configuration
> > script that reflect reality, than something more "user convenient"
> > that could fool people about the way things work. Netfilter insides,
> > as well as kernel insides, are already complicated enough to me, for
> > I do not need stuff that could make me misunderstand something.
> > Reality is that NAT depends on conntrack. Your point would be to
> > invert this for user's sake, and this is, imho, a baaaaad thing ;)
> >
> > I don't know if any of them are reading this thread, but if we could
> > have some core developper's point of vue about his, would be great.
> >
> > It is a very tough subject to discuss how kernel configuration must
> > be presented. I wouldn't show nerd's behaviours, e.g. dumb users do
> > not compile kernel, but I tend to think that if someone wants to
> > build its own kernel, then it's up to him to (try to ?) understand
> > how it is going and what are the choices he's about to make.
>
> yes, i agree with this.  i think i'll just ponder how to reorganize
> that menu to, first of all, have more informative help screens and,
> second, to add what i *think* we agree on is some missing
> dependencies.

Reorganization and clearer help texts would be nice.  If the long-term=20
intention is to 'simplify', I really think a more popular approach would=20
be to offer multiple levels of detail.  In my first response I suggested=20
"make easyconfig" - that grew out of a conversation I had some time ago=20
regarding the complexitly of configuring a kernel prior to build.  Make=20
oldconfig can be helpful, but the ability to pull in the configuration=20
of the current runnning kernel, set it as the base, then offer looser,=20
more generalized selections that hide the lower levels would be helpful=20
for the 'casual' builder.  If we want to make kernel building reasonable=20
for the 'average' windows emigre then such an approach would seem=20
useful.  And I think that needs to be a consideration.  I for one would=20
enjoy clearer (or even extant!) help texts in the config process, and=20
reorganization of options might help, but I want to have access to=20
everything, not have config questions spoon-fed.

OT - are there any plans to bring video card options together, instead of=
=20
the current scheme where they are scattered through Character Devices,=20
Multimedia Devices, and Console Drivers?

> rday
>
> p.s.  is the rest of this list also getting auto-vacation messages
> from respond-dgour?  just wondering if it's coming from *this*
> list.

Yes, it is.  As of about 8 months ago I have a filter to auto-delete=20
them.  Every few months they seem to start up again.  (must be nice to=20
get that many vacations, some for several weeks! :^)

j


