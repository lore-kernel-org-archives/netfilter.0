From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: drop ssh brute force with ip block
Date: Thu, 23 Jun 2016 12:34:30 +0200
Message-ID: <20160623103430.GA10616@salvia>
References: <5766E34B.4040008@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5766E34B.4040008@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Irwin L." <biatche@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Jun 20, 2016 at 02:24:11AM +0800, Irwin L. wrote:
> As subject says.
> 
> tcp dport {22} counter limit rate 3/minute counter accept comment "avoid
> brute force"
> 
> I've tried something like this, but it seems to limit ALL ips.
> I would prefer to block the ip address for 24 hours or something.

Try something like:

# nft add rule x y tcp dport 22 \
        flow table ssh-bruteforce { ip saddr limit rate 3/minute } \
                accept comment \"avoid brute force\"

This is ratelimiting based on the source IP address.

You can consult the content of this flow table via:

# nft list flow table x ssh-bruteforce
...

The current output of this specific command is not stable,

You require a relatively recent kernel and nft 0.6 to get this
working.

BTW, please don't use:

        tcp dport { 22}

The curly braces have very specific semantics, ie. they are requesting
the kernel to create a set. In this specific case, this is overkill
since this will create a set with *only one single element*. Thus:

        tcp dport 22

is better.
