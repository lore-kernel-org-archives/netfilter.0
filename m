From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: help with random patch
Date: Wed, 9 Feb 2005 08:45:26 -0500 (EST)
Message-ID: <25359.142.169.215.10.1107956726.squirrel@142.169.215.10>
References: <BAY102-F2613C4ADC79C98252120B4AE740@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BAY102-F2613C4ADC79C98252120B4AE740@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: Brandon Hall <jodious33@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, February 8, 2005 1:31 pm, Brandon Hall said:
> hi everyone

Hi Brandon

> 	I'm new to the lists and I'm trying to get a certain script to work,
> however to work I need the random patch.  I can't find this patch
> anywhere,
> but I really do not know where to look.

The patch is part of automatic patching system called "Patch-O-Matic".
This is part of Netfilter and contains all pending/base/extra patches
official to Netfilter. You may have a look at:

http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-random

You can download latest POM in a daily snapshot forms. Those are provided
here :

http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/

You will need source of your running kernel as well as iptables source.
Patch-O-Matic will apply patches you want against both sources.

Then, it requires you to enable the module into your kernel
(make menuconfig?), recompile the kernel or the module if you've selected
it as a module.

Don't forget to recompile iptables too handing it a path to the patched
kernel:

make KERNEL_DIR=3D/usr/src/linux-patched-with-pom

Also, don't do the mistake of running you're old itpables binary
(usually in /usr). The iptables' Makefile comes with default prefix
path of /usr/local. You may want to edit.

For any details I forgot, please refer to the README.

HTH,
Samuel


