From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: Re: REDIRECT question
Date: Wed, 02 Jul 2003 14:14:20 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F02BE8C.7020701@is.lg.ua>
References: <Pine.LNX.4.44.0307021159470.16552-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307021159470.16552-100000@localhost>
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Chris Wilson wrote:

>Hi Ruslan,
>
>  
>
>>i want make transaparent proxy on localhost and want to disabe access 
>>after redirecting to port 3128 if destination address in net other then 
>>193.108.240.0/22.
>>Does REDIRECT target send packet to INPUT chain and i should disable 
>>access in INPUT chain or should i disable access in '-t nat -A 
>>POSTROUTING' chain?
>>    
>>
>
>You will not be able to disable access in the POSTROUTING chain, since 
>after reading the REDIRECT rule, no further rules in that chain are 
>processed. In any case, it is not recommended to filter in the nat table. 
>The best place to put your filtering rule is in the INPUT chain.
>
>Cheers, Chris.
>
Hello, Chris.

I just want to be sure that after redirecting, the packet is going to 
input chain where i can filter it. (am i right?)

Thanks for your reply.

Best regards,
Ruslan



