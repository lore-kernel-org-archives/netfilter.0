From: Rafael Dreher <dreher@interage.com.br>
Subject: Re: Unable to add rule on Chain with 28 characters.
Date: Mon, 11 Jul 2005 10:11:54 -0300
Message-ID: <42D2701A.4030205@interage.com.br>
References: <42CECD47.5050003@interage.com.br>
	<20050708195049.GA7221@bender.817west.com>
	<42CEDB7F.3060609@interage.com.br>
	<6.0.1.1.2.20050708131029.01f2b9a8@insight.ip3.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.0.1.1.2.20050708131029.01f2b9a8@insight.ip3.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Royce Kemp <rkemp@ip3.com>
Cc: netfilter@lists.netfilter.org

So, that's a BUG.

Why iptbles let me add a chain with 30 characters, if I can't use this chain?

[root@ward] [10:07:54]
[~]#iptables -t nat -N 123456789012345678901234567890

[root@ward] [10:08:05]
[~]#iptables -t nat -A POSTROUTING -j 123456789012345678901234567890
iptables: No chain/target/match by that name

Hey, gurus, can anyone help me? :)

Thank's

Royce Kemp wrote:
> I have run into this problem as well. Learn to stick to 28 characters.
> 
> -r
> 
> At 01:01 PM 7/8/2005, Rafael Dreher wrote:
> 
>>>> Hi,
>>>>
>>>> I'm trying do add a rule on a user-defined chain, on the NAT table, 
>>>> with 28 characters.
>>>
>>>
>>> my guess is you're leaving out the '-t nat' as custom chains only exist
>>> in the table they're created in:
>>
>>
>> Hi, again.
>>
>> I guess no. :)
>>
>> [root@ward] [16:55:58]
>> [~]#iptables -t nat -N ecommerce-internet@POSTROUTING
>>
>> [root@ward] [16:56:01]
>> [~]#iptables -t nat -A POSTROUTING -j ecommerce-internet@POSTROUTING
>> iptables: No chain/target/match by that name
>>
>> [root@ward] [16:56:19]
>> [~]#
>>
>> Am I crazy? :)
>>
>> This chain has 30 characters... the max.. if I reduce it to 28, it's 
>> added wihtout any problem.
>>
>> Thank's
>>
>> -- 
>> Rafael Dreher
>>
>> -:: Red Hat Certified Engineer ::-
>> -:: Nr: 807303498507617 ::-
>> http://www.redhat.com/training/certification/verify
> 
> 
> 
> 


-- 
Rafael Dreher
-:: Interage Integradora ::-
-:: Pesquisa e Desenvolvimento ::-
-:: www.gatepro.com.br || www.interage.com.br ::-
-:: Red Hat Certified Engineer ::-
-:: Nr: 807303498507617 ::-
http://www.redhat.com/training/certification/verify

