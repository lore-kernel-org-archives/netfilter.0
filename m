From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: printk mac address --hangs
Date: Thu, 13 May 2010 21:26:39 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005132121480.31136@obet.zrqbmnf.qr>
References: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>  <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr>  <AANLkTinnqyBwCYQB1rLWI04VBr28DRludbfO9cFcTgAo@mail.gmail.com>  <alpine.LSU.2.01.1005131916081.9398@obet.zrqbmnf.qr>
 <AANLkTin6o-SVB10bETHs40Pvb_Cv0HWyIVzh2FA7I2iK@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin6o-SVB10bETHs40Pvb_Cv0HWyIVzh2FA7I2iK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thursday 2010-05-13 19:24, ratheesh k wrote:

>On Thu, May 13, 2010 at 10:46 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>> Your hook received packets from all interfaces, including lo and
>> ethhdr-less tunnels.
>
>Packets from lo will hit NF_IP_LOCAL_OUT hook  ?

Clearly.

>Could you please  tell  example for ether less packet  ?

As I said, all links that do not are of "ether" type (see `ip list`)
