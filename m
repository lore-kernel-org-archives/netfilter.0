From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: H.225.0 "Connect" packet dropped
Date: Fri, 11 Feb 2011 09:20:11 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102110916070.16335@blackhole.kfki.hu>
References: <8CD9797BF21E50C-1344-3AAA@webmail-m024.sysops.aol.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-857910720-1297412411=:16335"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8CD9797BF21E50C-1344-3AAA@webmail-m024.sysops.aol.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: jobhunts02@aol.com
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-857910720-1297412411=:16335
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 10 Feb 2011, jobhunts02@aol.com wrote:

> When I have connection tracking enabled in the kernel and use the=C2=A0Sp=
ace
> Communications Protocol Standard (SCPS), which is a protocol to speed up =
TCP
> over satellite, I can no longer start a video call using Polycom
> ViewStationFX.=C2=A0 Using Wireshark, I see the "Connect" packet is being=
 dropped.=C2=A0
> At the same time, I see "nf_ct_q931: packet dropped" being printed to
> /var/log/messages.=C2=A0 I have verified that the packet being dropped is=
 the
> "Connect" packet.=C2=A0 Other packets before that are not getting dropped=
, e.g.,
> the "Alert" packet.=C2=A0 This happens because nf_ct_expect_related retur=
ns -EBUSY
> since expect_clash does not return zero.=C2=A0 Without SCPS, the call wor=
ks fine
> with connection tracking enabled.=C2=A0
> =C2=A0
> Why does expect_clash return nonzero?=C2=A0 What is the "clash" it is loo=
king for
> and is there any reason that SCPS would cause such a clash?=C2=A0 Is ther=
e any
> known incompatibility between SCPS and connection tracking?=C2=A0

Record the full traffic with "tcpdump -s 0" and post the pcap file.

Even if you post your question fourth time, the answer will still be the=20
same.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-857910720-1297412411=:16335--
