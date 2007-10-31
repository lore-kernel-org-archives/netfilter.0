From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: mangle table question
Date: Wed, 31 Oct 2007 16:23:08 +0100
Message-ID: <47289DDC.6030707@plouf.fr.eu.org>
References: <65CCDBD675D4F545AF59400EBEFE479D014700@av-mail01.aspenview.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <65CCDBD675D4F545AF59400EBEFE479D014700@av-mail01.aspenview.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jason Sigurdur a =E9crit :
>=20
> If a specific rule is matched, does it not exit the chain?

Only if the target is "terminal". ACCEPT, DROP, REJECT are terminal.=20
NAT-specific targets such as SNAT and DNAT are terminal too. LOG is=20
obviously not terminal. Most if not all mangle-specific targets such as=
=20
DSCP are not terminal. Indeed one may want to alter several parts of a=20
packet in the same chain.
