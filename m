From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help with packet marking
Date: Thu, 29 Mar 2012 17:10:21 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203291710010.29674@frira.zrqbmnf.qr>
References: <4F74194E.9030608@kickstone.co.uk> <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Cc: John Lister <john.lister@kickstone.co.uk>, netfilter@vger.kernel.org

On Thursday 2012-03-29 16:55, Humberto Juc=C3=A1 wrote:

>2012/3/29 John Lister <john.lister@kickstone.co.uk>:
>> It seems to be selecting the correct route using the marks as iptabl=
es
>> reports the correct interface in the log files.
>> However the packet then goes out of a different interface.
>
>Show us all firewall and routing rules (at least the main)...
>   iptables -t mangle -nL -v

Nono, don't use iptables -L. Better use iptables-save.
