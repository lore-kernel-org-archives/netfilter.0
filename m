From: Felipe W Damasio <felipewd@gmail.com>
Subject: Re: ebtables broute DROP problem in production environment
Date: Thu, 24 Dec 2009 11:13:16 -0200
Message-ID: <8a87046f0912240513m4c3cd0f2u565ef8e8b849f58@mail.gmail.com>
References: <8a87046f0912231019l76e69a9eg52a529023d02237b@mail.gmail.com>
	 <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=O3l66FsgapBwGAA7SjJLKLyfrfAMVtBEIWpNrk5z3+0=;
        b=BFPOKNUji/P4kD+3KYa2flGfOQlSSzHk9SCqnrI2B9UDubsJKQ9sU900Y3xPri7lO6
         sHHcL4m1wc3JX2fSmpDWiJrKwYbbNREk6uvxYK+k4bbKl3tDzhFQzfxwVWsrDjpPGsB9
         5WjstUIOzLJrkc5+AAhGebiYLU04lhO9C/9Oc=
In-Reply-To: <8a87046f0912231022g438141afpfaa647ac0d01cdda@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Bruno Gustavo Wallauer <brunogw@gmail.com>

  Hi,

2009/12/23 Felipe W Damasio <felipewd@gmail.com>:
> =A0=A0But when I plug eth0 on the production environment network (whi=
ch
> uses multiple VLANs, one for the users and another for the internet),
> http traffic stop working (ie. doesn't get routed to squid).

  One other thing: I tried using --log-level debug --log-ip log--arp
on the ebtables rules, and had several entries on my syslog such as
this:

Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC sour=
ce
=3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1a:a2:5d:70:8d proto =3D 0x0800 I=
P
SRC=3D189.10.205.122 IP DST=3D189.73.192.220, IP tos=3D0x00, IP proto=3D=
6
SPT=3D3774 DPT=3D80
Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC sour=
ce
=3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1a:a2:5d:70:8d proto =3D 0x0800 I=
P
SRC=3D189.10.204.12 IP DST=3D64.233.163.86, IP tos=3D0x00, IP proto=3D6
SPT=3D1260 DPT=3D80
Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC sour=
ce
=3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1d:71:b0:23:11 proto =3D 0x0800 I=
P
SRC=3D189.58.246.156 IP DST=3D72.21.81.133, IP tos=3D0x00, IP proto=3D6
SPT=3D2253 DPT=3D80
Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC sour=
ce
=3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1d:71:b0:23:11 proto =3D 0x0800 I=
P
SRC=3D189.58.247.99 IP DST=3D69.175.26.18, IP tos=3D0x00, IP proto=3D6
SPT=3D49392 DPT=3D80
Dec 23 19:24:47 hyper kernel: ebtables-broute IN=3Deth0 OUT=3D MAC sour=
ce
=3D 00:21:a0:ce:9d:24 MAC dest =3D 00:1a:a2:5d:70:8d proto =3D 0x0800 I=
P
SRC=3D201.66.236.140 IP DST=3D174.140.128.6, IP tos=3D0x00, IP proto=3D=
6
SPT=3D2060 DPT=3D80

  I suppose it means that the ebtables rules are working. But why
aren't they seen by the iptables rules?

  Again, I tried using a single cross-cable connected machine and
these rules worked (and got logged just the the above).

  Could this be a kernel bug?

  Cheers,

=46elipe Damasio
