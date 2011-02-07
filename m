From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Place for ipt_ACCOUNT/ipt_NETFLOW
Date: Mon, 07 Feb 2011 12:24:45 +0530
Message-ID: <4D4F9735.6080006@linux.vnet.ibm.com>
References: <4D4A6C6A.6000406@linux.vnet.ibm.com> <4D4B0D7B.5020703@riverviewtech.net> <4D4B8D27.3070306@linux.vnet.ibm.com> <4D4CC630.3050209@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4CC630.3050209@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Saturday 05 February 2011 09:08 AM, Grant Taylor wrote:
> On 02/03/11 23:22, Srinivasa T N wrote:
>> But adding rules to discard the unwanted traffic and then do an
>> accounting for the rest of the packets in not a good idea. I may not
>> even know what type of packets may arrive and writing rules to discard
>> each of unwanted packets is difficult. So, I prefer to write rules to
>> accept only the packets that are required and then drop the other
>> packets. I wanted to do the accounting only for packets that I accept.
>
> Do the accounting on the rules that you write to decide what traffic to
> accept.
>
This will double the number of rules a packet has to traverse (One rule 
for accounting and one rule for accept).  Is there are other alternative?

Regards,
Seenu.
