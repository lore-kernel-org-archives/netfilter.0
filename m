From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: nat and dns
Date: Fri, 24 Sep 2004 11:43:20 +0200 (CEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0409241139490.32514@blackhole.kfki.hu>
References: <415290B1.5030401@imag.fr>
	<20040923103428.GK27327@metastasis.org.uk>
	<20040923110943.14715.qmail@arcoscom.com>
	<20040923112331.GL27327@metastasis.org.uk>
	<1095948833.1750.9.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095948833.1750.9.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 23 Sep 2004, Jason Opperisano wrote:

> > Most DNS queries take place over UDP, however if the
> > reply to the query is especially large then a new TCP connection is
> > opened between the client and server.
>
> find me a response to a client resolver request that doesn't fit in a
> single UDP packet, and i'll stop seeing red every time i see someone
> recommend allowing TCP 53 from any IP to their DNS server (*).

AIX uses just TCP, even for a plain query.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

