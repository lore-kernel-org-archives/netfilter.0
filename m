From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: need help with ipset
Date: Thu, 14 Sep 2006 08:58:47 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu>
References: <4504CC74.3040607@mailinator.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4504CC74.3040607@mailinator.com>
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

On Sun, 10 Sep 2006, Mike Wright wrote:

> Trying to create a set:
>     "ipset -N TEST iphash" fails with:
>        ipset v2.2.9: Error from kernel: Protocol not available

The ipset binary isn't smart enough to autoload the ip_set kernel module,
you need to load it manually (or via /etc/modules at system boot time):

# modprobe ip_set

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

