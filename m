From: ro0ot <ro0ot@phreaker.net>
Subject: Re: lots of tcp port 445 traffic
Date: Fri, 10 Dec 2004 21:52:42 +0800
Message-ID: <41B9AA2A.4020804@phreaker.net>
References: <41B48EB0.3030307@phreaker.net>	<1102622745.16437.6.camel@nostromo.bgsecm.com>
	<99fb058804120913377e13904a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <99fb058804120913377e13904a@mail.gmail.com>
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
To: Paul Annesley <paul.annesley@gmail.com>
Cc: netfilter@lists.netfilter.org

I include these rules below and it helps: -

iptables -t nat -A PREROUTING -p tcp --dport 135 -j DROP
iptables -t nat -A PREROUTING -p tcp --dport 445 -j DROP


Paul Annesley wrote:

>>>iptables -I cus2jarwan -p tcp --dport 445 -j REJECT --reject-with tcp-reset
>>>
>>>or
>>>
>>>iptables -I cus2jarwan -p tcp --dport 445 -j DROP
>>>
>>>      
>>>
>>You definately don't want to use -J REJECT - this will do more harm
>>than good, as it will be generating an ICMP unreachable message for
>>each port 445 packet.
>>    
>>
>
>My mistake - I didn't notice you were using "--reject-with tcp-reset".
>Pretty sure you'd be better off with DROP anyway.
>
>Regards,
>Paul
>
>
>  
>

