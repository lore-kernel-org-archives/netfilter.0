From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Place for ipt_ACCOUNT/ipt_NETFLOW
Date: Thu, 03 Feb 2011 14:18:03 -0600
Message-ID: <4D4B0D7B.5020703@riverviewtech.net>
References: <4D4A6C6A.6000406@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4A6C6A.6000406@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 02/03/11 02:50, Srinivasa T N wrote:
> Is it possible for me to place rules related to accounting after filter
> table in the INPUT chain so that the accounting takes place only on the
> packets I am accepting in my box?

I hope I'm understanding you correctly.

It sounds like you are wanting to do your accounting after you filter 
out most of the chaff / noise / IBR that you don't want.  Correct?

If this is the case, why don't you have your filtering rules DROP / 
REJECT / otherwise discard the packets you don't want and then have a 
follow up rule that ACCEPTS the packet and do your accounting there?

At least if I understand you correctly, filtering packets before they 
hit your accounting rule should do what you are wanting.



Grant. . . .
