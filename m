From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Policy Accept + Allow Multiple IP's
Date: Mon, 15 Nov 2004 17:19:07 -0800
Message-ID: <4199558B.6080006@wildcash.com>
References: <41994F2D.70105@wildcash.com>	<99fb058804111423054365bd85@mail.gmail.com>
	<99fb0588041114231136b9056e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <99fb0588041114231136b9056e@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Thanks Paul,

Was hoping for a simple solution and well please to know I can do it 
both ways.

Many thanks
Best regards Rudi

Paul Annesley wrote:

>---------- Forwarded message ----------
>From: Paul Annesley <paul.annesley@gmail.com>
>Date: Mon, 15 Nov 2004 18:05:17 +1100
>Subject: Re: Policy Accept + Allow Multiple IP's
>To: Rudi Starcevic <tech@wildcash.com>
>
>
>On Mon, 15 Nov 2004 16:51:57 -0800, Rudi Starcevic <tech@wildcash.com> wrote:
>
>
>  
>
>>Hi,
>>
>>I have an Iptables firewall with a default policy of accept.
>>
>>I want to allow only certain IP's ssh access.
>>
>>So far I have this rule which allows 1 ip:
>>
>>iptables -A INPUT -p tcp --dport 22 -s ! xxx.xxx.xxx.xxx -j DROP
>>
>>I'm not sure how to list more that 1 allowable IP.
>>
>>This is a production box I've inherited so I'm hoping to work with I already
>>have but may need to look at changing the default policy to drop or
>>something.
>>    
>>
>
>Perhaps you should look at making the policy DROP and allowing
>specific traffic..
>However what you're after can be done with two rules.. something like;
>
>iptables -A INPUT -p tcp --dport 22 -s x.x.x.x -j ACCEPT
>iptables -A INPUT -p tcp --dport 22 -j DROP
>
>  
>
>>Please advise, many thanks.
>>Regards Rudi
>>
>>
>>    
>>
>
>
>
>  
>


