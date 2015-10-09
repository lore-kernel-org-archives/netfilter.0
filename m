From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft rule to redirect multiple ports using maps
Date: Fri, 9 Oct 2015 12:56:21 +0200
Message-ID: <20151009105621.GA2624@salvia>
References: <5616CE2E.1070200@arcor.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5616CE2E.1070200@arcor.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giorgio <giorgio.nicole@arcor.de>
Cc: netfilter@vger.kernel.org

On Thu, Oct 08, 2015 at 10:12:30PM +0200, Giorgio wrote:
> Hi,
> 
> in the answer at:
> 
> marc.info/?l=netfilter&m=144286539313019&w=2
> 
> there is a cool example of how to use nft maps to write a rule
> that defines multiple dnats:
> 
> nft add rule nat prerouting dnat \
>       tcp dport map { 1000 : 1.1.1.1, 2000 : 1.1.1.1 } : \
>       tcp dport map { 1000 : 1234, 1001 : 2222 }
> 
> 
> Now I would like to do something similar with port redirections
> to generalize rules like:
> 
> nft add rule nat prerouting tcp dport 22 redirect to 2222
> 
> found on the nftable wiki:
> 
> http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_%28NAT%29
> 
> Here is my (faulty) command line:
> 
> # nft add rule nat prerouting redirect to tcp dport map { 22 : 2222, 23
> : 2323 }
> <cmdline>:1:37-74: Error: transport protocol mapping is only valid after
> transport protocol match
> add rule nat prerouting redirect to tcp dport map { 22 : 2222, 23 : 2323 }
> 
> I want to redirect a list of dports (22 and 23) to a correspondent list
> of new dports (2222 and 2323).
> 
> I know that there is a way to do it but can't get the logic behind the
> syntax of this.

That is telling that protocol context is missing, try with this:

 nft add rule nat prerouting ip protocol tcp \
        redirect to tcp dport map { 22 : 2222, 23 : 2323 }

We may enhance our context generation routine so it infers the
protocol context from the 'tcp dport' in the map in the future, but
what I'm posting above should be fine by now.

You can file a bug to bugzilla as request for enhancement, so we don't
forget.

Thanks for reporting.
