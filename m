From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: "excessively large" library built in standalone ipset build
Date: Fri, 21 Nov 2008 01:00:14 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0811210051370.30112@fbirervta.pbzchgretzou.qr>
References: <7259d7020811201429p2b83a4a5h88c46331cfbbf449@mail.gmail.com>  <alpine.LNX.1.10.0811202352550.25790@fbirervta.pbzchgretzou.qr> <7259d7020811201543w3283fdd7red50d86788a0b730@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811201543w3283fdd7red50d86788a0b730@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Friday 2008-11-21 00:43, JC Janos wrote:
>On Thu, Nov 20, 2008 at 2:56 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>> I wonder. Can you give a dump of the following command?
>>
>>        readelf -S libipset_ipportnethash.so
>
>(Adding yet another tool I need to learn about ...)
>
>readelf -S libipset_ipportnethash.so
>There are 34 section headers, starting at offset 0x202788:
>
>Section Headers:
>  [Nr] Name              Type             Address           Offset
>       Size              EntSize          Flags  Link  Info  Align
>  [15] .eh_frame         PROGBITS         0000000000001b58  00001b58
>       00000000000001b4  0000000000000000   A       0     0     8
>  [16] .ctors            PROGBITS         0000000000201cf8  00201cf8
>       0000000000000018  0000000000000000  WA       0     0     8

Just as I thought -- I have seen this before, and have a test case.
This is a real killer - because ld is the culprit that produces the
big file (only x86_64), but a *syntactic change* in the C file is
also needed to make it show.
Not ipset related, move along :-)
