From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: RE: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 13:44:02 +0000
Message-ID: <VI1PR06MB463978C0C72E8CAFFF8CC0ECC5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
 <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
 <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
 <2b96d288-50d9-b64b-f5ac-3343d3b9f631@tootai.net>
 <20200814130842.GF1660@breakpoint.cc>
 <VI1PR06MB4639D0AB412AA72F75A96A06C5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
 <20200814134000.GG1660@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTnqWwnPoSmjEVHuScIHd8Wq9ULEJeK/RCwh5XpZc/M=;
 b=ZerWVt9lKaVZqt7XEBXZgeSZXoJ+qbNFhw1gpsHNO563LQ6ou+K1vSx5URjsHry3rX2td8j/A9jgRfg5D0Kj5rELulZM7pdut1ne+LukwL6tWWLPsM8eSSiYQ0MP3MFNtLdJtA3dLawxm2Kj+Hl0DvhGk2/GBujkmmwTTBtJ3dA=
In-Reply-To: <20200814134000.GG1660@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: Daniel <tech@tootai.net>, Reindl Harald <h.reindl@thelounge.net>, Pablo Neira Ayuso <pablo@netfilter.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com> wrote:
> > > Daniel <tech@tootai.net> wrote:
> > > > dh@peech:~$ sudo nft add chain ip6 mangle prerouting "{ type nat=20
> > > > hook prerouting priority -350 ; policy accept ; }"
> > > > Error: Could not process rule: Operation not supported add chain=20
> > > > ip6 mangle prerouting { type nat hook prerouting priority -350;=20
> > > > policy accept; }
> > >
> > > Historic artifact, try a value larger than -200, e.g. -199.
> > > I've sent a patch to zap this outdated check.
> >
> > Didn't work for me either:
> > #nft add chain ip6 x y {type filter hook input priority \-100\;}
> > nft: invalid option -- '1'
>=20
> Different problem.  Just follow Daniels example and quote everything, i.e=
.  nft add chain ip6 x y "{ type filter hook input priority -100; }"

ah ok that did the trick, thx a lot.

Andy
