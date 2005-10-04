From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Tue, 4 Oct 2005 15:19:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510041515500.2295@blackhole.kfki.hu>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
	<200510021416.39103.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510031236250.22605@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510031236250.22605@filer.marasystems.com>
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
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

On Mon, 3 Oct 2005, Henrik Nordstrom wrote:

> > How is this association known to conntrack?
>
> By a application protocol helper module registering an expectation of a
> related connection.
>
> The manual is actually slightly incorrect. ICMP errors normally gets
> sorted as ESTABLISHED, not RELATED.

According to the source code the manual is correct and ICMP error messages
are always RELATED (or INVALID).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

