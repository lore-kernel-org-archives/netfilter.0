From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Upper limit of users for iptables firewall
Date: 14 Oct 2004 23:39:31 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097778582.21962.11.camel@nostromo.bgsecm.com>
References: <20041014074601.27218.qmail@web60406.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041014074601.27218.qmail@web60406.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El jue, 14 de 10 de 2004 a las 09:46, ads nat escribi=C3=B3:
> Hi,
> My Redhat linux 9.0 gateway server is with iptables
> firewall. I am defining security rules based on mac
> address of 400 users.
> My server configure is=20
> 1) Intel Pentium IV 2.4 Ghz processor.
> 2) 512 MB DD RAM
> 3) 40 GB hard disc.
>=20
> Will it be able to server request of 400 users?
> I am doubtfull about performance of iptables firewall
> for this load but want to avoid commercial firewall.
>=20
> Has anybody used Iptables firewall for this user
> traffic or more than this.
> Please guide me for same.
>=20
> Thanks for support.
>=20
>=20
> slow fireawll Can someone give ideaWhat=20

With that kind of machine in my opinion you shouldn't have
any problems to serve 400 users, but it depends on the
bandwidth they are using.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


