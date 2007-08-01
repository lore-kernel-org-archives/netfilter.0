From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: two subnets...
Date: Wed, 01 Aug 2007 16:04:13 +0200
Message-ID: <46B092DD.7030700@plouf.fr.eu.org>
References: <46ADBDF0.3020200@mp.pl>
	<46AF4FC7.1000500@riverviewtech.net>	<46AF8D63.8080900@interia.pl>
	<46AF9694.1060709@riverviewtech.net>	<46AFBA57.3040702@mailinator.com>	<46AFC5BB.7050701@riverviewtech.net>
	<20070801133804.GB8336@outback.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070801133804.GB8336@outback.rfc2324.org>
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

Maximilian Wilhelm a =E9crit :
> Am Tuesday, den 31 July hub Grant Taylor folgendes in die Tasten:
>=20
>>I have never worked with the physdev match extension so I can not say=20
>>for sure.  I do not recall which features were being taken out of main=20
>>line NetFilter code, but I want to say that physdev was one of them [..=
.]
>=20
> The physdev match is in the vanilla kernel for some time now.

AFAIK, the physdev match for iptables is in the 2.6 vanilla kernel since=20
version 2.6.0 (as well as bridge-neftilter) and has never been removed.=20
The physdev match for ip6tables was added in version 2.6.9.

