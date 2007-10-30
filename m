From: Tarak Ranjan <tarak.ranjan@liqwidkrystal.com>
Subject: Re: Gateway with Iptables
Date: Tue, 30 Oct 2007 10:41:15 +0530
Message-ID: <4726BCF3.9080708@liqwidkrystal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Rob Sterenborg wrote:
> i have a proxy server, when i enable the proxy my mail clients are
> > not able to send/receive mail. here is my iptables. please help me
> > with the necessary changes.
>   
  but i'm not able to understand why my mail clients are not responding. 
it's saying connection timed out.
>
> How do you test this? If you configured Squid for transparent proxying
> and allow http (AFAIK you can't transparent proxy https) inbound, your
> users don't have to configure a proxy in their browser and will use the
> proxy "transparently".
>
>   
i have monitor the log /var/log/squid/access.log---- those user's has 
enable "Direct Connection/Automatic detection  " in their respective 
browser, their log is not coming in the access.log
>> what else i have to do to stop direct connection , they must use
>> proxy.
>>     
>
>
> I was going to rewrite the script to make sense of it, but I'm not clear
> on what is running where and what exactly is allowed. Also:
>  
>   
1  i want to block ssh from outside, but it will only allow from 203.x.x.x.
2  any internet request should pass through squid(8080).
3  and if anything wrong in my existing rule set please let me know.



-- 
Thanks & Regards,

Tarak Ranjan
___________________________
IS-Team
Liqwid Krystal

T:   +91 80  2509 1790 Ext. 107
E@:  tarak.ranjan@liqwidkrystal.com
IM:  reachtarak@hotmail.com

Online Learning|Certification|Learning Solutions: http://www.liqwidkrystal.com 



