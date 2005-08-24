From: Sascha Reissner <sascha.reissner@toxicnet.de>
Subject: Re: Help with iptables 1.3.3
Date: Wed, 24 Aug 2005 19:30:31 +0200
Message-ID: <430CAEB7.8060003@toxicnet.de>
References: <D2EA20593E6AAD4DA6D07DE0EC12D16162E2@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D2EA20593E6AAD4DA6D07DE0EC12D16162E2@ebs-2200.ebasedsecurity.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Raef <traef06@ebasedsecurity.com>
Cc: netfilter@lists.netfilter.org

Thomas Raef wrote:
> I'm using a Debian 2.6.11.7 kernel with iptables 1.3.1 and everything is
> working fine.
> 
>  
> 
> I wanted to update to iptables v1.3.3.
> 
>  
> 
> When I compile iptables v1.3.3 and reboot, I get a series of these
> messages:
> 
>  
> 
> iptables: target 'standard' v1.3.3 (I'm v1.3.1)
> 
> iptables: match 'limit' v1.3.3 (I'm v1.3.1)
> 
>  
> 
> Google turns up nothing, well 1 hit, but it didn't help at all.
> 
>  
> 
> Please help.
> 
>  
> 
> Thank you in advance.
> 
> 

Well it seems that you have 2 iptables binaries on your system, and the 
one you use in some bootscript is the old 1.3.1 version.

you might want to find those iptables binaries 'find / -name "iptables"' 
and maybe want to either get rid of it, or want to replace it with the 
1.3.3 version.

Regards,
Sascha

