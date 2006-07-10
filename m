From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP connection timeout problem
Date: Mon, 10 Jul 2006 09:33:58 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0607100921490.12586@blackhole.kfki.hu>
References: <44ACDDC3.7080907@eld.physics.leidenuniv.nl>
	<44B1FD6A.6010207@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44B1FD6A.6010207@eld.physics.leidenuniv.nl>
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
To: Arno van Amersfoort <arnova@eld.physics.leidenuniv.nl>
Cc: netfilter@lists.netfilter.org

On Mon, 10 Jul 2006, Arno van Amersfoort wrote:

> I'm currently running a vanilla kernel 2.6.15.6, but I already observed
> it with older kernel versions too.... The system is running Debian 3.1
> x86 with iptables 1.2.11, but I don't think this really matters.... If
> you need additional info, please let me know...

There was a SACK related bug in TCP connection tracking which was fixed
around 2.6.15 and which exhibited such problems. Either upgrade the kernel
on your firewall or disable SACK on all machines behind it. If you can
reproduce the problem at will with a machine then disable SACK on it and
check wether it solves the problem.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

