From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Netfilter chain locations
Date: Thu, 21 Nov 2002 16:21:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c291a3$e7287400$3864a8c0@discmail.com>
References: <1037489896.14145.275.camel@tux.go-nix.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: "'Nix N. Nix'" <nix@go-nix.ca>, netfilter@lists.netfilter.org


> 
> The Linux packet filtering HOWTO displays the following 
> diagram in order to illustrate the locations of the various 
> filter table chains.
>                           _____
> Incoming                 /     \         Outgoing
>        -->[Routing ]--->|FORWARD|------->
>           [Decision]     \_____/        ^
>                |                        |
>                v                       ____
>               ___                     /    \
>              /   \                   |OUTPUT|
>             |INPUT|                   \____/
>              \___/                      ^
>                |                        |
>                 ----> Local Process ----
> 
> This diagram has often helped me place rules in their proper places. 
> Unfortunately, this diagram doesn't include the location of 
> the nat.PREROUTING, nat.POSTROUTING, nat.OUTPUT, and all the 
> mangle tables. 
> As a result, I've spent nearly an hour trying to figure out 
> how to DNAT packets coming from localhost (you put the DNAT 
> rules in nat.OUTPUT, not nat.PREROUTING).
> 
> So, I've come up with another ASCII art diagram displaying 
> /all/ chains.  I undoubtedly have some mistakes in it so, 
> please, feel free to correct.
> 
> I have pdf, dia, and txt versions of the diagram available in 
> the tarball at ftp://go-nix.ca/up/netfilter-diag.tar.bz2 .  
> If you find it easier to correct the dia version instead of 
> hitting the space bar several hundred times, by all means, 
> please do so.
> 
Oskar Andreassen's (sp?) Iptables Tutorial is very well done and also
has a good graphic of that diagram:
http://iptables-tutorial.haringstad.com/iptables-tutorial.html

> The diagram is based on the above diagram, as well as packet 
> LOGs I've added to every single chain and then triggered by 
> firing a packet from remote to local, from local to remote, 
> from behind local to remote (to trace the FORWARD stuff), and 
> from remote to behind local (via DNAT). 
> Here's what it looks like to me:
> 
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
> Please correct this as necessary.  I'd like to finally get 
> iptables straight, in my mind at least.
> 
> Thanks !
> 
> 


