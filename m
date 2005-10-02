From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 2 Oct 2005 15:38:51 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510021534200.25897@blackhole.kfki.hu>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
	<dhnoqq$bq8$1@sea.gmane.org>
	<Pine.LNX.4.61.0510021142470.6283@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510021142470.6283@filer.marasystems.com>
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
Cc: Robert Nichols <rnicholsNOSPAM@comcast.net>, netfilter@lists.netfilter.org

On Sun, 2 Oct 2005, Henrik Nordstrom wrote:

> I am not entirely sure about the reasoning why a lone FIN is seen as
> invalid. The comment only says "Too late and no reason to do anything...".
> Also not entirely sure why a lone RST is seen as invalid. Both FIN and RST
> carries valuable meaning when resuming forgotten sessions.

If a FIN receives which does not belong to any existing connection in
the conntrack table, which state should we assign to the "new" connection
"established" by the FIN? Was it the first FIN (half-closed session) or
the second FIN from the other direction?

I dunno how a lone RST could signal to pick up a connection.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

