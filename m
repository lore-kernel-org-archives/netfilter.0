From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Simulating a "bad" connection.
Date: Fri, 04 May 2007 23:55:40 +0200
Message-ID: <463BABDC.6000106@plouf.fr.eu.org>
References: <200705042201.21985.tommy@svearike.sytes.net>
	<Pine.LNX.4.61.0705042310550.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705042310550.18504@yvahk01.tjqt.qr>
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

Jan Engelhardt a =E9crit :
>=20
>   -m statistic --mode random
>=20
> It might not exist yet either.

Indeed. The 'statistic' match was included in kernel 2.6.18 and requires=20
iptables >=3D 1.3.6.

>>kernel: 2.6.16-rc5
>>iptables: 1.3.4

The 'random' match is supported by iptables 1.3.4, but not by the=20
standard kernel. It needs to be patched with the 'connlimit' patch which=20
used to be included in the patch-o-matic-ng snapshots until=20
patch-o-matic-ng-20060511. Unfortunately such old snapshots are not=20
available on the Netfilter main server any more. They may still be=20
available in some archives or mirrors out there. I think I kept a copy.

