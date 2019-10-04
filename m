From: Florian Westphal <fw@strlen.de>
Subject: Re: Cannot add ip6 elements to a named set
Date: Fri, 4 Oct 2019 16:58:13 +0200
Message-ID: <20191004145813.GG13866@breakpoint.cc>
References: <b99d882d69f5e152919339c65ac26163@mailtower.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b99d882d69f5e152919339c65ac26163@mailtower.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt <matt-nft@mailtower.de>
Cc: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

Matt <matt-nft@mailtower.de> wrote:
> However, doing the same with ipv6 doesn't work for me:
> #nft add set filter_v6 my_drop \{type ipv6_addr \; flags timeout \;
> elements=\{fda5:2c8a:af4c:a95e::64 timeout 60s\} \;\}

Try:
nft add set ip6 filter_v6 ...
