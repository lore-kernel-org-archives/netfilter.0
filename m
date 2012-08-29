From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: was there a syntax rule change regarding the use of '!'
Date: Wed, 29 Aug 2012 08:30:26 -0400
Message-ID: <201208290830.26549.neal.p.murphy@alum.wpi.edu>
References: <503E3E68.9040703@elvar.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <503E3E68.9040703@elvar.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday, August 29, 2012 12:08:08 PM Elvar wrote:
> Hello,
> 
> I just deployed by first Ubuntu 12.04 install and I was seeing errors in
> my typical iptables script. I found that I had to change the order of
> where I placed my '!' in the rule. For example...
> 
> OLD -> iptables -A FORWARD -i eth1 -s ! 192.168.42.0/24 -j DROP
> NEW -> iptables -A FORWARD -i eth1 ! -s 192.168.42.0/24 -j DROP
> 
> 
> I don't see anything about this in the changelog so I was just wondering
> if anyone else has seen this as well.

A little hard to find. But yes, this changed a little while ago to 'prefix' 
only (! -opt value); 'infix' (-opt ! value) is no longer valid.
