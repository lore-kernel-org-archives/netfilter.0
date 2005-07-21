From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: string matching in kernel 2.6
Date: Thu, 21 Jul 2005 09:38:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507210935180.27131@blackhole.kfki.hu>
References: <42DF2B0D.8040508@extol.com.my><00d101c58d99$4bca77c0$1280a8c0@newlife><011701c58da2$b77ba800$1280a8c0@newlife>
	<Pine.LNX.4.58.0507210901510.27131@blackhole.kfki.hu>
	<02cd01c58dc3$6e2a9230$1280a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02cd01c58dc3$6e2a9230$1280a8c0@newlife>
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
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

On Thu, 21 Jul 2005, Ming-Ching Tiew wrote:

> > > https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/017892.html
> >
> > That patch is not complete because it does not handle non-linear packets.
>
> But it is almost identical source as the 2.4 version, meaning the 2.4 version
> is also not able to handle the so called non-linear packets then ?

No, the 2.4 version of the module is fine in the 2.4 tree. However the
internal packet handling in the IP stack changed between 2.4 and 2.6. This
is the reason why modules need porting. Just copying the files and
adjusting the function arguments are not enough.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

