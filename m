From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Wed, 03 Oct 2007 20:17:25 -0500
Message-ID: <47043F25.4000504@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain> <47042728.1060508@riverviewtech.net> <47042AD0.2080806@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47042AD0.2080806@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/3/2007 6:50 PM, Pascal Hambourg wrote:
> To be exhaustive, the only exception is in the OUTPUT chain on kernel 
> versions less than 2.6.11, when DNAT changes the output interface the 
> source address is also changed in order to match the new interface. 
> However DNAT in the PREROUTING chain never changes the source address.

Ah, thank you for being exhaustive.  That makes more sense and supports 
what I have seen.

However this begs the question of what the original poster's 
configuration is that s/he is seeing this type of behavior.



Grant. . . .
