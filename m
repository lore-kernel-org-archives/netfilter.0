From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables destination ip rewrite - checksum recalculation
Date: Mon, 31 Aug 2020 15:21:39 +0200
Message-ID: <20200831132139.GI7319@breakpoint.cc>
References: <CY4PR20MB1159B43B8849944AC51011D2D1510@CY4PR20MB1159.namprd20.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CY4PR20MB1159B43B8849944AC51011D2D1510@CY4PR20MB1159.namprd20.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Greenberg, Paul" <greenbergp@HSS.EDU>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Greenberg, Paul <greenbergp@HSS.EDU> wrote:
> Hi All,
> 
> I am running into the following issue while working on a port-mapping CNI plugin compatible with nftables.
> 
> My target OS is CentOS: 3.10.0-1127.19.1.el7.x86_64 with nftables v0.8 (Joe Btfsplk)
> 
> How do I force the recalculation of checksum on a packet where I modify destination IP address?

> table ip raw {
>     chain prerouting {
>         type filter hook prerouting priority -300; policy accept;
>         iifname != "cni-podman0" tcp dport http ip daddr set 10.88.0.114 tcp dport set http return 
>     }
> }
> After rewriting the destination address, packets arrive to a container with checksum error below.
> 
> 01:05:16.704789 ee:58:3f:4d:1f:23 > ea:56:b4:c6:4f:c7, ethertype IPv4 (0x0800), length 58: (tos 0x0, ttl 63, id 8844, offset 0, flags [none], proto TCP (6), length 44)
>   10.0.2.2.54017 > 10.88.0.116.80: Flags [S], cksum 0xd776 (incorrect -> 0xd8b9), seq 2337032705, win 65535, options [mss 1460], length 0
> 
> The incorrect checksum causes the failure to make tcp handshake. That is SYN packets arrive, but container disregards and does not send SYN/ACK back because of the incorrect checksum.
> 
> The destination IP rewrite has NFT_PAYLOAD_L4CSUM_PSEUDOHDR flags.

NFT_PAYLOAD_L4CSUM_PSEUDOHDR was added in Linux 4.10 and is not available in Centos7.
