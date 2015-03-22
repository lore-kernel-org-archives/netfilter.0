From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Status of Nftables.
Date: Sun, 22 Mar 2015 19:21:49 +0100
Message-ID: <20150322182149.GA3725@salvia>
References: <CACjDgAN14zE8KRh06i4uh1G98fLhE4z+s+Q0Gm5eMZjeHNwdnQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACjDgAN14zE8KRh06i4uh1G98fLhE4z+s+Q0Gm5eMZjeHNwdnQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Albert K <alberk@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Mar 22, 2015 at 12:01:48PM +0800, Albert K wrote:
> Hi,
> 
> I have been kicking the tires of nftables and love the structured way
> to implement filter/rules and have the following questions?
> 
> 1) When is the (xt_classify.c and xt_physdev.c) from iptables
> extensions going to be implement in nft?  I want to use it to classify
> traffic in conjunction with HTB qdisc in a transparent bridge setting.

We're finishing the xt compat layer soon, that will provide access to
the existing iptables extensions from nft.
