From: Abylai Ospan <aospan@netup.ru>
Subject: Re: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 23:29:20 +0000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096414159.3163.153.camel@alkaloid.netup.ru>
References: <1096400937.3163.134.camel@alkaloid.netup.ru>
	<1096387044.2330.54.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096387044.2330.54.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="koi8-r"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

thanks for replay :)=20
I see this way already, but it need to make some help scripts which not
estetical :)

> On Tue, 2004-09-28 at 15:48, Abylai Ospan wrote:
> > Hello, all !
> >=20
> > May be this question in FAQ but I can't find it ;-( I have 3 (or more=
)
> > identical rules in one (for example - INPUT) chain.
> > If I do command:
> > iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT=20
> >=20
> > the first rule is deleted only. Is there any command line option to
> > remove all identical rules in one chain ?
> >=20
> > wbr, Abylai
>=20
> AFAIK, there is no way to make "-D" delete multiple, identical rules.=20
> if you have that rule in there multiple times, hit <up-arrow><enter> a
> few times until you get:
>=20
>   iptables: Bad rule (does a matching rule exist in that chain?)
>=20
> if you use a script to flush/reload rules, you normally won't run into
> this situation.
>=20
> -j
--=20
=F3 =D5=D7=C1=D6=C5=CE=C9=C5=CD,
=E1=C2=D9=CC=C1=CA
=EB=CF=CD=D0=C1=CE=C9=D1 NetUP


