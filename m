From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: how to discard a netfilter rule
Date: Thu, 28 Feb 2013 04:02:30 -0500
Message-ID: <201302280402.30822.neal.p.murphy@alum.wpi.edu>
References: <CAJhv45jOTpijtRJrqV7TCE6Y469W1DY8d1NWBnSSz0NYw+6-Jg@mail.gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJhv45jOTpijtRJrqV7TCE6Y469W1DY8d1NWBnSSz0NYw+6-Jg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, February 28, 2013 01:26:52 AM Donghua Liu wrote:
> Hi,
> 
> Say if I set a netfilter rule by "iptables -t nat -A custom_chain -p
> tcp -dport 80 -j DNAT --to-destination 127.0.0.1:1234" for some
> requirement.
> 
> I also have a LKM which will check the availablity of service
> "127.0.0.1:1234" and how can I cancel the rule's operation(Do NOT
> delete this rule), let the packet go as usual ignore the nat.

Assuimg '-j RETURN' is valid, put the rule in chain 'custchainNAT' by itself 
and add a jump to that chain from custom_chain. To disable the nat, insert 
(via -I 1) a '-j RETURN' rule in 'custchainNAT' before the NAT rule. To re-
enable it, delete the RETURN rule.
