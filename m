From: zynkx <skydive@megamail.pt>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 22:41:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069886478.3fc52c0e61202@paris-hme1>
References: <1069853846.3fc4ac966be15@paris-hme1>
 <20031126151015.GB4486@cannon.eng.us.uu.net>
 <1069879109.3fc50f45e7331@paris-hme1>
 <200311262048.49827.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200311262048.49827.Antony@Soft-Solutions.co.uk>
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

antony:=20

the only reason why i am doing this is because i am=20
blocking all incoming connectios to my box except=20
portuguese connections. i manage to get all the=20
portuguese ip ranges, put the forward chain to drop=20
and a accepted all the sources i want to get=20
connections from. this way i will only be accepting=20
connetions from portugal, since that the ammount of=20
users i administrate is not enough for that machine to=20
be opened to the whole world.=20

there are in fact lots of users expecting mail to come=20
=66rom those 2 most known smtps, so this forces me to=20
accept connectiosn from those domains :))

the way i see it, filtering with qmail doesn=B4t make=20
any sense, because what i want is not to filter but to=20
accept :)))

please call back to earth if this thoughts are not=20
quite right :))) i will be greatfull

thank you very much for your time and for your=20
words ;))

ZyNkz

C=F3pia Antony Stone <Antony@Soft-Solutions.co.uk>:

> On Wednesday 26 November 2003 8:38 pm, zynkx
> wrote:
>
> > hi Ramin and tanx for your trouble ;))
> >
> > what i am looking for is the adresses from
> hotmail and
> > yahoo from wich smtp connections may come
> from :)
> >
> > i have a smtp running and i need to allow
> traffic
> > coming from these two, (hotmail and yahoo).
>
> I'm not quite sure why you want to accept email
> only from Hotmail and Yahoo,
> and from nowhere else (a lot of people I know
> do the exact opposite!),
> however I still think an easier solution to
> your erquirement is to accept all
> email through your firewall, and then accept
> only mail from Hotmail / Yahoo
> on your mail server - because that can select
> based on the sender's address,
> without needing to know the IPs of their mail
> servers (which may change one
> day without you knowing).
>
> Antony.
>
> --
> If at first you don't succeed, destroy all the
> evidence that you tried.
>
>                                               =20
>      Please reply to the list;
>                                               =20
>            please don't CC me.
>
>
>=20



unix is user friendly. it's just selective when=20
choosing=20
friends.

-------------------------------------------------
Email Enviado utilizando o servi=E7o MegaMail


