From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Mon, 20 Sep 2010 23:48:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josu Gomez <jgomezp81@googlemail.com>
Cc: netfilter@vger.kernel.org

On Monday 2010-09-20 21:59, Josu Gomez wrote:

>Hello,
>
>I compiled iptables 1.4.9.1 for powerpc architecture using this commands :
>
> ./configure --prefix=/dream/root/cdkroot
>--host=powerpc-tuxbox-linux-gnu (with edited configure file to run
>cross-compiling)
> make
> make install
>
>The binaries and libraries are created successfully and there are
>tested (with other modules).
>The problem is that the modules there are not compiled.

Which modules? What in the source tree is missing getting compiled?
