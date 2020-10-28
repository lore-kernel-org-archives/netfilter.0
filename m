From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Wiki inaccuracy regarding the 'redirect' statement
Date: Wed, 28 Oct 2020 23:23:48 +0100
Message-ID: <20201028222348.GB25697@salvia>
References: <40860804-5378-d32d-371e-a38ab9a43af5@dirdi.name>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40860804-5378-d32d-371e-a38ab9a43af5@dirdi.name>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirdi <lists@dirdi.name>
Cc: netfilter user mailinglist <netfilter@vger.kernel.org>

On Tue, Oct 27, 2020 at 01:03:56PM +0100, dirdi wrote:
> Hi there,
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)#Redirect
> states that the _redirect_ statement "only makes sense in a prerouting
> chain of NAT type."
> 
> This is AFAICS inaccurate. A _redirect_ statement is also useful if one
> wants to redirect outgoing traffic through a local, transparent proxy,
> cf. the example configuration to route traffic through a local tor
> client
> https://trac.torproject.org/projects/tor/wiki/doc/TransparentProxy#LocalRedirectionThroughTor
> .
> 
> This is seconded by nft's man page, which states that "dnat and redirect
> statements are only valid in the prerouting and output chains".
> 
> Therefore I suggest to patch the aforementioned Wiki page:
> - Note that: ''redirect'' only makes sense in a prerouting chain of NAT
> type.
> ---
> + This example redirects outgoing 53/tcp traffic to a local proxy
> listening on port 10053/tcp:
> +
> + <source lang="bash">
> + % nft add rule nat output tcp dport 853 redirect to 10053
> + </source>
> +
> + Note that: ''redirect'' only makes sense in prerouting and output
> chains of NAT type.

I have applied this change, thanks.
