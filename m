From: Michael Gale <mgale@utilitran.com>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 13:11:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209131115.619a8638.mgale@utilitran.com>
References: <20031209190402.GA16255@fobie.net>
	<20031209194019.GB17111@fobie.net>
	<20031209124930.79f9bb13.mgale@utilitran.com>
	<200312091956.40790.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312091956.40790.Antony@Soft-Solutions.co.uk>
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


But could you now setup a IPTABLE rule that say:

iptables -t nat -A PREROUTING -p tcp --dport 25 -j ....

I would have to double check the reject target options to see if icmp redir=
ects are part of them.

Michael.


On Tue, 9 Dec 2003 19:56:40 +0000
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 09 December 2003 7:49 pm, Michael Gale wrote:
>=20
> > hmmm.... what about ICMP redirect ?
> >
> > I can not remember if the host you are redirecting to has to be on the =
same
> > subnet as the client host :(
>=20
> Unfortunately ICMP redirects would affect ALL connections coming in to th=
e=20
> machine, SMTP, DNS, or anything else.
>=20
> I do not think this is what =D6rjan wants to happen.
>=20
> Antony.
>=20
> > On Tue, 9 Dec 2003 20:40:19 +0100 =D6rjan Persson <orange@fobie.net> wr=
ote:
> >
> > > Antony Stone (Antony@Soft-Solutions.co.uk) wrote:
> > > > If it is not true that the real source IP and the real destination =
IP
> > > > exist on the same interface of the netfilter machine, repost your q=
uery
> > > > with a bit more detail and we may be able to help futher.
> > >
> > > The situation is that I have a hostname where there are both SMTP and
> > > DNS services atm. The mail service is beeing migrated to another host,
> > > and since I can't just change the IP for the hostname (would break DNS
> > > services) I would like to have a temporary redirect to the new
> > > mailservice for the SMTP-service, until the ppl using it has changed
> > > their mail settings to use the new hostname.
> > >
> > > So, I have two external host with two external IP's. They exists on t=
he
> > > same subnet too. Both uses the same gateway.
> > >
> > > These are the rules I tried to use, which translates the users IP to =
the
> > > first servers IP:
> > > iptables -t nat -A PREROUTING -p tcp --dport 33 -i eth0 -j DNAT --to
> > > host2:44 iptables -t nat -A POSTROUTING -d host2 -p tcp --dport 25 -j
> > > SNAT --to host1
> > >
> > > Hope that's enough information to get you into my problem!
> > >
> > > Thanks for letting me take your time! :)
>=20
> --=20
> It is also possible that putting the birds in a laboratory setting=20
> inadvertently renders them relatively incompetent.
>=20
>  - Daniel C Dennet
>=20
>                                                      Please reply to the =
list;
>                                                            please don't C=
C me.
>=20
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation

