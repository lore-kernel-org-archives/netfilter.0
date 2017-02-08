From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Are "device chains" a real thing?
Date: Wed, 8 Feb 2017 10:05:28 +0100
Message-ID: <20170208090528.GA2054@salvia>
References: <43d968b3-03a8-1872-63bf-5bedad33ecba@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <43d968b3-03a8-1872-63bf-5bedad33ecba@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert White <rwhite@pobox.com>
Cc: netfilter@vger.kernel.org

On Tue, Feb 07, 2017 at 10:18:32PM +0000, Robert White wrote:
> Howdy,
> 
> So the manual page for nft says:
> 
> {add} chain [family] {table} {chain} {hook} {priority} {policy} {device}
> 
> Is that last stanza "{device}" a typo?
> 
> If not, what is the syntax and applicability?

Yes. There is a new family, the so-called 'netdev', currently with one
single hook at ingress.

This comes way before than prerouting, and you can use it to classify
traffic earlier.

 # nft add table netdev x
 # nft add chain netdev x y { type filter hook ingress device eth0 priority 0\; }

There you see anything entering the 'eth0' device, this includes ARP
and both IPv4 and IPv6 traffic, in a nutshell, it's a new hook that
allows you to classify traffic just after the nic driver passes up the
packet to the stack.

This is basically providing an alternative to tc ingress.

We should fix the manual page syntax BTW, it is a bit misleading.
