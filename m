From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with SNAT
Date: Thu, 02 Sep 2004 16:17:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094156271.1994.25.camel@wolfpack.ljm.dom>
References: <41376D0E.3070208@bgs.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41376D0E.3070208@bgs.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-02 at 14:57, Bgs wrote:
>   Greetings,
> 
> I have problems with the following setup:
> 
> A linux with two NICs. One with IP of 10.0.2.2 and one with 10.0.3.57.
> I have DNAT-ed traffic coming in on the 10.0.2.2 that was originally 
> sent to 10.0.2.1. (Another node doing the DNAT). I have problems on the 
> route back so I decided to SNAT the backward udp traffic to  soource 
> 10.0.2.1 and send the SNATed packets back on another route.
> 
> I added the line to nat postrouting (-d target_net -s 10.0.2.2 -p udp -j 
> SNAT --to-source 10.0.2.1) but the packages don't even seem to hit the 
> nat postrouting chain. Let alone my SNAT rule.
> 
> Any ideas what could be wrong ?
> 
> Thanks
> Bgs

since i have to guess (hint:  post your rules [1] if you want us to find
the problem for you)...

i would say that your filter rules drop the packet before they ever get
to the POSTROUTING chain of the nat table.

-j

[1] - iptables -vnL && iptables -t nat -vnL && iptables -t mangle -vnL

-- 
Jason Opperisano <opie@817west.com>


