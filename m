From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Patch-o-matic failed... Why?
Date: Thu, 20 Feb 2003 09:58:09 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302200957210.12458-100000@blackhole.kfki.hu>
References: <3E52F62D.587D4657@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E52F62D.587D4657@gmx.de>
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
To: Alexander Maus <amaus@gmx.de>
Cc: netfilter@lists.netfilter.org

On Wed, 19 Feb 2003, Alexander Maus wrote:

> I'm using kernel 2.4.19 and need the talk-conntrack-patch.
> So I got the latest version of netfilter by CVS.
> Running './runme extra/talk-conntrack-nat.patch' showed:

> Could not find place to slot in ip_conntrack.h line

Apply the newnat patch before the talk-conntrack patch.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


