From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: removing black listed ip
Date: Mon, 12 Apr 2010 14:30:17 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004121427530.30496@obet.zrqbmnf.qr>
References: <z2xcfeab66d1004101003j5eb39eb1t38ec3b31ce3ce4b@mail.gmail.com>  <alpine.LSU.2.01.1004101910020.32651@obet.zrqbmnf.qr>  <z2hcfeab66d1004101020w685d24b3hc2551381819ced27@mail.gmail.com>  <alpine.LSU.2.01.1004101938350.4171@obet.zrqbmnf.qr>
 <n2jcfeab66d1004112324t35d8d49cx7eebfcfe88b4f461@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <n2jcfeab66d1004112324t35d8d49cx7eebfcfe88b4f461@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2010-04-12 08:24, ratheesh k wrote:
>On Sat, Apr 10, 2010 at 11:12 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>> On Saturday 2010-04-10 19:20, ratheesh k wrote:
>>
>>>> xt_recent works by comparing the difference between an entry's
>>>> timestamps and the current time with the chosen --seconds parameter.
>>>
>>>If an ip is black listed , when it will get removed
>>
>> It will not get removed. If you want any action, such as blacklisting,
>> to stop after a given time, you use --seconds as I just told.
>
>if  number of ip balcklisted ip is more than  ip_list_tot , old
>entries will be replaced by new ip addresses ? . { once list if full ,
>what will happen for new black listing }

As I see it yes.
