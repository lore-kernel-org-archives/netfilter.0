From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Invalid arguments when using '-j TEE'
Date: Thu, 12 Jan 2012 09:30:53 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201120923080.26106@frira.zrqbmnf.qr>
References: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com> <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr> <CAO=pG1DZEaKoWUi+zSxFtLgNuowY1Up5m98JMNoFwn9hcePwdw@mail.gmail.com> <4F0DEEAA.5020603@chello.at>
 <CAO=pG1CPwb5VcTeMzxqtEv+K=XpC7oyV2MNdM1yO0V2qMouoAg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAO=pG1CPwb5VcTeMzxqtEv+K=XpC7oyV2MNdM1yO0V2qMouoAg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Ye Liu <yeliu@carmelvision.com>
Cc: "mart.frauenlob@chello.at" <mart.frauenlob@chello.at>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dov Berliner <dov@carmelvision.com>


On Wednesday 2012-01-11 23:03, Ye Liu wrote:
>>>>> I need to setup iptables rules to tee the traffic, so I've tried =
to
>>>>> add the following rule:
>>>>> $> =C2=A0iptables -t mangle -A PREROUTING -j TEE --gateway xxx.xx=
x.xxx.xxx
>>>>> But the command gives an error, says
>>>>> $> =C2=A0iptables: Invalid argument. Run `dmesg' for more informa=
tion.
>>>>
>>>> xxx.xxx.xxx.xxx is of course not a valid IP address.
>>
>> Forget Jan, he once again proved he's the biggest asshole on the lis=
t.
>
>LOL

It's a form of Godwin's law (and some people - like Mart - just have to=
 openly
state they have nothing better to do).


>I did more researches, and one thread in this list suggested I should
>use iptables < 1.4.8 for kernel < 2.6.35, so I tried iptables 1.4.7,
>but got the same result. Here is command-line output:
>
>$ iptables -t mangle -A PREROUTING -j TEE --gateway 192.9.200.29 -v
>TEE  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0   TEE gw:192.9.200=
=2E29
>iptables: Invalid argument. Run `dmesg' for more information.

Here is the fix I have come up with. Upload to SF is currently
out of order, so it is not yet in the git repository.

parent aee5aedc63d0bc2d9a826c5e936b83295de20aa9 (v1.41)
commit a6b06502cace4f921a6b4f56cce81f09446cc34b
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Thu Jan 12 09:21:39 2012 +0100

compat_xtables: fixed mistranslation of checkentry return values
---
 doc/api/2.6.17.c            |    4 ++--
 doc/api/2.6.19.c            |    4 ++--
 doc/changelog.txt           |    3 +++
 extensions/compat_xtables.c |    8 --------
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/doc/api/2.6.17.c b/doc/api/2.6.17.c
index 3b56e47..08a431d 100644
--- a/doc/api/2.6.17.c
+++ b/doc/api/2.6.17.c
@@ -13,7 +13,7 @@ match:
 		int *hotdrop,
 	);
=20
-	/* error code */
+	/* true/false */
 	int
 	(*checkentry)(
 		const char *tablename,
@@ -45,7 +45,7 @@ target:
 		void *userdata,
 	);
=20
-	/* error code */
+	/* true/false */
 	int
 	(*checkentry)(
 		const char *tablename,
diff --git a/doc/api/2.6.19.c b/doc/api/2.6.19.c
index 9bc658f..5fd48da 100644
--- a/doc/api/2.6.19.c
+++ b/doc/api/2.6.19.c
@@ -13,7 +13,7 @@ match:
 		int *hotdrop,
 	);
=20
-	/* error code */
+	/* true/false */
 	int
 	(*checkentry)(
 		const char *tablename,
@@ -42,7 +42,7 @@ target:
 		const void *targinfo,
 	);
=20
-	/* error code */
+	/* true/false */
 	int
 	(*checkentry)(
 		const char *tablename,
diff --git a/doc/changelog.txt b/doc/changelog.txt
index 2ece6be..48d5436 100644
--- a/doc/changelog.txt
+++ b/doc/changelog.txt
@@ -1,6 +1,9 @@
=20
 HEAD
 =3D=3D=3D=3D
+Fixes:
+- compat_xtables: fixed mistranslation of checkentry return values
+  (affected kernels < 2.6.23)
=20
=20
 v1.41 (2012-01-04)
diff --git a/extensions/compat_xtables.c b/extensions/compat_xtables.c
index c5b67a4..26f6a00 100644
--- a/extensions/compat_xtables.c
+++ b/extensions/compat_xtables.c
@@ -110,11 +110,7 @@ static bool xtnu_match_check(const char *table, co=
nst void *entry,
 		return false;
 	if (nm->checkentry =3D=3D NULL)
 		return true;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 23)
-	return nm->checkentry(&local_par);
-#else
 	return nm->checkentry(&local_par) =3D=3D 0;
-#endif
 }
 #endif
 #if LINUX_VERSION_CODE >=3D KERNEL_VERSION(2, 6, 28) && \
@@ -322,11 +318,7 @@ static bool xtnu_target_check(const char *table, c=
onst void *entry,
 	if (nt->checkentry =3D=3D NULL)
 		/* this is valid, just like if there was no function */
 		return true;
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 23)
-	return nt->checkentry(&local_par);
-#else
 	return nt->checkentry(&local_par) =3D=3D 0;
-#endif
 }
 #endif
=20
--=20
# Created with git-export-patch
