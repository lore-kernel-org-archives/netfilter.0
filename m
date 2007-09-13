From: Stefan Lamby <slamby@gmx.de>
Subject: Re: INPUT and uid-owner
Date: Thu, 13 Sep 2007 14:49:49 +0200
Message-ID: <46E931ED.2050908@gmx.de>
References: <9ace7c010709130520l249e5952ib39dca1d601cd68c@mail.gmail.com>
	<46E92F34.7000709@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46E92F34.7000709@gmx.de>
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
To: SoFy DeNiro <sofy.guru@gmail.com>
Cc: netfilter@lists.netfilter.org

sorry, this is not the correct link, please use:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Stefan Lamby schrieb:
> there is something that could fit your needs:
> go to http://iptables-tutorial.frozentux.net/iptables-tutorial.htm and
> search for owner match.
>
> Hope this helps.
> Stefan
>
> SoFy DeNiro schrieb:
>   
>> Hi,
>>
>> Is there's anyway to use INPUT chain with uid-owner ?
>>
>> something like that :
>>
>> iptables -A INPUT -p tcp -mowner --uid-owner root --dport 80 -j DROP
>>
>> Thanks,
>> SoFy.
>>
>>
>>     
>
>
>   


