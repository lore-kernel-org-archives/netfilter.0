From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: (NOT RESOLVED YET) How to list connections and its state PER
 CHAIN? Possible?
Date: Sat, 16 Jun 2012 20:14:20 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206162013490.6986@frira.zrqbmnf.qr>
References: <20120614163818.k1vfdtxr40sokwk0@correo.co.cr> <alpine.LNX.2.01.1206151519570.12865@frira.zrqbmnf.qr> <20120616095025.ga90dzk0lcg08wg4@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120616095025.ga90dzk0lcg08wg4@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Jos=C3=A9_Pablo_P=C3=A9rez?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

On Saturday 2012-06-16 17:50, Jos=C3=A9 Pablo P=C3=A9rez wrote:

> Jan,
>
> Thanks but.. according to our reading:
>
> LOGMARK
> The LOGMARK target will log packet and connection marks to syslog.

That is not the only thing it does. I must know, because I wrote it.

> AND ...you only can follow via -J MARK, but MARK is work for table ma=
ngle ->
> PRE and POSTROUTING

it has nothing to do with -j MARK.
