From: Seblu <seblu@seblu.net>
Subject: Re: Kernel panic with ipset 6.11
Date: Mon, 23 Apr 2012 22:50:37 +0200
Message-ID: <CAJSTwE5EU5-W5PrPrEWuHNn+uNkipxTh9E2EO66sVJucY+M6rQ@mail.gmail.com>
References: <jmni05$12j$1@dough.gmane.org> <alpine.DEB.2.00.1204190853050.30547@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=GzIo205L6UmG+Uo/84Gb5H9k4rmZXjWqlIi74dP9tDA=;
        b=AJuuUQtuVIaLVUtpdg+1DdLP/jl2e3TjNJZ7evQzFMxBpVmBkkAVYQ6NXX0f0naMRq
         nJd++KOZ0SL72IRbOqAtP95IVzPTSEA62KNVFI+Rvfl0FrU/oeZfLpcssPuLZwp8g1jO
         i90TOFIeMan+bNsaBJD9WEYbtJyD3GmleyzWD5qFbtvlfSXbkOgq83iU5sVD07ZIo6/J
         rTHGF9xMP8ywoUWb+PsVimQ7du9bSK4joUC2+mmV7mPTbTcNz543eflfk4oosSQh3YoD
         PtNa2taDLJkd3OuHCQwubOYmNxi+DLeObOe80A783byUGvL3m9FzFaO9nnAfzMvP8alr
         4BJA==
In-Reply-To: <alpine.DEB.2.00.1204190853050.30547@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On Thu, Apr 19, 2012 at 9:10 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> No, definitely not. Did you use exactly the same kernel in both cases=
 and
> only the ipset binary was different?
Same except architecture. Panic on i686 and error on x86_64.

You can find config file of i686 here:
https://projects.archlinux.org/svntogit/packages.git/tree/trunk/config?=
h=3Dpackages/linux&id=3D316a5f1f9ae26763aa1b4d4ef694c938ec974345
You can find config file of x86_64:
https://projects.archlinux.org/svntogit/packages.git/tree/trunk/config.=
x86_64?h=3Dpackages/linux&id=3D316a5f1f9ae26763aa1b4d4ef694c938ec974345

>
> If ipset.conf.0 is the file you attached, then that's absolutely stra=
nge,
> because the set was to be created as
Yes, config file is from example in man pages.

I tested in a vm and physical host and in both case panic on i686.

I tested again with a kernel 3.3.3
# uname -a
Linux archibal 3.3.3-1-ARCH #1 SMP PREEMPT Mon Apr 23 09:33:32 UTC
2012 i686 Intel(R) Core(TM) i7 CPU M 620 @ 2.67GHz GenuineIntel
GNU/Linux
# ipset restore < ipset/ipset.conf.0
Connection to archibal closed.

Same issue (hash is full) with x86_64.

# ipset restore < /root/ipset/ipset.conf.0
ipset v6.11: Error in line 1: Cannot open session to kernel.

I recompiled ipset 6.11 with gcc 4.6 and kernel doesn't panic anymore
and works on x86_64.
It's maybe not so simple, but kernel panic with ipset builded with gcc
4.7 and works correctly with gcc 4.6.

Previous kernel panic traceback don't help you? Do you need more inform=
ation?

--=20
S=E9bastien Luttringer
www.seblu.net
