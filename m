From: Yawhen Kasarzhewski <yevg@pisem.net>
Subject: Re: Expectation table size
Date: Sat, 11 Oct 2008 15:12:03 +0300
Message-ID: <48F09813.8080600@pisem.net>
References: <48EF68D6.7020807@pisem.net> <20081010170650.GD11769@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081010170650.GD11769@bayen.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Leblond <eric@inl.fr>, netfilter@vger.kernel.org

Hi,

this helped a bit. But I am still receving following:

nf_ct_h323: incomplete TPKT (fragmented?)
nf_ct_q931: packet dropped

Are there any unconfigured kernel parameters that cause these messages 
or can I safely ignore them?

Eric Leblond wrote:
> Hi,
>
> On Friday, 2008 October 10 at 17:38:14 +0300, Yawhen Kasarzhewski wrote:
>   
>> Hi,
>>
>> does any one know which is the default expectation table size and how to  
>> enlarge it?
>>
>> I get lots of messages in dmegs like:
>>
>> nf_ct_q931: packet dropped
>> __ratelimit: 129 messages suppressed
>> nf_conntrack: expectation table full
>>     
>
>
> You can try to use :
> 	/proc/sys/net/netfilter/nf_conntrack_expect_max
>
> It should behave like /proc/sys/net/netfilter/nf_conntrack_max.
>
> BR,
>   

