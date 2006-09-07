From: Samuel =?iso-8859-1?Q?D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: How to use ipp2p
Date: Thu, 7 Sep 2006 10:13:40 +0200 (CEST)
Message-ID: <33746.195.55.244.106.1157616820.squirrel@www.arcoscom.com>
References: <20060907074759.59163.qmail@web36607.mail.mud.yahoo.com>
	<64132.193.173.147.3.1157615962.squirrel@webmail.sterenborg.info>
Reply-To: samueldg@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64132.193.173.147.3.1157615962.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

In case of kernels less than 2.6.17 you can use the "stand alone" version
in www.ipp2p.org page.

Really you don't need to patch kernel or iptables.

If you use a stock kernel, you only need iptables-devel and kernel-devel
packages installed.

Download the stand-alone package.
Uncompress it.
Go into the directory.
make
install (there is a guide in ipp2p web).
depmod -ae

You can use it.

Regards

--=20
Samuel D=EDaz Garc=EDa
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

Tlfn.: 956 70 13 15
Fax:   956 70 34 83


El Jue, 7 de Septiembre de 2006, 9:59, Rob Sterenborg escribi=F3:
> On Thu, September 7, 2006 09:47, saki wrote:
>> I want to filter p2p packet going through my gateway.
>> I tried it with ipp2p.. but could not make it working
>> with my Fedora Core 2 distro. Anyone would tell me how to patch iptables
>> with
>> ipp2p in FC2? And how to use it.
>
> And exactly *what* have you tried..?
>
>
> Gr,
> Rob
>
>
>
>



