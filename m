From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: compilation issues with xtables-addons-1.43
Date: Sun, 1 Jul 2012 18:06:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207011806310.17716@frira.zrqbmnf.qr>
References: <CAE1WnGeJ0rgSvYWMZh5-N4osDBwABEkUw0XH4gLWur2j-kkLVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGeJ0rgSvYWMZh5-N4osDBwABEkUw0XH4gLWur2j-kkLVg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


On Sunday 2012-07-01 15:40, rahul shrivastava wrote:

>Hi,
>i am cross compiling xtable-addons for powerpc plateform
>am following below mentioned procedure
>  ./configure --host=powerpc
>  make
>  make install
>
>i am getting following error
>make: *** No targets specified and no makefile found.  Stop.
>
>there seem to be no Makefile

Then you should check whether ./configure actually completed successfully.
