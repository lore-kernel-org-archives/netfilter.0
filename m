From: vikrant <vikrant@saysnetsoft.com>
Subject: Re: Two interfaces - question
Date: Wed, 04 Jan 2006 18:00:13 +0530
Message-ID: <43BBBFD5.1090609@saysnetsoft.com>
References: <200601041103.12130.marcin.giedz@eulerhermes.pl>
	<43BBAE9F.9080307@saysnetsoft.com>
	<200601041236.45830.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601041236.45830.marcin.giedz@eulerhermes.pl>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Cc: netfilter@lists.netfilter.org

Marcin Giedz wrote:

>Dnia środa, 4 stycznia 2006 12:16, vikrant napisał:
>  
>
>>Marcin Giedz wrote:
>>    
>>
>>>Hello,
>>>
>>>In my INtel Blade server I have two ethernet interfaces: eth0, eth1. Now
>>>only one is working, the another one is not configured. However I'd like
>>>to have something like dynamic routing: if one interfaces is down the
>>>second one if
>>>      
>>>
>>i am getting little confused when u say interface goes down please
>>explain .
>>    
>>
>OK - very spimle. Let's say that network cable is damage or someone has 
>disconnected cable from the card. If one cable is unplagged (eth0) the second 
>one (eth1) becames master.
>
>
>  
>
>>what do u mean from interface does down whether interface card become
>>inactive or network cable get damage or ISP connection goes down please
>>clarify it .
>>
>>    
>>
>>>up. If first returns up the second one goes down.
>>>
>>>Does anyone know how can I do this?
>>>
>>>Thx,
>>>Marcin
>>>      
>>>
>>Thanks
>>Vikrant
>>    
>>
>
>
>  
>
I am considering that both the interfaces are using as external interface.
I don't  know the right way to track the connectivity ,I think Routing 
Protocol e.g BGP,RIP,IGP or OSPF are the solution for this  kind of  
problem.
But ,what i did to do this ,write a script that ping the ISP DNS  and 
set the status value (variable)according to packet loss % and then take 
action according to the status value , ifdown eth0 -> ifup eth1 -> make 
changes to iptables rules  , and vice-versa.
add the script in crontab so that it runs after a certain time period 
and perform the checking.
I am just a beginner so please do not consider it as the final solution.
Please know me if u find the right ans to ur ques.
and sorry for bad english.

Thanks
Vikrant

