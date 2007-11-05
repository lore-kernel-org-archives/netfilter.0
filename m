From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ipt_random status
Date: Mon, 05 Nov 2007 17:10:05 +0100
Message-ID: <472F405D.9030803@plouf.fr.eu.org>
References: <20071105150734.GA26774@santefisi.caos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071105150734.GA26774@santefisi.caos.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter users mailing list <netfilter@vger.kernel.org>

Hello,

Stefano Sabatini a =E9crit :
>=20
> I'm interested in a random filtering rule for iptables: I read about
> the ipt_randon extension, so I downloaded the patch-o-matic SVN but I
> checked that it has been removed from the trunk since revision 6568.

The random function has been moved to the 'statistic' match, available=20
since kernel 2.6.18 and iptables 1.3.6.
