From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 10:13:58 +0200
Message-ID: <4A150D46.6090806@duet.it>
References: <4A142FF7.1050700@duet.it> <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks for your reply.
I have just testing your script and I have some questions...

Anatoly Muliarski wrote:
> Hi Fabio,
>
> You should do something like this:
>
> tc qdisc add dev eth0 root handle 1: prio bands 3
> tc qdisc add dev eth0 parent 1:1 handle 2 sfq perturb 10
> tc qdisc add dev eth0 parent 1:2 handle 3 sfq perturb 10
> tc qdisc add dev eth0 parent 1:3 handle 4 sfq perturb 10
> tc filter add dev eth0 protocol ip parent 1: prio 1 <your
> criteria_high> flowid 1:1
> tc filter add dev eth0 protocol ip parent 1: prio 2 <your
> criteria_middle> flowid 1:2
> tc filter add dev eth0 protocol ip parent 1: prio 3 <your
> criteria_low> flowid 1:3
>   
why do you set a priority on filters? In my tests I always have been 
used packet marking instead of "u32 match" method without prio 
parameter. It is the same with priority?

> That works in my system.
>   
With your script I get the same result as mine: 2 parallel connections 
(with different priority), one uses all bandwitdh and the other stalls 
alternatively.

perhaps there is a timeout mechanims that forse sending queued packets 
although lower priority?


Thanks in advance,
Fabio
