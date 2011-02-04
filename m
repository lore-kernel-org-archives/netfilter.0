From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Place for ipt_ACCOUNT/ipt_NETFLOW
Date: Fri, 04 Feb 2011 10:55:34 +0530
Message-ID: <4D4B8DCE.4030003@linux.vnet.ibm.com>
References: <4D4A6C6A.6000406@linux.vnet.ibm.com> <1296752158.4980.106.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296752158.4980.106.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thursday 03 February 2011 10:25 PM, Bob Miller wrote:
> On Thu, 2011-02-03 at 14:20 +0530, Srinivasa T N wrote:
>> Hi All,
>>       Is it possible for me to place rules related to accounting after
>> filter table in the INPUT chain so that the accounting takes place only
>> on the packets I am accepting in my box?
>
> According to the nf-packet-flow diagram I have been referring too, the
> INPUT chain on the filter table is the place to count packets destined
> only for the box.
> If that is not correct, I hope someone says so, because it would explain
> some confusion I have been having lately...
You are correct in saying that the packets destined for my box come in 
INPUT chain.  But, I will have the rules to filter out unwanted stuff in 
that table and do the accounting only for those packets which pass 
through these rules and reach upper layer.
>
>>
>> Regards,
>> Seenu.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> Bob Miller
> 334-7117/660-5315
> http://computerisms.ca
> bob@computerisms.ca
> Network, Internet, Server,
> and Open Source Solutions
>
>
Regards,
Seenu.
