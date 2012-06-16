From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: (NOT RESOLVED YET) How to list connections and its state PER
 CHAIN? Possible?
Date: Sat, 16 Jun 2012 22:27:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206162219160.10502@frira.zrqbmnf.qr>
References: <20120614163818.k1vfdtxr40sokwk0@correo.co.cr> <alpine.LNX.2.01.1206151519570.12865@frira.zrqbmnf.qr> <20120616095025.ga90dzk0lcg08wg4@correo.co.cr> <alpine.LNX.2.01.1206162013490.6986@frira.zrqbmnf.qr>
 <20120616130148.z1bxs5ogg8wsg8ck@correo.co.cr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120616130148.z1bxs5ogg8wsg8ck@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?Jos=C3=A9_Pablo_P=C3=A9rez?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

>>> The LOGMARK target will log packet and connection marks to syslog.
>>
>> That is not the only thing it does. I must know, because I wrote it.
>
> Jan, Please point is to the manual entry... as we have this one:
> http://dev.medozas.de/files/xtables/xtables-addons.8.html  and it says only
> about logging to syslog..

You really make a case to want getting mocked (cf. recent LWN article, 
https://lwn.net/Articles/501670/).

	http://xtables-addons.git.sourceforge.net/git/gitweb.cgi?p=xtables-addons/xtables-addons;a=blob;f=extensions/xt_LOGMARK.c;h=1931c4a209c127b5e1167dcfa186e6fc30f65359;hb=HEAD#l37

The effing code does it. Absence of documentation has never reliably 
implied a feature is absolutely not present.
