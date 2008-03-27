From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: PATCHES AGAIN...
Date: Thu, 27 Mar 2008 11:37:28 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803271116260.22661@fbirervta.pbzchgretzou.qr>
References: <47EB4AC7.5040202@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47EB4AC7.5040202@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter list <netfilter@vger.kernel.org>


On Thursday 2008-03-27 08:20, G=E1sp=E1r Lajos wrote:
>
> I have a "few" patches against the following setup:
>
> Kernel: 2.6.24.4
> iptables: 7424 svn
> ipset: 7424 svn
> patch-o-matic-ng: 7424 svn
> chaostables: 66 svn
> gcc: 4.3.1 20080309
>
> "Changelog:"
> patch-o-matic: recognise the latest iptables svn
> iptables: remove the compiling warnings ( { .name =3D NULL } )

Warnings have already been addressed in patches of mine in the
xtables branch, but as it turned out, the move to git did not
happen yet, so an official merge did not happen yet...
svn is not the newest stack, double work comes up *sigh*
it's all floating in a big soup-pot right now, but at least
the branch is available.

> pom-patches: repair incompatible type warnings
> etc. .... :-D
>
> WorksForMe TM :D
>
> To Jan Engelhardt:
>
> I have seen a v0.8 version of your chaostables, but it is not
> included in the svn. Would you update the repository?

Xtables-addons (a projected pom replacement) has the newest chaostables
modules, and is also available via git.
