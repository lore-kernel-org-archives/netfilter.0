From: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Subject: RE: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 11:43:23 +0000
Message-ID: <VI1PR06MB46391DA227E599043FBC4B4FC5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hitachi-powergrids.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRK9g+9DKmLYiJEfdGHBM+Z11k1oYin+8ENKyICBoNM=;
 b=NgI4iCdOTGOlqYOyr2cny6X77lDgJ1vL+NCT+DNEtIUhEZ6/xNpOwGi3FqP5JemgVZ5esPvlQxJBlFZlJOTiPhP2zUxXAOiwGmuSj5I3sx0yxaw2XfcGtYE+YTuJHM0PZhLSiLsx4ZV8rQ+X3h9SjEjlqLliB7UZBdyu/Pkn0JA=
In-Reply-To: <20200814110749.GA30331@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

Thx a lot, that worked.
I expected the add cmd to produce an error since the chain already exists, =
but seems to work fine.

Andreas Hoefler
=20

On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
> Hi
>
> I have a chain with default policy drop.
> I would like to first have the default policy set to accept, then add rul=
es and later change it to drop.
> Is this possible?

For the record:

 nft add chain x y { policy accept\; }

Assuming an existing basechain 'y'. The backlash (\) before the semicolon i=
s there in case of invoking this from bash.
