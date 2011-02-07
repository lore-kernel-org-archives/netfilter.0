From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Place for ipt_ACCOUNT/ipt_NETFLOW
Date: Mon, 07 Feb 2011 10:20:45 -0600
Message-ID: <4D501BDD.5000108@riverviewtech.net>
References: <4D4A6C6A.6000406@linux.vnet.ibm.com> <4D4B0D7B.5020703@riverviewtech.net> <4D4B8D27.3070306@linux.vnet.ibm.com> <4D4CC630.3050209@riverviewtech.net> <4D4F9735.6080006@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4F9735.6080006@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 02/07/11 00:54, Srinivasa T N wrote:
> This will double the number of rules a packet has to traverse (One rule
> for accounting and one rule for accept). Is there are other alternative?

I'd have to see an example of your rules to say for sure...

I'm using the counters of the number of packets / bytes that are matched 
by the rule for accounting.  I'm not adding any additional rules.

Further, you can engineer your rule structure so that the fewest rules / 
tests per rule are traverse by the largest number of packets.



Grant. . . .
