From: ads nat <adsnat@yahoo.com>
Subject: Re: Upper limit of users for iptables firewall
Date: Thu, 14 Oct 2004 22:47:25 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015054725.8539.qmail@web60403.mail.yahoo.com>
References: <1097778582.21962.11.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097778582.21962.11.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jose Maria Lopez <jkerouac@bgsec.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

hi,
I am having 512 Mbps bandwidth. Users are mainly
browsing Web and using email facility. I am using
squid for cache. I have about 10 % cache so i think
total upper bandwidth availability will be aroung 600
Kbps. Bandwidthwise there is no problem. My worry is
if iptables processing for 400 users with various acl
s should not slow down firwall processing due to
hardware configuration.
Thanks for support.


--- Jose Maria Lopez <jkerouac@bgsec.com> wrote:

> El jue, 14 de 10 de 2004 a las 09:46, ads nat
> escribi=F3:
> > Hi,
> > My Redhat linux 9.0 gateway server is with
> iptables
> > firewall. I am defining security rules based on
> mac
> > address of 400 users.
> > My server configure is=20
> > 1) Intel Pentium IV 2.4 Ghz processor.
> > 2) 512 MB DD RAM
> > 3) 40 GB hard disc.
> >=20
> > Will it be able to server request of 400 users?
> > I am doubtfull about performance of iptables
> firewall
> > for this load but want to avoid commercial
> firewall.
> >=20
> > Has anybody used Iptables firewall for this user
> > traffic or more than this.
> > Please guide me for same.
> >=20
> > Thanks for support.
> >=20
> >=20
> > slow fireawll Can someone give ideaWhat=20
>=20
> With that kind of machine in my opinion you
> shouldn't have
> any problems to serve 400 users, but it depends on
> the
> bandwidth they are using.
>=20
> --=20
> Jose Maria Lopez Hernandez
> Director Tecnico de bgSEC
> jkerouac@bgsec.com
> bgSEC Seguridad y Consultoria de Sistemas
> Informaticos
> http://www.bgsec.com
> ESPA=D1A
>=20
> The only people for me are the mad ones -- the ones
> who are mad to live,
> mad to talk, mad to be saved, desirous of everything
> at the same time,
> the ones who never yawn or say a commonplace thing,
> but burn, burn, burn
> like fabulous yellow Roman candles.
>                 -- Jack Kerouac, "On the Road"
>=20
>=20
>=20



	=09
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

