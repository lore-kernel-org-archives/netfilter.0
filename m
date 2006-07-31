From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset not making ipset.ko (or ipset.ko)
Date: Mon, 31 Jul 2006 09:51:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0607310948520.24809@blackhole.kfki.hu>
References: <edc15fb60607260643t13f71346je0627e6d0712326e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <edc15fb60607260643t13f71346je0627e6d0712326e@mail.gmail.com>
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
To: David Burrow <dnburrow@gmail.com>
Cc: netfilter@lists.netfilter.org

On Wed, 26 Jul 2006, David Burrow wrote:

> I'm trying to patch a SUSE 10 box with ipset.  I'm using a vanilla
> kernel form kernel.org and the configuration, kernel recompile and
> install, iptables recompile and install, ipset compile and install all
> *seemed* to go well, except that ipset.ko (or ip_set.ko) is not being
> created anywhere.  I watched the output from running
> KERNEL_DIR=/usr/src/linux make install in the ipset directory and got
> this:
>
> cp ipset /usr/local/sbin/ipset
> cp libipset_ipmap.so /usr/local/lib/ipset/libipset_ipmap.so
> cp libipset_portmap.so /usr/local/lib/ipset/libipset_portmap.so
> cp libipset_macipmap.so /usr/local/lib/ipset/libipset_macipmap.so
> cp libipset_iphash.so /usr/local/lib/ipset/libipset_iphash.so
> cp libipset_nethash.so /usr/local/lib/ipset/libipset_nethash.so
> cp libipset_iptree.so /usr/local/lib/ipset/libipset_iptree.so
> cp libipset_ipporthash.so /usr/local/lib/ipset/libipset_ipporthash.so
>
> Any ideas why the .ko files don't seem to be getting made?

That is the installing of the userspace utility ipset. .ko objects belongs
to the kernel. Nothing's wrong here.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

