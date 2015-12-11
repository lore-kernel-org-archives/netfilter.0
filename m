From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: block ip fragmented packet
Date: Fri, 11 Dec 2015 18:22:08 +0100
Message-ID: <20151211172208.GA1580@salvia>
References: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com>
 <CAEzD07+oCs_W6P760okms=g38HEM_YuGNFx_-YodYDX328D6qA@mail.gmail.com>
 <566A85EE.4030502@plouf.fr.eu.org>
 <ADD0C2D1-9082-4F33-AFBE-637A3778B5B8@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ADD0C2D1-9082-4F33-AFBE-637A3778B5B8@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Satish Patel <satish.txt@gmail.com>
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>, Anton Danilov <littlesmilingcloud@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Dec 11, 2015 at 07:53:12AM -0500, Satish Patel wrote:
> I'm testing this rule from remote machine and sending fragmented packet using hping3 utility. 
> 
> -f  iptables option is not going to work if conntrack there. 
> 
> I don't know why it's so hard for iptable to block something like this. 

You got nf_defrag_ipv4 loaded (it comes with conntrack), therefore,
fragments are reassembled before entering conntrack, then fragmented
back from the output path.

In nftables you can add a chain *before* priority -400 that should see
fragmented packets.
