From: Stefan.Weigel@mondial.de
Subject: Antwort: Re: can't initialize iptables table `filter': Bad file
	descriptor
Date: Wed, 5 Oct 2005 12:05:13 +0200
Message-ID: <OF223A4AEE.268434D7-ONC1257091.00371030-C1257091.003768D9@mondial.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org

Hi!
I found the problem. Some compiler flags were set in environment:

CPPFLAGS / CFLAGS =3D -s -O3 -fomit-frame-pointer -Wall -malign-functions=
=3D4=20
-malign-double -march=3Dpentiumpro -fexpensive-optimizations

With unsetting these variables I have a working iptables version.


Best regards

Stefan Weigel
IT

Mondial Assistance Deutschland GmbH
Riedenburger Strasse 2
D-81677 M=FCnchen
Telefon +49 (89) 20 80 1 - 1085
Telefax +49 (89) 20 80 1 - 1907
mailto: stefan.weigel@mondial.de
http://www.mondial.de





Henrik Nordstrom <hno@marasystems.com>
30.09.2005 23:19

=20
        An:     Stefan.Weigel@mondial.de
        Kopie:  netfilter@lists.netfilter.org
        Thema:  Re: can't initialize iptables table `filter': Bad file desc=
riptor


On Fri, 30 Sep 2005 Stefan.Weigel@mondial.de wrote:

> I compiled kernel 2.6.13.2 and iptables 1.3.3 with some extra modules=20
from
> patch-o-matic-ng. Compiling went good.
> But when doing a
>
> # iptables -L
>
> I get the following error message:
>
> iptables v1.3.3: can't initialize iptables table `filter': Bad file
> descriptor
> Perhaps iptables or your kernel needs to be upgraded.


Is your iptables compiled to the correct kernel headers? (KERNEL=5FDIR=20
argument when compiling iptables)

Regards
Henrik





