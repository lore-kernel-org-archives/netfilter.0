From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Fri, 04 Jan 2013 07:02:35 +0200
Message-ID: <50E6626B.8040705@ngtech.co.il>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Since iptables are kind of static I think a simple script should be good 
enough.

A one liner should do the trick:
tables="filter nat raw mangle";counter="0"; for i in $tables; do 
add=`iptables -t $i -L -n --line-numbers |egrep "^[0-9]+\ " |wc -l`; 
counter=`expr $counter + $add`;done ;echo $counter

You dont need to read the proc file system to know that there are only 
four tables exits in iptables.

Just remind me why do we need another tool on-top all the existing ones?
But I do seem to understand what you mean by that there is no option to 
just count the number of rules in a table.
if you really want to to be used as a command just restrict the script 
to execution only..
This is why permissions do exist.

Best regards,
Eliezer

On 1/3/2013 4:13 PM, Aaron Lewis wrote:
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
>>>       I want to know if I could get how many rules are present, i.e in
>>>       filter table?
>>>
>>>       Now I do `iptables -L | wc -l` like stuff, I know it's not right,
>>>       but iptables itself doesn't seem to count rules anyway.
>>>
>>>       I need this just to let user to know how many rules are present,
>>>       without root privileges, and now being able to view actual rules.
>>>
>>
>
>
>

-- 
Eliezer
