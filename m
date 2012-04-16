From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to install xtables extension to arbitrary path when cross
 compiling iptables?
Date: Mon, 16 Apr 2012 17:59:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204161756370.10151@frira.zrqbmnf.qr>
References: <loom.20120416T170250-226@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20120416T170250-226@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Wilson <wkevils@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2012-04-16 17:19, Kevin Wilson wrote:
>
>on the target machine (which access the fs by NFS) I run: 
>
>iptables -t nat -A POSTROUTING -o ppp0 -j SNAT -s 10.1.1.25
>The error I get is:
>
>./iptables -A FORWARD -i eth1 -j SNAT
>iptables v1.4.8: Couldn't load target `SNAT'
>:/home/kevin/fs/test1_iptables/libexec/xtables/libipt_SNAT.so: cannot open
>shared object file: No such file or directory
>how to install xtables extension to arbitrary path when cross compiling?

Like any other automake project, DESTDIR specifies the basepath
for staged installs, and args to configure are what the target looks in.

	./configure --prefix=/test1_iptables
	make install DESTDIR=/home/kevin/fs
