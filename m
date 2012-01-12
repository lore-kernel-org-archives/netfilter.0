From: Ye Liu <yeliu@carmelvision.com>
Subject: Re: Invalid arguments when using '-j TEE'
Date: Thu, 12 Jan 2012 10:50:32 -0500
Message-ID: <CAO=pG1DOmPYOpjcO0yOC61bGhAza6JW+=OoSPgiBrxtjUhyg+g@mail.gmail.com>
References: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com>
 <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr> <CAO=pG1DZEaKoWUi+zSxFtLgNuowY1Up5m98JMNoFwn9hcePwdw@mail.gmail.com>
 <4F0DEEAA.5020603@chello.at> <CAO=pG1CPwb5VcTeMzxqtEv+K=XpC7oyV2MNdM1yO0V2qMouoAg@mail.gmail.com>
 <alpine.LNX.2.01.1201120923080.26106@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=zP6ad1nt5bUlA0vKM5Ygbp7CccsjMfJEmqVFyU2OosU=;
        b=dzzIg4S2R0iTwsGRykBdgTh54Ui2JGpr87XTL5icTZ/Cg7Qbph+9hxWyRBd8OskEes
         sJP7NHKuA0tRdxVrF7BCT3Td989U2L+lO2WiRGtaLZyHjk5iVTAlvJyem5roO4Vi5oZg
         F56dbpX3SJR7U0e8PCrS13Sihzrb4jfmzFMKE=
In-Reply-To: <alpine.LNX.2.01.1201120923080.26106@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "mart.frauenlob@chello.at" <mart.frauenlob@chello.at>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dov Berliner <dov@carmelvision.com>

On Thu, Jan 12, 2012 at 3:30 AM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
>>I did more researches, and one thread in this list suggested I should
>>use iptables < 1.4.8 for kernel < 2.6.35, so I tried iptables 1.4.7,
>>but got the same result. Here is command-line output:
>>
>>$ iptables -t mangle -A PREROUTING -j TEE --gateway 192.9.200.29 -v
>>TEE =C2=A0all opt -- in * out * =C2=A00.0.0.0/0 =C2=A0-> 0.0.0.0/0 =C2=
=A0 TEE gw:192.9.200.29
>>iptables: Invalid argument. Run `dmesg' for more information.
>
> Here is the fix I have come up with. Upload to SF is currently
> out of order, so it is not yet in the git repository.
>
> parent aee5aedc63d0bc2d9a826c5e936b83295de20aa9 (v1.41)
> commit a6b06502cace4f921a6b4f56cce81f09446cc34b
> Author: Jan Engelhardt <jengelh@medozas.de>
> Date: =C2=A0 Thu Jan 12 09:21:39 2012 +0100
>
> compat_xtables: fixed mistranslation of checkentry return values
> ---
> =C2=A0doc/api/2.6.17.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A04 ++--
> =C2=A0doc/api/2.6.19.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A04 ++--
> =C2=A0doc/changelog.txt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A03 +++
> =C2=A0extensions/compat_xtables.c | =C2=A0 =C2=A08 --------
> =C2=A04 files changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/doc/api/2.6.17.c b/doc/api/2.6.17.c
> index 3b56e47..08a431d 100644
> --- a/doc/api/2.6.17.c
> +++ b/doc/api/2.6.17.c
> @@ -13,7 +13,7 @@ match:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *hotdrop,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0);
>
> - =C2=A0 =C2=A0 =C2=A0 /* error code */
> + =C2=A0 =C2=A0 =C2=A0 /* true/false */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(*checkentry)(
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ta=
blename,
> @@ -45,7 +45,7 @@ target:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *userdata=
,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0);
>
> - =C2=A0 =C2=A0 =C2=A0 /* error code */
> + =C2=A0 =C2=A0 =C2=A0 /* true/false */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(*checkentry)(
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ta=
blename,
> diff --git a/doc/api/2.6.19.c b/doc/api/2.6.19.c
> index 9bc658f..5fd48da 100644
> --- a/doc/api/2.6.19.c
> +++ b/doc/api/2.6.19.c
> @@ -13,7 +13,7 @@ match:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *hotdrop,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0);
>
> - =C2=A0 =C2=A0 =C2=A0 /* error code */
> + =C2=A0 =C2=A0 =C2=A0 /* true/false */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(*checkentry)(
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ta=
blename,
> @@ -42,7 +42,7 @@ target:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *ta=
rginfo,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0);
>
> - =C2=A0 =C2=A0 =C2=A0 /* error code */
> + =C2=A0 =C2=A0 =C2=A0 /* true/false */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(*checkentry)(
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ta=
blename,
> diff --git a/doc/changelog.txt b/doc/changelog.txt
> index 2ece6be..48d5436 100644
> --- a/doc/changelog.txt
> +++ b/doc/changelog.txt
> @@ -1,6 +1,9 @@
>
> =C2=A0HEAD
> =C2=A0=3D=3D=3D=3D
> +Fixes:
> +- compat_xtables: fixed mistranslation of checkentry return values
> + =C2=A0(affected kernels < 2.6.23)
>
>
> =C2=A0v1.41 (2012-01-04)
> diff --git a/extensions/compat_xtables.c b/extensions/compat_xtables.=
c
> index c5b67a4..26f6a00 100644
> --- a/extensions/compat_xtables.c
> +++ b/extensions/compat_xtables.c
> @@ -110,11 +110,7 @@ static bool xtnu_match_check(const char *table, =
const void *entry,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nm->checkentry =3D=3D NULL)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 23)
> - =C2=A0 =C2=A0 =C2=A0 return nm->checkentry(&local_par);
> -#else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return nm->checkentry(&local_par) =3D=3D 0=
;
> -#endif
> =C2=A0}
> =C2=A0#endif
> =C2=A0#if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2, 6, 28) && \
> @@ -322,11 +318,7 @@ static bool xtnu_target_check(const char *table,=
 const void *entry,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nt->checkentry =3D=3D NULL)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* this is val=
id, just like if there was no function */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 23)
> - =C2=A0 =C2=A0 =C2=A0 return nt->checkentry(&local_par);
> -#else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return nt->checkentry(&local_par) =3D=3D 0=
;
> -#endif
> =C2=A0}
> =C2=A0#endif
>
> --
> # Created with git-export-patch

The fix is working! Thank you, Jan!
