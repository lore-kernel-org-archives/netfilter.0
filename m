From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: TCP and UDP dport in the same rule
Date: Mon, 23 Mar 2020 14:14:03 +0100
Message-ID: <20200323131403.f2hzmrfpombxz7vx@salvia>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
 <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
 <7f1b28fa-faeb-c89d-b94f-74e412c02e8f@thelounge.net>
 <20200323114606.y4mudsebactsddkn@salvia>
 <ad3e251f-8453-efc4-5c9e-c167a8989e20@thelounge.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ad3e251f-8453-efc4-5c9e-c167a8989e20@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reindl Harald <h.reindl@thelounge.net>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Mar 23, 2020 at 01:43:45PM +0100, Reindl Harald wrote:
[...]
> {LAN_BASE_IPV4} depends on a shell variable which depends on $HOSTNAME
> and so on......
>
> [root@firewall:/scripts/firewall]$  cat ipset_ADMIN_CLIENTS.txt
> # Supported:
> #  - Single IP   (192.168.1.1)
> #  - CIDR-Ranges (192.168.1.0/24)
> #  - From-To     (192.168.1.10-192.168.1.20)
> #
> # Substitution:
> #  - {LAN_BASE_IPV4}
> #  - {WAN_BASE_IPV4}
> #  - {IPV6_PREFIX}
> 
> {LAN_BASE_IPV4}.244
> {LAN_BASE_IPV4}.103

Could you provide a bit mode details on this substitution feature you
implemented in your scripts?

Thanks.
