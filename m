From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Out of window filter catches too much
Date: Tue, 1 Mar 2005 09:40:17 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0503010938320.14280@blackhole.kfki.hu>
References: <421FBC65.40202@drzeus.cx>
Mime-Version: 1.0
In-Reply-To: <421FBC65.40202@drzeus.cx>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre Ossman <drzeus-list@drzeus.cx>
Cc: netfilter@lists.netfilter.org

Hi,

On Sat, 26 Feb 2005, Pierre Ossman wrote:

> Since there is only linux machines involved here this must be a kernel
> bug. Either in the TCP layer or in netfilters detection. Here is a dump
> from the router when it starts throwing away packets:
>
> ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver)
> IN= OUT= SRC=10.8.0.24 DST=10.8.5.10 LEN=1500 TOS=0x00 PREC=0x00 TTL=64
> ID=10234 DF PROTO=TCP SPT=3851 DPT=873 SEQ=2763580423 ACK=299956256
> WINDOW=95 RES=0x00 ACK URGP=0 OPT (0101080AC4C2FDE77E1D58C1)
> ip_ct_tcp: SEQ is over the upper bound (over the window of the receiver)

On Mon, 21 Feb 2005 I posted a patch to netfilter-devel which addresses
this and other issues in TCP window tracking. Please try the patch.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

