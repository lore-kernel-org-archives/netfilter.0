From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Endian problem in h323
Date: Wed, 25 Jun 2003 09:11:46 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0306250910540.7456-100000@blackhole.kfki.hu>
References: <PIEIIGGHCLEGAPAHFMDOEEFJCOAA.Robert.Allmeroth@epygi.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PIEIIGGHCLEGAPAHFMDOEEFJCOAA.Robert.Allmeroth@epygi.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Allmeroth <Robert.Allmeroth@epygi.de>
Cc: netfilter@lists.netfilter.org

Hi,

On Tue, 24 Jun 2003, Robert Allmeroth wrote:

> It seems that we found another endian problem in the h323
>
> Error description:
> 	Loading ip_nat_h323 with modprobe fails, because
> 	ip_conntrack_h323 cannot be found in internal list
> 	due to wrong tuple initialization.

Thank you the bug report - I'll fix the patch in cvs.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


