From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: log in netdev not possible? (Error: Could not process
 rule: No such file or directory)
Date: Thu, 27 Oct 2016 21:35:52 +0200
Message-ID: <20161027193552.GB1570@salvia>
References: <CAGmahrSLeMcs4Q+nmtgQ=qnvzeXEWbNz37VtpMoPffWVJL0iZQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGmahrSLeMcs4Q+nmtgQ=qnvzeXEWbNz37VtpMoPffWVJL0iZQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sverd Johnsen <sverd.johnsen@googlemail.com>
Cc: netfilter@vger.kernel.org

On Fri, Oct 21, 2016 at 12:53:56PM +0200, Sverd Johnsen wrote:
> This works:
> 
> table netdev filter {
>     chain test {
>         type filter hook ingress device eth0 priority 0; policy accept;
>         counter packets 43 bytes 2820
>     }
> }
> 
> This does not:
> 
> table netdev filter {
>   chain test {
>   type filter hook ingress device eth0 priority 0;
>     counter log
>   }
> }
> 
> # nft -f /etc/nftables.conf
> 
> 
> 
> 
>  :(
> /etc/nftables.conf:112:1-2: Error: Could not process rule: No such
> file or directory
> table netdev filter {
> ^^

Just for the record (people searching for this), I posted this patch,
so this should hit upstream for the 4.10 release:

http://patchwork.ozlabs.org/patch/687918/
