From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323
Date: Mon, 23 Sep 2002 12:27:35 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0209231226050.26544-100000@blackhole.kfki.hu>
References: <001d01c262a2$e2cbdb70$ccf8a8c0@monday>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001d01c262a2$e2cbdb70$ccf8a8c0@monday>
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
To: Toshihiro Sonoda <toshihiro@jp.fujitsu.com>
Cc: netfilter@lists.netfilter.org

On Mon, 23 Sep 2002, Toshihiro Sonoda wrote:

> does the new nat patch have h.225ras, or ldap for NAT problems.

The h323 patch does not support RAS.

> before, when i applied the h.323 patch, the patchs
> have a part of h.323, but not h.225.
> Is that ok?

Yes, that's OK.

> Can you use ILS server, or Gatekeeper?

The h323 patch does not support gatekeepers.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


