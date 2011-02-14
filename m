From: Fabrice <fabricedeyber@agilemesh.com>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 16:19:21 +0000 (UTC)
Message-ID: <loom.20110214T171359-758@post.gmane.org>
References: <4CB712C3.3030804@21com.com> <loom.20110214T152123-163@post.gmane.org> <4D593F90.5020609@googlemail.com> <alpine.LNX.2.01.1102141548410.5842@obet.zrqbmnf.qr> <loom.20110214T155902-834@post.gmane.org> <alpine.LNX.2.01.1102141618310.12050@obet.zrqbmnf.qr> <loom.20110214T162258-861@post.gmane.org> <alpine.LNX.2.01.1102141642040.14613@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> It won't. It will load then from the prefix. Otherwise, a helluva lot
> Linux distros would have run into the problem already, because they
> use DESTDIR when making their packages.

> 
./configure --host=arm-linux --prefix=/usr
make
make DESTDIR=/home/workdir/filesys

ok here what I get when I install to the NFS:

# iptables -t nat -A POSTROUTING -o ppp0 -j SNAT -s 10.1.1.25
iptables v1.4.10: Couldn't load target 
`SNAT':/home/test/workdir/filesys/libexec/xtable
s/libipt_SNAT.so: cannot open shared object file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

It stills tries to load using the absolute path...
I also noticed it did not add /usr to the path either...

