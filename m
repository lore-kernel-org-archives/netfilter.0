From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Netfilter chain locations
Date: Thu, 21 Nov 2002 16:12:34 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211211611300.4787-100000@dell>
References: <1037489896.14145.275.camel@tux.go-nix.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037489896.14145.275.camel@tux.go-nix.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nix N. Nix" <nix@go-nix.ca>
Cc: netfilter@lists.netfilter.org

On 16 Nov 2002, Nix N. Nix wrote:

> +--------+
> |Incoming|-+
> +--------+ |
>            v
>   _______________
>  /               \                                        +--------+
> |mangle.PREROUTING|                                    +->|Outgoing|
>  \_______________/                                     |  +--------+
>          |                  ____________         _____________
>          v                 /            \       /             \
>    ____________       +-->|mangle.FORWARD|     |nat.POSTROUTING|
>   /            \      |    \____________/       \_____________/
>  |nat.PREROUTING|     |          |                     ^
>   \____________/      |          v                     |
>         |             |     ____________       ________________ 
>         |             |    /            \     /                \
>         |  [Routing ]-+   |filter.FORWARD|-->|mangle.POSTROUTING|
>         +->[Decision]      \____________/     \________________/
>                |                                       ^
>                |                                       |
>                |                                  ___________
>                v                                 /           \
>           __________                            |filter.OUTPUT|
>          /          \                            \___________/
>         |mangle.INPUT|                                 ^
>          \__________/                                  |
>                |                                    ________
>                |                                   /        \
>                |                                  |nat.OUTPUT|
>                v                                   \________/
>           __________                                   ^
>          /          \                                  |
>         |filter.INPUT|                            ___________
>          \__________/                            /           \
>                |                                |mangle.OUTPUT|
>                |                                 \___________/
>                |                                       ^
>                |                                       |
>                +----------->Local Process--------------+
> 
you should check out oskar's latest (updated) tutorial at frozentux.net.
if you go to the HTML-format tutorial, there is a schematic of the packet
flow, and it's complete.

rday


