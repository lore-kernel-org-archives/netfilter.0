From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to view blacklist ip ?
Date: Tue, 08 Sep 2009 10:05:53 +0530
Message-ID: <4AA5DF29.9070008@infoservices.in>
References: <4AA4A0D4.3080109@infoservices.in>	 <4AA4B741.7010209@plouf.fr.eu.org> <4AA4B9B3.6020409@infoservices.in>	 <4AA4BD7D.3080405@infoservices.in> <4AA4C0E6.9050101@plouf.fr.eu.org>	 <4AA4C3B8.7080309@infoservices.in> <4AA4D05E.5050909@infoservices.in>	 <4AA4E1AD.4040200@plouf.fr.eu.org> <4AA4FA86.2020601@infoservices.in> <38db14850909071137l3b70e3ecp7eb4b21fd9bffcf6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850909071137l3b70e3ecp7eb4b21fd9bffcf6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

Anatoly Muliarski wrote:
> 2009/9/7 J. Bakshi <joydeep@infoservices.in>:
>   
>> Could anyone suggest me how to get time in jiffies ? Tried with "date
>> +%s" but it is not the jiffie value. Any clue please ?
>>     
>
> You may use the first field in /proc/uptime - that gives you uptime in seconds.
>
> IMHO, the recent module should be used for filtering purpose only not
> for managing black lists.
> The right way is ipset :)
> And it does not require you to recompile your kernel - you may install
> it as a module.
> And yes, to use it you should recompile iptables if it does not
> support it by default.
>
>   

Hello Anatoly,

Thanks for your enlightenment.  I have to check if iptables supports
ipset by default in suse and debian. BTW any good tutorial to start with
ipset ?

regards
