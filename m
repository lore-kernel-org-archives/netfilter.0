From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: best approach for blocklist
Date: Fri, 05 Mar 2010 18:48:54 +0100
Message-ID: <4B914406.1090306@chello.at>
References: <4B912EA0.1060604@conversis.de>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B912EA0.1060604@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 05.03.2010 17:17, netfilter-owner@vger.kernel.org wrote:
> Hi,
> I'm wondering what the most efficient way to implement a blocklist is.
> We are basically talking about blocking a few thousand IPs. Does
> iptables do some internal optimizations when blocking based on a source
> address or would it be better to, say, create a chain for each class A
> net (e.g. 83.0.0.0/8) and then add the IPs in that range to that class
> to make the matching more efficient?
> 
> Regards,
>   Dennis

things i would take into consideration:

- drop in raw table (avoid conntrack)
- use user-defined chains
- use ipset to match many IPs

best regards

Mart
