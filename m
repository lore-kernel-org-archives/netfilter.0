From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: unable to start nftables
Date: Sat, 12 Aug 2023 18:29:40 +0200
Message-ID: <4193c7c1-6fb7-769d-a2f4-d02819a6ea38@thelounge.net>
References: <7953ed4a-eaaf-feb6-bc09-e1179b754253@gmx.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <7953ed4a-eaaf-feb6-bc09-e1179b754253@gmx.fr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Fran=c3=a7ois_Patte?= <francois.patte@gmx.fr>, netfilter@vger.kernel.org



Am 12.08.23 um 17:18 schrieb Fran=C3=A7ois Patte:
> Bonjour,
>=20
> I am currently unable to start nftables service, the answer is:
>=20
> internal:0:0-0: Error: Could not open file
> "/etc/sysconfig/nftables.conf": Permission denied
>=20
> file /etc/sysconfig/nftables.conf exists and have 755 permissions.
>=20
> What can I do?

sounds like SELinux / AppAmor problem - that's why you should provide=20
informations about your system - we don't even know your distribution=20
nor do you provide your service unit or even the init-system
