From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: printk mac address --hangs
Date: Thu, 13 May 2010 19:16:24 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005131916081.9398@obet.zrqbmnf.qr>
References: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>  <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr> <AANLkTinnqyBwCYQB1rLWI04VBr28DRludbfO9cFcTgAo@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinnqyBwCYQB1rLWI04VBr28DRludbfO9cFcTgAo@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thursday 2010-05-13 19:07, ratheesh k wrote:

>On Thu, May 13, 2010 at 9:49 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>> If you do not have an Ethernet packet, this is going to explode.
>
>I have only one  ethernet network interface (eth0 ) with 192.168.1.5 .
>I could see in wireshark all  packets with ethernet mac addresses .
>When i try to prink the mac address or copy ,  it hangs ..

Your hook received packets from all interfaces, including lo and 
ethhdr-less tunnels.
