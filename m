From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: issue with ipv4options
Date: Wed, 8 Aug 2012 20:03:16 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208082002290.4912@frira.zrqbmnf.qr>
References: <CAE1WnGeP0x8PLJOMAmK9PAMXRJAqEuxZPmTrV_nLBXZXa+5mkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGeP0x8PLJOMAmK9PAMXRJAqEuxZPmTrV_nLBXZXa+5mkA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Wednesday 2012-08-08 11:37, rahul shrivastava wrote:

>Hi,
> iptables -A INPUT -i eth0 -m ipv4options --ssrr -j DROP
>iptables v1.4.9.1: Couldn't load match
>`ipv4options':/usr/libexec/xtables/libipt_ipv4options.so: cannot open
>shared object file: No such file or directory

You have to specify the plugin directory at configure time.
See the --with-xtlibdir switch and the "INSTALL" file which you should 
have read.

