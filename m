From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Untagged Frames
Date: Sat, 18 Jun 2011 10:29:04 +0200
Message-ID: <4DFC61D0.7030009@plouf.fr.eu.org>
References: <4DFBC1CD.3000205@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DFBC1CD.3000205@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Hello,

Jonathan Tripathy a =E9crit :
>=20
> Does ebtables have the facility to make sure that any frames entering=
 a=20
> bridge must be untagged (i.e. have no 802.1q tag)?

I guess that it can be done by matching the 802.1q ethertype 0x8100.
