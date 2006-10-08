From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: 2.4.33.3 kernel & pptp-conntrack-nat
Date: Sun, 08 Oct 2006 12:13:34 +0200
Message-ID: <4528CF4E.6060705@plouf.fr.eu.org>
References: <45276000.1070506@network1.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45276000.1070506@network1.ca>
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

Blake Patton a =E9crit :
> I am attempting to to add the pptp-conntrack-nat from patch-o-matic and
> I receive the following error,
>=20
> unable to find ladd slot in src usr/src/linux/net/ipv4/netfilter/Config=
.in

I just tried to apply the pptp-conntrack-nat patch from the latest=20
patch-o-matic-ng (20060511) which contains it on a 2.4.33.3 kernel tree=20
and it worked. However it failed to restore Documentation/Configure.help=20
when I tried to reverse the patch.

What version of the patch-o-matic are you using ?

