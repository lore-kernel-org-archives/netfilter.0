From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: udplite and ports
Date: Tue, 16 Mar 2010 08:34:16 +0100
Message-ID: <4B9F3478.60702@chello.at>
References: <4B9B568F.7020609@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B9B568F.7020609@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 13.03.2010 10:12, netfilter-owner@vger.kernel.org wrote:
> Hello,
> 
> what am I missing, why is that command not working:
> 
> iptables -A INPUT -i eth2 -p udplite --destination-port 123 -j ACCEPT
> iptables v1.4.7: unknown option `--destination-port'
> Try `iptables -h' or 'iptables --help' for more information.
> 
> 
> uname -a
> Linux eris 2.6.33-eris-2010-03-06 #1 Sat Mar 6 01:36:52 CET 2010 i686
> GNU/Linux
> 
> -p udplite -m multiport --ports 123,124 ... works.
> 
> 
> Thanks for your help!
> 

No more than guessing from ratheesh?
I would have expect it to work like -p udp. Am I wrong?
But there's no libxt_udplite.so. Is a kernel config option missing?
Could not find any (all netfilter related is enabled).

What is wrong???


Thanks

Mart
