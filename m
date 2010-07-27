From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: IPP2P-0.8.2 install for iptable 1.4.4 on linux kernel 2.3.32
Date: Tue, 27 Jul 2010 00:19:37 +0000
Message-ID: <AANLkTik5tD65GGFuHgPpr_RaqH6T9WYdtUfQ0gLzmsip@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=bWnUgzYMihECUK9xllf80hz+54N4r5w9n/5V889CGl0=;
        b=EUZGtHgUQ1lMd306+DJ/1m5MHpqACOdUEeSyrgGRNpt1Jpx1ukFP3hNA15cJUV1VOv
         fw5Sgg1R7xdwW+zLlM5Q6Vr6voqvL3Qz0Fbmrx1gzwlkYZLs+Q49F/NiIWT99Sv6hyNl
         /CsyoPeAn7/9JWwX5TwFkTD+RPP9gBssgJUUY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

hi i've download the source of IPP2P-0.8.2.
my GCC version : 4.4.1
-kernel : linux-2.6.32
-iptables version : 1.4.4
-IPP2P version IPP2P-0.8.2. (tarball)

when make i got this error :
+++++++++++++++++++++++++++++++++
CC [M]  /sources/ipp2p-0.8.2/ipt_ipp2p.o
/sources/ipp2p-0.8.2/ipt_ipp2p.c: In function =C3=A2match=C3=A2:
/sources/ipp2p-0.8.2/ipt_ipp2p.c:751: erreur: =C3=A2const struct sk_buf=
f=C3=A2
has no member named =C3=A2nh=C3=A2
/sources/ipp2p-0.8.2/ipt_ipp2p.c: Hors de toute fonction :
/sources/ipp2p-0.8.2/ipt_ipp2p.c:871: attention : initialization from
incompatible pointer type
/sources/ipp2p-0.8.2/ipt_ipp2p.c:874: attention : initialization from
incompatible pointer type
/sources/ipp2p-0.8.2/ipt_ipp2p.c: In function =C3=A2init=C3=A2:
/sources/ipp2p-0.8.2/ipt_ipp2p.c:883: erreur: implicit declaration of
function =C3=A2ipt_register_match=C3=A2
/sources/ipp2p-0.8.2/ipt_ipp2p.c: In function =C3=A2fini=C3=A2:
/sources/ipp2p-0.8.2/ipt_ipp2p.c:888: erreur: implicit declaration of
function =C3=A2ipt_unregister_match=C3=A2
make[2]: *** [/sources/ipp2p-0.8.2/ipt_ipp2p.o] Erreur 1
make[1]: *** [_module_/sources/ipp2p-0.8.2] Erreur 2
make[1]: quittant le r=C3=83=C2=A9pertoire =C3=82=C2=AB /sources/linux-=
2.6.32.11 =C3=82=C2=BB
make: *** [ipt_ipp2p.ko] Erreur 2

+++++++++++++++++++++++++++++++++

Can you help me solve that problem.
regards.
