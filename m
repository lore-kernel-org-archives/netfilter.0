From: Denys Vlasenko <vda.linux@googlemail.com>
Subject: Re: iptables - Couldn't load target error
Date: Thu, 20 Dec 2007 17:26:06 +0000
Message-ID: <200712201726.06492.vda.linux@googlemail.com>
References: <200712191221.58597.schane@osmozis.com> <200712201003.26454.vda.linux@googlemail.com> <200712201449.43555.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date:user-agent:cc:references:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=TcQoGBsRp3iP9CAx3q5E6z3jgntNaX28OOomBXKxibc=;
        b=pVi7+YJYqQZxd2nzpTKwe55BIGsOKO3VRcgvzfIk1SrU2p48/I9KhO13LCWRkbqbspE6iFrIDRfv7AUNBcTBQcOim7Npn4mUW7GLr/+rh+VQUPRLjGsMmOXXNPEbWA/FmWWa1ukVIIl43JeVp1jsYNBd48ff8t856cGUgvTZGnA=
In-Reply-To: <200712201449.43555.schane@osmozis.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Saravanan Chanemouganandam <schane@osmozis.com>
Cc: busybox@busybox.net, netfilter@vger.kernel.org

On Thursday 20 December 2007 13:49, Saravanan Chanemouganandam wrote:
> Hi vda,
>
> I accept your comment and others that it was not a busybox related issue.
>
> Well, here is my situation.I built a small rootfs for my arm pxa270 target
> board on the host x86 machine using the latest Buildroot. I then downloaded
> & installed iptables(v1.3.8)  using
>
> make KERNEL_DIR=/home/sara/cm-x270/linux-2.6.16
> CC=/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-g
>cc
> LD=/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-l
>d BINDIR=/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/sbin
> LIBDIR=/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib
>
> make
> BINDIR=/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/sbin
> LIBDIR=/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib
> install
>
> command install all iptables into the rootfs under
> "/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root" with all
> iptables and extension supports are built into linux kernel
> "/home/sara/cm-x270/linux-2.6.16" image.

Yes, but iptable developers meant that option to indicate
_where to find_ modules at runtime!

You need to have different LIBDIR= settings for "make" and "make install".

make LIBDIR=/where/to/look/for/modules/at/runtime
make LIBDIR=/where/to/install/modules              install

If it will not work (say, make install will start rebuilding stuff
due to changed LIBDIR), you will need to do "make install" -
by hand copying stuff. Feel free to curse a lot in the process.

--
vda
