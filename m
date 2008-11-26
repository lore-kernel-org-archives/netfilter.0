From: Nigel Heron <nigel-ml@xprima.com>
Subject: Re: banning bot ips with ipset
Date: Wed, 26 Nov 2008 11:28:16 -0500
Message-ID: <492D7920.1000007@xprima.com>
References: <492C6780.4020909@xprima.com> <alpine.DEB.2.00.0811260918140.31365@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0811260918140.31365@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org



Jozsef Kadlecsik wrote:

> ipset is stable enough for in production usage. The speed of the iphash 
> set is actually constant by nature and independent of the number of actual 
> entries (your network card and bus will slow you down and not iphash).
>  

thanks for everyone's feedback, we tried it on a test box with all our 
rules and it seems to work really well. we'll try it live during the week.

>> also, if it helps anyone else .. while trying ipset 2.4.5 i had to add:
>> #include <stdbool.h>
>> to "kernel/ip_set_setlist.c" to get it to compile.
> 
> What is your kernel version?
> 

2.6.18.2 which comes with opensuse 10.2
gcc "4.1.2 20061115 (prerelease) (SUSE Linux)" .. also bundled with 
opensuse 10.2


thanks,
-nigel.
