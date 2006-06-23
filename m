From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Pom patch error
Date: Fri, 23 Jun 2006 15:54:05 +0200
Message-ID: <449BF27D.7020506@plouf.fr.eu.org>
References: <20060622120928.8174E699BF@smtp.sterenborg.info>
	<60157.193.173.147.3.1150982206.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <60157.193.173.147.3.1150982206.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Rob Sterenborg a =E9crit :
> On Thu, June 22, 2006 14:17, Ali Ozaltin wrote:
>=20
>>How can i install patch-o-matic on 2.6.9-34.0.1.Elsmp kernel version ? =
When
>>i try ./runme pending its giving this error messages ; Do you want to a=
pply
>>this patch [N/y/t/f/a/r/b/w/q/?] y Testing patch submitted/01_2.4.19.pa=
tch...
>=20
> Maybe I'm reading this wrong, but if not then I think it's strange that=
 POM
> tries to use a 2.4.29 patch on a 2.6.9 kernel.

Yes you're reading wrong, Rob, it's a 2.4.19 patch (to upgrade a 2.4.18=20
kernel), not 2.4.29. ;-)

Ali, from this message it looks like you're using a VERY old version of=20
the original patch-o-matic (not patch-o-matic-ng) that was intended for=20
older 2.4 kernels only and was replaced by patch-o-matic-ng. You should=20
use a more recent patch-o-matic-ng (pom-ng) which is intended for recent=20
2.4 kernels (above 2.4.18) and 2.6 kernels. As stated by the 2005-Jan-30=20
announce in the news section of the Netfilter website, there are now no=20
more pom-ng stable releases (I guess a patch is considered stable when=20
it's included in the kernel and removed from pom-ng) but only daily=20
snapshots available here :

ftp://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/
  or
http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/

Avoid the older pom-ng stable release versions in=20
http://ftp.netfilter.org/pub/patch-o-matic-ng/, they're broken.
And of course, apply only the patches you really need.

