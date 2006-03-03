From: "Stephen J. Smoogen" <smooge@gmail.com>
Subject: Re: out of state packits
Date: Fri, 3 Mar 2006 11:24:44 -0700
Message-ID: <80d7e4090603031024t53b77ba2g2be7ca22260fd983@mail.gmail.com>
References: <10bc97fe0603030639w5a135f9breace8cc43d05c20b@mail.gmail.com>
	<57660.193.173.147.3.1141397972.squirrel@webmail.sterenborg.info>
	<10bc97fe0603030713x10673694na6351b040d12172b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <10bc97fe0603030713x10673694na6351b040d12172b@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter@lists.netfilter.org

On 3/3/06, Ezsra McDonald <ezsra.mcdonald@gmail.com> wrote:
> On 3/3/06, Rob Sterenborg <rob@sterenborg.info> wrote:
> > On Fri, March 3, 2006 15:39, Ezsra McDonald wrote:
> > > Greetings Gurus,
> > >
> > > I have noticed in the past few weeks that my logs
> > > from several hosts show what appear to be rejections on high ports. I
> > > have seen this before on a checkpoint firewall where the issue was ou=
t
> > > of state packits. What would cause this on a network? I don't know
> > > where to start looking for the problem.
> > >
> > > Any ideas?
> > >
> > > Here is an example of one of my logwatch report:
> > >
> > >
> > > Denied 4690 packets on interface eth0
> > >    From 4.79.181.14 - 3 packets
> > >       To 172.25.14.167 - 3 packets
> > >          Service: 4980 (tcp/4980) (RULE 7 -- DENY,eth0,none) - 3 pack=
ets
> > >    From 4.79.181.135 - 8 packets
> > >       To 172.25.14.167 - 8 packets
> > >          Service: 56322 (tcp/56322) (RULE 7 -- DENY,eth0,none) - 6 pa=
ckets
> > >          Service: 65382 (tcp/65382) (RULE 7 -- DENY,eth0,none) - 2 pa=
ckets
> > <snip a long log>
> >
> > Where do you determine these would be out of state ?
> > To me, it just says that (x) packets from (y) to (z) have been denied,
> > probably using "rule 7" which denies something but it doesn't say what.
> >
> > I think, looking at this log, no one can tell without knowing what rule=
s you
> > have in place, but maybe I'm overlooking something.
> >
> >

From what I can tell in the attached log is that you are dropping a
lot of supposed DNS packets. This can be because of a couple of
things:

DNS server is sending late UDP tcp packets and NF closed the state already
Attacker is trying to use a "SPT=3D53" is probably allowed to probe a
network or communicate with slavebots.
Network tom-foolery where a UDP packet gets duplicated etc and you are
seeing 2 packets.

If all the packets in your logwatch look like that (DNS sourceport)
and your box isnt running a DNS cacheing server or similar.. I would
go with #2. If you are running named, djbdns, etc I would look to see
why you are getting late packets./



> > Gr,
> > Rob
> >
>
> I have attached a small portion of the log. The rule is my final
> 'catch all' rule. I am seeing this same anomaly all over my network.
>
> This particular log shows packets SPT=3D53 which is a response to a DNS
> query from this host. There are other services as well so I know its
> not just the DNS server sending back out of state packets.
>
> Let me know if you need more data.
>
>
>


--
Stephen J Smoogen.
CSIRT/Linux System Administrator

