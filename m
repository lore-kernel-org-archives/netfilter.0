From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Trouble getting SYNPROXY to work.
Date: Tue, 12 Nov 2019 19:23:29 +0000
Message-ID: <20191112142326.2ad4acf3@playground>
References: <3018728.1mgFJ8EcOk@topolinux>
        <3abdbb03-e10c-938f-bfb1-5e10764e1a3f@gmail.com>
        <2490043.Bzh1xko5Hd@topolinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.wpi.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt3Yis7RLgwauWuCTrqV7ygef94szwgI5rlMnuGOqL8=;
 b=lK6pzdgRHIVHCMHcIg44zwP8F4k5PKNdFXwbBX8XwcVSuL0lllSXVdPLoM2E20hTa+Ha4DSnkxaIr56vxJ5kUkAPPkOIKU9vtpI5R52nN74QSwlztKcPHYm05l+W9xLGWmpyzalX0kq8k49teYrYy3w48JKcohMe6IQYHxoxKV4=
In-Reply-To: <2490043.Bzh1xko5Hd@topolinux>
Content-Language: en-US
Content-ID: <7E5B5CA6719CE140A7D23B6474438413@namprd22.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 12 Nov 2019 19:31:54 +0100
Pigi <pigi@frumar.it> wrote:

> On Tuesday 12 November 2019 11:37:29 Fatih USTA wrote:
> > Hi Pierluigi,
> >=20
> > If you don't have ip address on br0 interface. =20
>=20
>=20
> But, Fatih, I do have an IP address on br0:
>=20
> root@firewall:~# ifconfig br0                                            =
                                                                           =
                                                             =20
> br0: flags=3D4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500              =
                                                                           =
                                                               =20
>         inet 10.0.1.51  netmask 255.255.255.0  broadcast 10.0.2.255      =
                                                                           =
                                             =20
Broadcast address doesn't match address/mask. Fix and verify you have no ot=
her config errors.
