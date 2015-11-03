From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables segv while trying to use nat redirection with map
Date: Tue, 3 Nov 2015 13:08:47 +0100
Message-ID: <20151103120847.GA2559@salvia>
References: <56239149.2010805@gmail.com>
 <20151018180053.GA1826@salvia>
 <5637F161.3090308@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5637F161.3090308@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Horsley <steve.horsley@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Nov 02, 2015 at 11:27:29PM +0000, Steve Horsley wrote:
> Sorry for the delay in answering.
> 
> I installed the development version of Ubuntu 16.10 with proposed updates.
> With this version, nft -v reports version 0.5. My original set of commands
> now works without crashing, so thanks for the advice to try version 0.5.
> 
> However, this set of commands still fails:
> 
> # nft flush ruleset
> # nft add table nat
> # nft add chain nat output { type nat hook output priority 0 \; }
> # nft add map nat outnat {type ipv4_addr : ipv4_addr\; }
> # nft add element nat outnat { 172.16.1.1 : 8.8.8.8 , 172.16.1.2 : 8.8.4.4 }
> # nft add rule ip nat output dnat ip daddr map @outnat
> <cmdline>:1:1-48: Error: Could not process rule: Invalid argument
> add rule ip nat output dnat ip daddr map @outnat
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> It looks as though I have a syntax error in the command, but I can't find a
> good example to use as a template. Do I have the syntax wrong, or is using a
> separate set like this not possible?

This is working here. What kernel version are you using?

This problem is resolved in 4.2.4 and it should be in 4.1.12 too.
