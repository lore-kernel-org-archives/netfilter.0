From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 19:49:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312091949.57424.Antony@Soft-Solutions.co.uk>
References: <20031209190402.GA16255@fobie.net> <200312091915.49683.Antony@Soft-Solutions.co.uk> <20031209194019.GB17111@fobie.net>
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
To: netfilter@lists.netfilter.org

On Tuesday 09 December 2003 7:40 pm, =D6rjan Persson wrote:

> Antony Stone (Antony@Soft-Solutions.co.uk) wrote:
> > If it is not true that the real source IP and the real destination IP
> > exist on the same interface of the netfilter machine, repost your que=
ry
> > with a bit more detail and we may be able to help futher.
>
> The situation is that I have a hostname where there are both SMTP and
> DNS services atm. The mail service is beeing migrated to another host,
> and since I can't just change the IP for the hostname (would break DNS
> services) I would like to have a temporary redirect to the new
> mailservice for the SMTP-service, until the ppl using it has changed
> their mail settings to use the new hostname.
>
> So, I have two external host with two external IP's. They exists on the
> same subnet too. Both uses the same gateway.

i am afraid that in this situation you cannot achieve the solution you wo=
uld=20
like.   DNAT on its own will not work.   DNAT+SNAT will work, but you wil=
l=20
see a constant source IP in your mail server logfiles.   Be happy that th=
is=20
is only a temporary arrangement.

Antony.

--=20
If builders made buildings the way programmers write programs, then the f=
irst=20
woodpecker to come along would destroy civilisation.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


