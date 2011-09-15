From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCE] ipset 6.9.1 released
Date: Thu, 15 Sep 2011 09:28:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109150926020.15853@frira.zrqbmnf.qr>
References: <alpine.DEB.2.00.1109062143300.9388@blackhole.kfki.hu> <4E713E0F.1050403@googlemail.com> <alpine.DEB.2.00.1109150846290.5001@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1109150846290.5001@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Thursday 2011-09-15 08:53, Jozsef Kadlecsik wrote:
>
>I suppose you are trying to compile the kernel part of the package 
>directly. What should be done is as follows:
>
>ipset-6.9.1$ ./autogen.sh
>ipset-6.9.1$ ./configure --with-kbuild=/fedora/released/kernel/tree
>ipset-6.9.1$ make modules
>ipset-6.9.1$ make modules_install
>
>Or your kernel tree is not prepared for building external modules:
>you should run at least "make modules_prepare" in 
>/fedora/released/kernel/tree.

modules_prepare may not be enough. When you see

	WARNING: Symbol version dump 
	/home/jengelh/code/linux-hist/obj39/Module.symvers is missing; 
	modules	will have no dependencies and modversions.

building the kernel base image is mandatory for creation of 
Modules.symvers.
