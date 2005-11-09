From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: incrementing TTL in firewall
Date: Wed, 9 Nov 2005 19:06:47 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511091904520.28707@blackhole.kfki.hu>
References: <20051108001620.25531.qmail@web60923.mail.yahoo.com>
	<3185.192.168.3.8.1131552100.squirrel@192.168.3.8>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3185.192.168.3.8.1131552100.squirrel@192.168.3.8>
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
To: Bill Hance <bill@billhance.com>
Cc: netfilter@lists.netfilter.org

On Wed, 9 Nov 2005, Bill Hance wrote:

> Thanks for the help.  I believe I have TTL target support in the kernel:
[...]
> # lsmod
> Module                  Size  Used by    Not tainted
> ipt_ttl                 1144   0  (unused)

No, you haven't got. You need the ipt_TTL kernel module. ipt_ttl
implements the TTL >match< support.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

