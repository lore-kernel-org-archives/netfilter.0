From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to install xtables extension to arbitrary path when cross
 compiling iptables?
Date: Tue, 17 Apr 2012 17:11:06 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204171710470.24451@frira.zrqbmnf.qr>
References: <loom.20120416T170250-226@post.gmane.org> <alpine.LNX.2.01.1204161756370.10151@frira.zrqbmnf.qr> <loom.20120417T145522-311@post.gmane.org> <alpine.LNX.2.01.1204171504360.12571@frira.zrqbmnf.qr>
 <CALyraeOsHA5=G1Esd92m4xMgA5XbpDMSwijgQZZ_mmAG_ZBBAA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALyraeOsHA5=G1Esd92m4xMgA5XbpDMSwijgQZZ_mmAG_ZBBAA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Sri Ram Vemulpali <sri.ram.gmu06@gmail.com>
Cc: Kevin Wilson <wkevils@gmail.com>, netfilter@vger.kernel.org

On Tuesday 2012-04-17 17:09, Sri Ram Vemulpali wrote:

>Check out cmdline parameter -host, -target, -build for configuring the
>build. I think you might have gone wrong in there.

The value of those parameters is not even used, so no.

>On Tue, Apr 17, 2012 at 9:04 AM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
>> On Tuesday 2012-04-17 14:58, Kevin Wilson wrote:
>>
>>>Hi,
>>>
>>>Tried as you said and got
>>>after make install DESTDIR=3D/home/kevin/fs
>>
>> You have to run `make` before `make install`.
>>
>>>mv -f .deps/iptables_multi-xshared.Tpo .deps/iptables_multi-xshared.=
Po
>>>make[1]: *** No rule to make target `extensions/libext4.a', needed b=
y
>>>`iptables-multi'. =C2=A0Stop.
>>>make[1]: Leaving directory `/work/src/iptables-1.4.8'
>>>make: *** [install-recursive] Error 1
