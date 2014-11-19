From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Simple NFT example
Date: Wed, 19 Nov 2014 12:00:18 +0100
Message-ID: <20141119110018.GA4453@salvia>
References: <CAOp4FwSrETzG=UUocA56zYbDjHb=tmuGQdMYq27UHe3eO01FvA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOp4FwSrETzG=UUocA56zYbDjHb=tmuGQdMYq27UHe3eO01FvA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Loganaden Velvindron <loganaden@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Oct 30, 2014 at 11:43:29PM +0400, Loganaden Velvindron wrote:
> Hi guys,
> 
> I tried to cook up a simple example.
> 
> Pablo sent me feedback on my example.
> 
> First we setup a basic table for IPv4.
> 
> table ip means that "ip" implicitly means IPv4.
> 
> The input chain is the "incoming" traffic on a machine. For example,
> assuming that you have a desktop running SSH, and you would like to
> have a simple ruleset which is suitable for a desktop. You'd want to
> allow ping (so that you can ping your laptop on the network).
> 
> Some deamons bind to localhost interface. It's a good idea to accept
> connections on local interface, so this should be allowed.
> 
> The rest is rejected.
> 
> For example, if your desktop runs a web server on port 80, it won't be
> accessible. You need to enable it by adding another rule.
> 
> fw.basic:
> 
> table ip filter {
>      chain input {
> 
>           type filter hook input priority 0;
> 
>           ct state established,related accept
> 
>           # accept connections for localhost interface
>           iif lo accept
> 
>           # Accept SSH connections on port 22
>           tcp dport 22 accept
> 
>           # Allow ICMP packets such as "ping"
>           ip protocol icmp accept
> 
>           # Reject any other connections
>           reject
>      }
> }
> 
> 
> You can run this simply by typing:
> 
> nft -f fw.basic
> 
> Any feedback welcomed.

I have added this to the wiki:

http://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_workstation

It would be good to have examples for IPv6 and IPv4/IPv6 using the
inet family.

Thanks.
