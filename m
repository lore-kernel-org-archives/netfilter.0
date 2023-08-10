From: Florian Westphal <fw@strlen.de>
Subject: Re: Incompatibility when use python3-nftables and iptables-nft
Date: Fri, 11 Aug 2023 00:47:43 +0200
Message-ID: <20230810224743.GB11463@breakpoint.cc>
References: <CAH+uSBVmDF0kUTM2UFKZr2iFeFzMeZ2958sttgZGXftwR6H3MA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAH+uSBVmDF0kUTM2UFKZr2iFeFzMeZ2958sttgZGXftwR6H3MA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wayne Bao <herecomeswaynebao0811@gmail.com>
Cc: netfilter@vger.kernel.org

Wayne Bao <herecomeswaynebao0811@gmail.com> wrote:
> I am using python3-nftables
> (https://github.com/ansibleguy/python3-nftables) to programatically
> update rules, and at the same time using iptables-nft from commandline
> to manage rules. I see incompatibility when I use these two together:

Yes, nft and iptables-nft are incompatible.
