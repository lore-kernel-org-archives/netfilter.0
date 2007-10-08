From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: Interesting message
Date: Sun, 07 Oct 2007 20:54:43 -0600
Message-ID: <C32EF813.B3C7%jlay@slave-tothe-box.net>
References: <47068471.5000403@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47068471.5000403@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>




On 10/5/07 12:37 PM, "Grant Taylor" <gtaylor@riverviewtech.net> wrote:

> On 10/05/07 12:51, James Lay wrote:
>> So I'm not sure how I managed to do this, but here it is:
>> 
>> sudo iptables -A FORWARD -s 10.0.0.0/8 -m string --string
>> "myspace.com" --algo bm -j DROP
>> iptables: match `string' v1.3.6 (I'm v1.3.8).
>> 
>> I'm running kernel 2.6.21.7.  Is there something I'm missing to get
>> this to fly?  Thanks all.
> 
> 
> I'm not sure but it looks like you have a kernel IPTables version vs
> IPTables module version mismatch.  Did you by chance upgrade your kernel
> or have any updates applied to your system?
> 
> 
> 
> Grant. . . .
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Grant,

I've just recompiled my kernel...same kernel version, but now compiled with
1.3.8.  I still get the same message.  Is there something obvious that I'm
missing here?  Thanks.

James


