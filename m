From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Place for ipt_ACCOUNT/ipt_NETFLOW
Date: Fri, 04 Feb 2011 21:38:24 -0600
Message-ID: <4D4CC630.3050209@riverviewtech.net>
References: <4D4A6C6A.6000406@linux.vnet.ibm.com> <4D4B0D7B.5020703@riverviewtech.net> <4D4B8D27.3070306@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4B8D27.3070306@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 02/03/11 23:22, Srinivasa T N wrote:
> But adding rules to discard the unwanted traffic and then do an
> accounting for the rest of the packets in not a good idea. I may not
> even know what type of packets may arrive and writing rules to discard
> each of unwanted packets is difficult. So, I prefer to write rules to
> accept only the packets that are required and then drop the other
> packets. I wanted to do the accounting only for packets that I accept.

Do the accounting on the rules that you write to decide what traffic to 
accept.



Grant. . . .
