From: Ricardo Klein <klein.rfk@gmail.com>
Subject: ipset 6.19 build fails on CentOS 6.4 64bits
Date: Mon, 16 Sep 2013 23:18:25 -0300
Message-ID: <CADuigkUZx24ssKBsu21QxwShTHKmZn7dyXnhwsNwt4aLbM7Jcw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=IgfeZuYsyhtgKAljiSSqW1MwRP1qxxIdTpu9n6WTN8Q=;
        b=UobsVOUbhEYMzW/GuIwRy+PDFpkd41BWA1zQP2EWaUEunvLByTwQDMbjhmmIdauwpb
         6ehfu8/TdrpwnRqYCvd5Gwy/JgQiaUOKmKTzCFkB8bKuPu9HrPm2SiCbhN/qnPb/SNR7
         NGC9KE9yHJ5OfoGrJNtXoTMXNuCN34SqxIOCZZEgv5SpQAKt+XEyi1nel6LFw6fwWUtO
         wVAmidDkkXDL91ZWZu0b808xvLrQLLunBtEseYpD5E7gHMVHb7D2X8QoyTje/LSqxm52
         CQ7jCxXW1zcUUM+DIHATUw9PJRMJ8xSNZzN6YraTRCWgCoqwS1eNomzJZQ1ySuuBeDyd
         NL0g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter <netfilter@vger.kernel.org>

I was trying to build ipset 6.19 on CentOS 6.4 bit it fails.
I did a try on git version (the current one right?) and it fails too
on make modules


[root@localhost ipset]# make modules
make -C /lib/modules/`uname -r`/build M=3D$PWD/kernel/net V=3D \
KCFLAGS=3D"-DPACKAGE_VERSION=3D6.19" \
IP_SET_MAX=3D256 KDIR=3D$PWD/kernel modules
make[1]: Entering directory `/usr/src/kernels/2.6.32-358.18.1.el6.x86_6=
4'
Makefile:626: "WARNING: Appending $KCFLAGS (-DPACKAGE_VERSION=3D6.19)
from command line to kernel $CFLAGS"
  CC [M]  /root/ipset/kernel/net/netfilter/xt_set.o
In file included from
/root/ipset/kernel/include/linux/netfilter/ipset/ip_set.h:22,
                 from /root/ipset/kernel/net/netfilter/xt_set.c:18:
/root/ipset/kernel/include/linux/netfilter/ipset/ip_set_compat.h:42:
error: redefinition of =91ether_addr_equal=92
include/linux/etherdevice.h:185: note: previous definition of
=91ether_addr_equal=92 was here
make[3]: *** [/root/ipset/kernel/net/netfilter/xt_set.o] Error 1
make[2]: *** [/root/ipset/kernel/net/netfilter] Error 2
make[1]: *** [_module_/root/ipset/kernel/net] Error 2
make[1]: Leaving directory `/usr/src/kernels/2.6.32-358.18.1.el6.x86_64=
'
make: *** [modules] Error 2

--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com
