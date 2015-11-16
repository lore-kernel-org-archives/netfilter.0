From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables DNAT change destport
Date: Mon, 16 Nov 2015 11:39:37 +0100
Message-ID: <20151116103937.GA2907@salvia>
References: <CAAPqxJwz30Lw5uaF05D=yBxeQ7p_O7EsTEMom1LavERYHgbT5w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAPqxJwz30Lw5uaF05D=yBxeQ7p_O7EsTEMom1LavERYHgbT5w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pankaj Yadav <pankajdnapster@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Nov 15, 2015 at 04:16:06PM +0530, Pankaj Yadav wrote:
> I am trying to make a DNAT port map using nftables
> 
> flush table ip nat
> table ip nat {
>         chain prerouting {
>                 type nat hook prerouting priority 0; policy accept;
>                 dnat tcp dport map { 10737 : 62.210.105.235:8080,
> 10738 : 62.210.105.257:8081 }
>         }
> 
>         chain postrouting {
>                 type nat hook postrouting priority 0; policy accept;
>                 masquerade
>         }
> }
> 
> but this ruleset produces error: Error: syntax error, unexpected
> colon, expecting comma or '}'
> 
> What should be the correct syntax if i want to change destport also
> corresponding to IPTABLE's (-j DNAT --to 62.210.105.235:8080 ) ?
> I have tried several combinations but none works and Google also didnt
> help much.Please help me .

Have a look at:

http://wiki.nftables.org/wiki-nftables/index.php/Multiple_NATs_using_nftables_maps
