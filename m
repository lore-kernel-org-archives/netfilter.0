From: jobhunts02@aol.com
Subject: H.225.0 "Connect" packet dropped
Date: Thu, 10 Feb 2011 19:14:13 -0500
Message-ID: <8CD9797BF21E50C-1344-3AAA@webmail-m024.sysops.aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

When I have connection tracking enabled in the kernel and use the=C2=A0=
Space=20
Communications Protocol Standard (SCPS), which is a protocol to speed=20
up TCP over satellite, I can no longer start a video call using Polycom=
=20
ViewStationFX.=C2=A0 Using Wireshark, I see the "Connect" packet is bei=
ng=20
dropped.=C2=A0 At the same time, I see "nf_ct_q931: packet dropped" bei=
ng=20
printed to /var/log/messages.=C2=A0 I have verified that the packet bei=
ng=20
dropped is the "Connect" packet.=C2=A0 Other packets before that are no=
t=20
getting dropped, e.g., the "Alert" packet.=C2=A0 This happens because=20
nf_ct_expect_related returns -EBUSY since expect_clash does not return=20
zero.=C2=A0 Without SCPS, the call works fine with connection tracking=20
enabled.=C2=A0
=C2=A0
Why does expect_clash return nonzero?=C2=A0 What is the "clash" it is=20
looking for and is there any reason that SCPS would cause such a=20
clash?=C2=A0 Is there any known incompatibility between SCPS and connec=
tion=20
tracking?=C2=A0
=C2=A0
I am running Linux 2.6.26 on PowerPC.
