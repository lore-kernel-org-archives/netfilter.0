From: Michael Gale <mgale@utilitran.com>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 12:49:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209124930.79f9bb13.mgale@utilitran.com>
References: <20031209190402.GA16255@fobie.net>
	<200312091915.49683.Antony@Soft-Solutions.co.uk>
	<20031209194019.GB17111@fobie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209194019.GB17111@fobie.net>
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
To: =?ISO-8859-1?Q?=D6rjan?= Persson <orange@fobie.net>
Cc: netfilter@lists.netfilter.org


hmmm.... what about ICMP redirect ?

I can not remember if the host you are redirecting to has to be on the same=
 subnet as the client host :(

If so then it would not work.

Michael.

On Tue, 9 Dec 2003 20:40:19 +0100
=D6rjan Persson <orange@fobie.net> wrote:

> Antony Stone (Antony@Soft-Solutions.co.uk) wrote:
> >=20
> > If it is not true that the real source IP and the real destination IP e=
xist on=20
> > the same interface of the netfilter machine, repost your query with a b=
it=20
> > more detail and we may be able to help futher.
> >=20
>=20
> The situation is that I have a hostname where there are both SMTP and
> DNS services atm. The mail service is beeing migrated to another host,
> and since I can't just change the IP for the hostname (would break DNS
> services) I would like to have a temporary redirect to the new
> mailservice for the SMTP-service, until the ppl using it has changed
> their mail settings to use the new hostname.
>=20
> So, I have two external host with two external IP's. They exists on the
> same subnet too. Both uses the same gateway.
>=20
> These are the rules I tried to use, which translates the users IP to the
> first servers IP:
> iptables -t nat -A PREROUTING -p tcp --dport 33 -i eth0 -j DNAT --to host=
2:44
> iptables -t nat -A POSTROUTING -d host2 -p tcp --dport 25 -j SNAT --to ho=
st1
>=20
> Hope that's enough information to get you into my problem!
>=20
> Thanks for letting me take your time! :)
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation

