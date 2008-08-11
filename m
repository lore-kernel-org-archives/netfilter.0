From: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
Subject: Re: conntrackd working, but netfilter not impressed
Date: Mon, 11 Aug 2008 14:23:14 +0200
Message-ID: <0F0E3430135185A207EFA41A@Dirks-MacBook-Pro.local>
References: <BD9F23BEBBF883939AE367D6@Dirks-MacBook-Pro.local>
 <200808111322.58469.misch@multinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808111322.58469.misch@multinet.de>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi Michael,

--On 11. August 2008 13:22:57 +0200 Michael Schwartzkopff=20
<misch@multinet.de> wrote:


> Did you conntrackd tell to import sync'ed tables into the kernel tabl=
es?
> Scripts see:
> /usr/share/doc/examples/sync/ftfw/script_master.sh

That is what I missed. I have looked into the example script now - it l=
ooks=20
like committing the external cache into the kernel tables is something =
to=20
do manually?!?
That means in an active-active setup like mine I would have to commit e=
very=20
second - which of course can be done, but does that make sense? I would=
=20
have expected conntrackd to do it automatically or to have an option th=
at=20
makes it do it automatically.

Thanks for your help.

Dirk

> or whereever your distribution stores doc for conntrackd.
>
> Greetings,
>
> --
> Dr. Michael Schwartzkopff
> MultiNET Services GmbH
> Addresse: Bretonischer Ring 7; 85630 Grasbrunn; Germany
> Tel: +49 - 89 - 45 69 11 0
> Fax: +49 - 89 - 45 69 11 21
> mob: +49 - 174 - 343 28 75
>
> mail: misch@multinet.de
> web: www.multinet.de
>
> Sitz der Gesellschaft: 85630 Grasbrunn
> Registergericht: Amtsgericht M=C3=BCnchen HRB 114375
> Gesch=C3=A4ftsf=C3=BChrer: G=C3=BCnter Jurgeneit, Hubert Martens
>
> ---
>
> PGP Fingerprint: F919 3919 FF12 ED5A 2801 DEA6 AA77 57A4 EDD8 979B
> Skype: misch42



--------------------------------------------------------------
Dirk H. Schulz
IT Systems Service
Wiesenweg 12, 85567 Grafing
Tel. 0 80 92/86 25 68
=46ax. 0 80 92/86 25 72
--------------------------------------------------------------
Technik vom Feinsten - und das n=C3=B6tige Tuning
