From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Nftables rules change when network interfaces disappear
Date: Tue, 1 Sep 2020 22:41:39 +1000
Message-ID: <20200901124139.GA3981@dimstar.local.net>
References: <219301a8-70a9-d2d9-f231-1ab9db107e1a@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <219301a8-70a9-d2d9-f231-1ab9db107e1a@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, Sep 01, 2020 at 01:59:51PM +0200, Mikhail Morfikov wrote:
> I was trying to write some FW policy for VPN and I added the following rules to
> my openvpn script:
>
>     nft create chain ip nat force-vpn
>     nft add rule ip nat POSTROUTING meta oif ${dev} counter jump force-vpn
>     nft add rule ip nat force-vpn meta oif ${dev} counter snat ${ifconfig_local}
>
> When the VPN connections is being established, the rules do their job, the ${dev}
> variable is properly resolved and nftables can live with it just fine:
>
> # nft -a list table ip nat
>
> table ip nat { # handle 55
> ...
>         chain POSTROUTING { # handle 3
> ...
>                 oif "tun0" counter packets 0 bytes 0 jump force-vpn # handle 20
>         }
> ...
>         chain force-vpn { # handle 19
>                 oif "tun0" counter packets 0 bytes 0 snat to 172.27.100.20 # handle 21
>         }
> }
>
> But when I close the VPN connection, something weird happens. The above rules
> now looks like this:
>
> # nft -a list table ip nat
>
> table ip nat { # handle 55
> ...
>         chain POSTROUTING { # handle 3
> ...
>                 oif 61 counter packets 0 bytes 0 jump force-vpn # handle 20
>         }
> ...
>         chain force-vpn { # handle 19
>                 oif 61 counter packets 0 bytes 0 snat to 172.27.100.20 # handle 21
>         }
> }
>
> So the output interface is now 61 and not "tun0" . My script doesn't do anything
> with the nftables rules when the VPN connection is closing. So the value of the
> output interface magically changed on its own.
>
> The number is the one that can be found in the output of the `ip` command when
> the interface was created:
>
> # ip addr show
> ...
> 61: tun0: ...
> ...
>
> Is this a bug or is this intended behavior?
>
> ---
> # nft -v
> nftables v0.9.6 (Capital Idea #2)
>
> # cat /proc/version
> Linux version 5.8.5-amd64 (morfik@morfikownia) (gcc (Debian 10.2.0-5) 10.2.0, GNU ld (GNU Binutils for Debian) 2.35) #2 SMP PREEMPT Thu Aug 27 12:08:37 CEST 2020
>

Hi Mikhail,

You can only use 'oif' for interfaces with indexes that will never change, such
as eth0. For all other interfaces, you must use 'oifname'. Otherwise, you get
the behaviour you report.

See PRIMARY EXPRESSIONS / META EXPRESSIONS in 'man nft'.

Cheers ... Duncan.
