From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables, after adding a rule without any action, nft doesn't
 return correctly
Date: Thu, 17 Jul 2014 16:14:28 +0200
Message-ID: <20140717141428.GA4063@salvia>
References: <DA2F5FF8-CA37-48D0-BEFC-F1D78A0C8415@redhat.com>
 <20140716160716.GA7906@salvia>
 <9D590D9F-92DE-4832-8382-54E3C42BA881@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9D590D9F-92DE-4832-8382-54E3C42BA881@redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ryo Fujita <rfujita@redhat.com>
Cc: netfilter@vger.kernel.org

On Thu, Jul 17, 2014 at 08:13:12AM +0900, Ryo Fujita wrote:
> Hi Pablo-san and all,
>=20
> Thank you so much!
> You made me clear.
>=20
> > You can add rules without any action.
>=20
> I understand it=E2=80=99s the spec not a bug.
>=20
> > Try -n to disabling name resolution:
> >=20
> > # nft -n list table inet filter
>=20
>=20
> Yes, I check that reverse lookup fails as you pointed out.
>=20
> >> My environment was as followings.
> >> nftables-0.100-3.20140704git.fc21.x86_64
> >=20
> > Please, use latest when testing.
> >=20
> > http://www.netfilter.org/projects/nftables/downloads.html
>=20
>=20
> The reason why I=E2=80=99m using the slight old version is to write a
> magazine article introducing nftables. It=E2=80=99s easy for readers =
to
> install the version I checked with RPM or archive like
> 'nftables-0.3=E2=80=99.  Anyway, I=E2=80=99ll test the latest before =
sending a
> report to this ML.

Not a good idea to stick to old versions. We're still changing syntax
in some aspects and resolving bugs at this stage. The user document
aims to be in sync with latest. You should recommend people to stick
to latest until 1.0 comes out.
