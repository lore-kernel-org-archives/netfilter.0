From: Frederic Gobin <frederic.gobin@earthtvnet.com>
Subject: Re: What does this mean ?
Date: Wed, 19 Mar 2003 12:16:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E75167C-59FC-11D7-8181-0003938423EC@earthtvnet.com>
References: <1048071901.2375.34.camel@raylinux.internal>
Mime-Version: 1.0 (Apple Message framework v551)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048071901.2375.34.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

So I can add a rule to drop thos packets without having any problems ?
(That could clear the logs a bit ;-))

Frederic Gobin

Am Mittwoch, 19.03.03 um 12:05 Uhr schrieb Raymond Leach:

> That would be IE clients browsing the web. IE is the only browser I've
> found that does this.
>
> On Wed, 2003-03-19 at 11:51, Frederic Gobin wrote:
>> Hi there everybody,
>>
>> I have one question :
>>
>> 	Each time I look into my firewall logs, I see many dropped packets
>> that match this pattern :
>>
>> 	Protocol 		: TCP
>> 	Source port	: 80
>> 	Dest port		: 1024-65535
>> 	Flags		: ACK FIN
>>
>> Where are those packets comming from ?
>>
>> Thanks for reading and Thanks for each answer I get ...
>>
>> Frederic Gobin
> -- 
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> (  Raymond Leach                       )
>  ) Knowledge Factory                  (
> (                                      )
>  ) Tel: +27 11 445 8100               (
> (  Fax: +27 11 445 8101                )
>  )                                    (
> (  http://www.knowledgefactory.co.za/  )
>  ) http://www.saptg.co.za/            (
> (  http://www.mapnet.co.za/            )
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    o                                o
>     o                              o
>         .--.                  .--.
>        | o_o|                |o_o |
>        | \_:|                |:_/ |
>       / /   \\              //   \ \
>      ( |     |)            (|     | )
>      /`\_   _/'\          /'\_   _/`\
>      \___)=(___/          \___)=(___/
>
> <signature.asc>


