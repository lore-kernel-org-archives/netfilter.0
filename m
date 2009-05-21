From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 13:13:51 +0200
Message-ID: <4A15376F.4080401@duet.it>
References: <4A142FF7.1050700@duet.it>	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>	 <4A150D46.6090806@duet.it> <1242896445.4763.1.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1242896445.4763.1.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!

>> With your script I get the same result as mine: 2 parallel connections 
>> (with different priority), one uses all bandwitdh and the other stalls 
>> alternatively.
>>
>> perhaps there is a timeout mechanims that forse sending queued packets 
>> although lower priority?
>>     
>
> This is exactly how PRIO works. Higher priority classes get dequeued
> first, so if there is something to dequeue forever then the lower
> priority classes would never dequeue.
>
>   
but it's not behaviour shown by test. And I don't no why. 
Ex.
connection A -> higher priority
connection B -> lower priority

results:
time      | connection A | connection B
1 sec           32 KB/s             0 KB/s
10 sec         18 KB/s           15 KB/s
20 sec           2 KB/s           31 KB/s
30 sec           0 KB/s           32 KB/s
40 sec         15 KB/s           16 KB/s
50 sec         25 KB/s             7 KB/s
60 sec         33 KB/s             0 KB/s
    ...                 ....                    ....
and so on

do you understand? I don't know why...

suggestions are welcome.

Fabio
 
