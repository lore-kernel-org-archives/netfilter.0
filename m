From: Stefano Sabatini <stefano.sabatini-lala@poste.it>
Subject: Re: ipt_random status
Date: Mon, 5 Nov 2007 10:32:55 +0100
Message-ID: <20071105093255.GA10259@santefisi.caos.org>
References: <20071105150734.GA26774@santefisi.caos.org> <472F405D.9030803@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <472F405D.9030803@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter users mailing list <netfilter@vger.kernel.org>

On date Monday 2007-11-05 17:10:05 +0100, Pascal Hambourg wrote:
> Hello,
>
> Stefano Sabatini a =E9crit :
>> I'm interested in a random filtering rule for iptables: I read about
>> the ipt_randon extension, so I downloaded the patch-o-matic SVN but =
I
>> checked that it has been removed from the trunk since revision 6568.
>
> The random function has been moved to the 'statistic' match, availabl=
e=20
> since kernel 2.6.18 and iptables 1.3.6.
[...]

Thanks you so much, well I see:
iptables -m statistic --help

Shouldn't it be mentioned in the iptables man page?

http://ovid.rdsct.ro/log/modules/index

Best regards.
--=20
Stefano Sabatini
Linux user number 337176 (see http://counter.li.org)
