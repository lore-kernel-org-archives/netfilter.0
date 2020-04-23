From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format
 possible?
Date: Thu, 23 Apr 2020 12:06:13 +1000
Message-ID: <20200423020613.GE30155@dimstar.local.net>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
 <87blnkqg1j.fsf@goll.lan>
 <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Apr 22, 2020 at 12:34:26PM -0400, Martin Gignac wrote:
> > You can simply put "list ruleset" at the bottom of the foo.nft file.
> > However in my experience this routinely gives outright wrong rulesets
> > (as at nftables 0.9.1), so I don't trust it.

"list ruleset" at the bottom of an nft script is completely accurate. The
command "nft list ruleset" discards portions of rules that are implicit, in the
interests of brevity.
>
> That's a pretty good tip, thanks!... And you're absolutely right, it
> gives some weird output. See below the diff of 'nft -c -f foo.nft'
> with a 'list ruleset' at the bottom and the actual output of 'nft list
> ruleset' once foot.nft is applied to the kernel:
>
> [root@bouboule ~]# diff -u /tmp/toto1.txt /tmp/toto2.txt
> --- /tmp/toto1.txt      2020-04-22 11:55:55.718378603 -0400
> +++ /tmp/toto2.txt      2020-04-22 11:56:01.888551779 -0400
> @@ -1,12 +1,12 @@
>  table ip filter {
>         chain input {
>                 type filter hook input priority filter; policy drop;
> -               ct state 0x6 accept
> +               ct state established,related accept
>                 ct state invalid drop
>                 iif "lo" accept
> -               meta l4proto icmp icmp type echo-request accept
> comment "You can restrict this if you want"
> -               meta l4proto tcp tcp dport 22 accept comment "You can
> restrict this if you want"
> -               meta l4proto tcp tcp dport 179 accept comment "For BGP"
> +               icmp type echo-request accept comment "You can
> restrict this if you want"
> +               tcp dport 22 accept comment "You can restrict this if you want"
> +               tcp dport 179 accept comment "For BGP"
>         }
>
>         chain output {
> @@ -15,7 +15,7 @@
>
>         chain forward {
>                 type filter hook forward priority filter; policy drop;
> -               ct state 0x6 counter packets 0 bytes 0 accept
> +               ct state established,related counter packets 0 bytes 0 accept
>                 ct state invalid drop
>         }
>  }
>
> Of note is the fact that the 'ct state' line does not contain both
> states.

It does show it. There are 2 bits set in 0x6. Perhaps it is an oversight that
the code path does not interpret them.

> As well, the addition of 'meta l4proto' adds a lot of
> unecessary verbiage.

They are necessary *for the kernel*. The nft user interface is smart enough that
you don't have to specify them.

> But still, good to know that this is somewhat
> doable as it never dawned on me to put 'list ruleset' at the end of
> foo.nft.
>
> > A possible short-term workaround would be to spin up a netns, load the
> > new ruleset in *there*, then dump it and tear the ns down again...
>
> This is actually a very cool idea! I never realized that nftables
> rulesets are bound to a specific namespace, but now it makes perfect
> sense. The only "drawback" (I guess) is that I cannot use 'iif' for
> any other interface than 'lo' in the temp namespace; I'll need to use
> 'iifname' instead since the referenced interfaces won't exist in the
> temp namespace. But it's not a deal breaker.
>
> I think I will go with this workaround until (if) nftables supports
> this functionality natively.
>
> Thanks!
> -Martin
