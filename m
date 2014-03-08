From: Anthony Taylor <ataylor@fallsgeek.com>
Subject: Re: Some oddities while setting up outbound filtering on a web server
Date: Fri, 7 Mar 2014 20:05:10 -0600
Message-ID: <CA+5v4QCVs_H=4v4MS7g2AvBKyVmEA=kbwR2P+f_ok0GUaO1CGw@mail.gmail.com>
References: <CA+5v4QC81A2gU8i566G3Nh_dERTv6LbkssZDfSe664BXj=9NEg@mail.gmail.com>
	<CA+5v4QAeWp6Azau3nYpL2ev-jqstSs+-BGBMuyavbKSK85JiAg@mail.gmail.com>
	<53194F19.90708@chello.at>
	<201403070001.51011.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201403070001.51011.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, Mar 6, 2014 at 11:01 PM, Neal Murphy <neal.p.murphy@alum.wpi.edu> wrote:
> On Thursday, March 06, 2014 11:46:17 PM Mart Frauenlob wrote:
>> >> Then try to enable it???
>> >
>> > echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
>> > -su: /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal: Permission
>> > denied
>>
>> strange, don't know what is the problem there...
>
> Module nf_conntrack_ipv4 has not been INSed.

I'm not sure what that means.
