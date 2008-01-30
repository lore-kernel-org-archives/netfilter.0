From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: limit module
Date: Wed, 30 Jan 2008 12:02:17 -0600
Message-ID: <47A0BBA9.3020703@riverviewtech.net>
References: <20080130161344.GA33214@diabolo.evga.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080130161344.GA33214@diabolo.evga.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 01/30/08 10:13, Alexey Vlasov wrote:
> # iptables -A INPUT -p tcp -s 111.222.111.222 --syn -m limit --limit 1/s
> --limit-burst 50 -j ACCEPT
> # iptables -A INPUT -p tcp -s 111.222.111.222 --syn -m limit
> --limit-burst 1000 -j LOG
> 
> Do I understand right that according to the first rule through it can
> pass only 50 SYN packets per second. If I am right, then it can be
> checked like this: I launch 50 times all at once "telnet dst_host 80" and
> look at the counter:

It is my (mis)understanding that the limit match extension will allow 
the rate of packets specified with a possible burst of what ever is left 
over out of the burst buffer (if you will).  If there are no packets 
matching the rule, they number of packets that did not come through goes 
in to the burst buffer up to the point the burst buffer is full.

Think of it this way:  You have a bucket that burst buffer in size that 
is filled at limit speed.  You can take packets out of the bucket as 
fast as possible (burst) up to the point that there are no more packets 
in the bucket.  Once the bucket is empty, you can only take the packets 
out of the bucket as fast as they are replenished, thus the limit speed.

The burst is intended to allow short infrequent requests to pass as fast 
as possible up to the limit of a grace (burst).  Once the grace (burst) 
is exceeded, start rate limiting the requests.

> Here goes that 50 packets came, but why only 16 came through the first
> rule?

With out knowing the timing on your tests (down to the millisecond) I 
can only guess.  I'd say that your tests were off based on timing 
between multiple runs.  Had you said X number of packets per minute you 
may be able to get a more accurate test.



Grant. . . .
