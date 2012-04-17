From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to install xtables extension to arbitrary path when cross
 compiling iptables?
Date: Tue, 17 Apr 2012 15:04:50 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204171504360.12571@frira.zrqbmnf.qr>
References: <loom.20120416T170250-226@post.gmane.org> <alpine.LNX.2.01.1204161756370.10151@frira.zrqbmnf.qr> <loom.20120417T145522-311@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20120417T145522-311@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Wilson <wkevils@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-04-17 14:58, Kevin Wilson wrote:

>Hi, 
>
>Tried as you said and got 
>after make install DESTDIR=/home/kevin/fs

You have to run `make` before `make install`.

>mv -f .deps/iptables_multi-xshared.Tpo .deps/iptables_multi-xshared.Po
>make[1]: *** No rule to make target `extensions/libext4.a', needed by
>`iptables-multi'.  Stop.
>make[1]: Leaving directory `/work/src/iptables-1.4.8'
>make: *** [install-recursive] Error 1
