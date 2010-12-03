From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: cross compilation of xtables fails
Date: Fri, 3 Dec 2010 20:45:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012032044120.26825@obet.zrqbmnf.qr>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com> <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr> <4CF8FF76.8040709@googlemail.com> <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr>
 <4CF94596.4080002@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF94596.4080002@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-12-03 20:31, Mr Dash Four wrote:
>
>> Then do so when time comes :)
>>  
> Here goes, the full monty: ;-)
>
> LANG=C
> export LANG
> ./autogen.sh
> CFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions
> -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=pentium2
> -fasynchronous-unwind-tables'
> export CFLAGS
> ./configure --build=x86_64-redhat-linux-gnu --host=i686-redhat-linux-gnu
> --program-prefix= --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin
> --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share
> --includedir=/usr/include --libdir=/usr/lib --libexecdir=/usr/libexec
> --localstatedir=/var --sharedstatedir=/var/lib --mandir=/usr/share/man
> --infodir=/usr/share/info --with-xtlibdir=/lib/xtables

As I thought. You forgot LDFLAGS="-m32".

