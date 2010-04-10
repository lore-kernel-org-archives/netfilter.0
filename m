From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: removing black listed ip
Date: Sat, 10 Apr 2010 19:42:03 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>  <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr> <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2010-04-10 19:20, ratheesh k wrote:

>> xt_recent works by comparing the difference between an entry's
>> timestamps and the current time with the chosen --seconds parameter.
>
>If an ip is black listed , when it will get removed 

It will not get removed. If you want any action, such as blacklisting, 
to stop after a given time, you use --seconds as I just told.
