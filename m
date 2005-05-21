From: anthonys@faredge.com.au
Subject: Re: Limiting connections per IP per port
Date: Sat, 21 May 2005 22:12:04 +1000 (EST)
Message-ID: <2087.147.10.157.98.1116677524.squirrel@147.10.157.98>
References: <20050520115932.D1635200009D@bmx2.internap.com>
	<Pine.LNX.4.62.0505200907240.27380@dgray-test.acs.internap.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0505200907240.27380@dgray-test.acs.internap.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Damon Gray <dgray@internap.com>
Cc: netfilter@lists.netfilter.org

Damon:

Thanks for the reply.
I had a poke around at that, but to me, that rule says:
Insert a rule, that applies to SYN packets on port 25, that only allows
four connections --> in total <-- to port 25.

Am I reading that correctly? Or will that limit to 4 connections per IP,
as I wish?

Thanks!

Anthony

>
> Take a look at the connlimit module in patch-o-matic-ng. It's default
> behavior is to limit connections per IP.
>
> iptables -I INPUT 1 -p tcp --syn --dport 25 -m connlimit
> --connlimit-above 4 -j REJECT --reject-with tcp-reset
>
> You will however most likely need to patch your kernel to use it.
>
> -Damon-
>
> On Fri, 20 May 2005, Anthony Sadler wrote:
>
>> Hey
>>
>> First post :D
>>
>> I have a linux mail server that is getting spammed and mail bombed. In
>> an
>> attempt to control this, we are trying to limit the amount of
>> connections to
>> the server on port 25.
>> Now we don't want to limit the total connections that are allowed to
>> connect, we would like to say that IP 1.2.3.4 can only have 4 sessions
>> open
>> to us.
>>
>> I've been looking at the IP_LIMIT module for iptables, but it seems I
>> can
>> only either limit total connections, or do it on a per IP basis (which
>> would
>> be impossible).
>>
>> So to summarise, I want as many separate hosts to connect, but only to
>> be
>> allowed, say, 4 concurrent connections.
>>
>> Thanks!
>>
>> Anthony Sadler
>>
>>
>>
>>
>
>



