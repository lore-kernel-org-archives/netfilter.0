From: Kevin Wilson <wkevils@gmail.com>
Subject: Re: How to install xtables extension to arbitrary path when cross compiling iptables?
Date: Tue, 17 Apr 2012 12:58:24 +0000 (UTC)
Message-ID: <loom.20120417T145522-311@post.gmane.org>
References: <loom.20120416T170250-226@post.gmane.org> <alpine.LNX.2.01.1204161756370.10151@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, 

Tried as you said and got 
after make install DESTDIR=/home/kevin/fs

mv -f .deps/iptables_multi-xshared.Tpo .deps/iptables_multi-xshared.Po
make[1]: *** No rule to make target `extensions/libext4.a', needed by
`iptables-multi'.  Stop.
make[1]: Leaving directory `/work/src/iptables-1.4.8'
make: *** [install-recursive] Error 1

----

Any ideas ? 
KW




