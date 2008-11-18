From: Bill Chappell <chappewr@critical.com>
Subject: Re: specified protocl number problem
Date: Tue, 18 Nov 2008 02:47:48 -0500
Message-ID: <49227324.4080508@critical.com>
References: <59826.13109.qm@web55306.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <59826.13109.qm@web55306.mail.re4.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bahamin takhtaei <b_takhtaei@yahoo.com>
Cc: netfilter <netfilter@vger.kernel.org>

The packets you are seeing (TCP, UDP, and ICMP)
are what you would get if you were to specify
"-p all".
"all" is not as inclusive as one might expect.
To get packets with other protocols, you must
specific them explicitly.

Bill

bahamin takhtaei wrote:
> Hi everybody,
> 
> Why I can't QUEUE some ip-protocol packets such as IGMP, AH, ESP 
> and so on?
> I add these rules to Iptables:
> 
> iptables -A INPUT -j QUEUE
> iptables -A OUTPUT -j QUEUE
> 
> and I see that TCP, UDP and ICMP packets are queued only and 
> other protocol packets are not! But I see them by tcpdump. :(
> 
> 
> 
>       
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
William Chappell, Software Engineer, Critical Technologies Inc.
* Creativity * Diversity * Expertise * Flexibility * Integrity *
Suite 400 Technology Center, 4th Floor 1001 Broad St, Utica NY 13501
315-793-0248 x148 FAX -9710 <bill.chappell@critical.com> www.critical.com
