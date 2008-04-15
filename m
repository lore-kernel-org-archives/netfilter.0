From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT Port Forward problem in a not so simple network
Date: Tue, 15 Apr 2008 11:45:45 -0500
Message-ID: <4804DBB9.7030307@riverviewtech.net>
References: <480479E8.3040904@naxe.it> <4804C25C.7020608@riverviewtech.net> <4804D643.2090101@naxe.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4804D643.2090101@naxe.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/15/08 11:22, Fabio De Paolis wrote:
> Absoluttely CORRECT, your description is very very good.

*nod*  Now I know that I am on track and that it is safe to go down the 
path that I was thinking about.

> Another goal should be to minimize traffic on C for service running on D.

Hum.  This new goal may be problematic.  The problem is that A is 
DNATing traffic to C that you now want to be re-directed elsewhere.  So 
with out re-configuring A, the traffic is going to continue to be DNATed 
to C.  What is better in the long run is to have A DNAT the traffic to B 
which will then DNAT the traffic in to D.

How much control do you have over B?

Can you request changes be made to A on your behalf?

I recently helped someone else on this list with a similar scenario. 
However in their scenario both C and D were directly connected to the 
internet via different providers and there was a VPN between C and D. 
The goal was to port forward connections originally to C over to D and 
have the replies go back through C and out to the original client.  We 
ended up getting things to work exactly as they needed to.  However all 
the traffic for the forwarded service was still passing through C on its 
way to D, which you are now wanting to avoid.



Grant. . . .
