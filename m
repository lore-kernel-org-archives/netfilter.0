From: Jan Vales <jan@jvales.net>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Thu, 03 Jan 2013 15:56:50 +0100
Message-ID: <50E59C32.5090003@jvales.net>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

why dont you use ...
iptables-save | grep "\-A" | wc -l

lg
~Jan


On 03/01/13 15:13, Aaron Lewis wrote:
> Already checked the manual on my system ... there's no counting
> support, the only thing relevant was --line-numbers,
> 
> My code is here, for anyone who needed
> 
> https://raw.github.com/CaledoniaProject/ipt_counting/master/ipt-count.c
> 
> I just hope one day such feature would be included officially.
> 
> 
> On Wed, Jan 2, 2013 at 9:58 PM, Eliezer Croitoru <eliezer@ngtech.co.il> wrote:
>> Hey Aaron,
>>
>> I feel kind of odd but this should answer you:
>> http://linux.die.net/man/8/iptables
>> www.garron.me/linux/iptables-manual.html
>>
>> Eliezer
>>
>>
>> On 1/2/2013 3:48 PM, Aaron Lewis wrote:
>>>
>>> Hi,
>>>      I want to know if I could get how many rules are present, i.e in
>>>      filter table?
>>>
>>>      Now I do `iptables -L | wc -l` like stuff, I know it's not right,
>>>      but iptables itself doesn't seem to count rules anyway.
>>>
>>>      I need this just to let user to know how many rules are present,
>>>      without root privileges, and now being able to view actual rules.
>>>
>>
> 
> 
> 
