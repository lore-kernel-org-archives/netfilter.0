From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset on 2.4.18-14
Date: Sun, 24 Sep 2006 20:42:47 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0609242036020.6965@blackhole.kfki.hu>
References: <4516BEAE.3030708@mailinator.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4516BEAE.3030708@mailinator.com>
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
To: Mike Wright <xktnniuymlla@mailinator.com>
Cc: netfilter@lists.netfilter.org

On Sun, 24 Sep 2006, Mike Wright wrote:

> I've been trying to add ipset support to a remote box running Redhat 8
> with kernel 2.4.18-14 and am having build problems.

Some header files were removed from 2.4.18-14, so the patch must be
corrected to add the missing bits/adjust to the new kernel environment.
I'll be overloaded with other stuff till the end of September, so please
be a little bit patient.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

