From: Seblu <seblu@seblu.net>
Subject: Re: Kernel panic with ipset 6.11
Date: Tue, 24 Apr 2012 21:37:39 +0200
Message-ID: <CAJSTwE7dmbf8y7oB8hVLRHneEOYtq9ySMnM=Gg6mqpoSXC=LPg@mail.gmail.com>
References: <jmni05$12j$1@dough.gmane.org> <alpine.DEB.2.00.1204190853050.30547@blackhole.kfki.hu>
 <CAJSTwE5EU5-W5PrPrEWuHNn+uNkipxTh9E2EO66sVJucY+M6rQ@mail.gmail.com> <alpine.DEB.2.00.1204232347510.23601@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=CSonXdeC5UdeDkV5URukPsM1w1Z9VUN63UgayjPLGts=;
        b=tnBf/40Xas9PM7e+Q4pyoDDJuoyusVoErKzYazI++EuhGXqzDoBcnoeI9V/VRQ9Lo5
         kPhOP4Ae+4bxwdOpK1d0RXn3MPOrh8UAACoDZYTmr4GdiekF5Un4cvvcAp4QMXiFwM1+
         kpsyX21tsy+CldVB/woIkMd1/xqSHn9lrMq1WbecaHSEDVnk5srHOxaeAUXrI1XXPkSC
         eXwmB70GCsIM4bRbGD+Ey0iDS98TopMITj2c84fYxlU0sFL1Are2+z5aB86xR2bPfiFx
         D7T19FG8vTL9v3uvHn/uA6nF4qP+6QyBHbbIp0x3s67qFIoqt4xGPO0xYZqkpvVRfq7L
         Sh+Q==
In-Reply-To: <alpine.DEB.2.00.1204232347510.23601@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On Mon, Apr 23, 2012 at 11:49 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 23 Apr 2012, Seblu wrote:
>> On Thu, Apr 19, 2012 at 9:10 AM, Jozsef Kadlecsik
>> Previous kernel panic traceback don't help you? Do you need more inf=
ormation?
>
> Could you recompile your kernel and ipset with gcc 4.7 and
> CFLAGS=3D-fno-optimize-strlen and re-run the test? Does it help?

Kernel 3.3.2 and ipset recompiled with  gcc 4.7 and CFLAGS=3D-fno-optim=
ize-strlen.
Same panic on i686.


--=20
S=E9bastien Luttringer
www.seblu.net
