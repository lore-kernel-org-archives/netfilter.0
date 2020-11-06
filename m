From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Trying to provision flowtable returns error
Date: Fri, 6 Nov 2020 11:58:33 +0100
Message-ID: <20201106105833.GA13845@salvia>
References: <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net>
 <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc>
 <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc>
 <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
 <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
 <20201105210146.GA10732@salvia>
 <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Hi,

This works fine here, see below.

On Thu, Nov 05, 2020 at 04:45:31PM -0500, Martin Gignac wrote:
> Hi Pablo,
> 
> > You can dynamically add/delete devices to/from flowtables since Linux
> > kernel 5.8
> 
> Are you referring to this patch ?:
> https://www.spinics.net/lists/netfilter-devel/msg67310.html
> 
> I tried with Fedora 33 (5.8.17-300.fc33.x86_64) and this file:
> 
>     [root@localhost ~]# cat /etc/nftables/firewall.nft
>     flush ruleset
> 
>     table inet x {
>         flowtable f {
>                 hook ingress priority 0;
>     }
>             chain y {
>                     type filter hook forward priority 0; policy accept;
>                     ip protocol tcp flow offload @f
>                     counter packets 0 bytes 0
>             }
>     }
> 
> and indeed it does load without error, although I had to compile the
> latest version of nft (v0.9.7) as v0.9.3 (which comes with Fedora 33)
> was giving me this error:
> 
>     [root@localhost ~]# nft -f /etc/nftables/firewall.nft
>     /etc/nftables/firewall.nft:4:12-12: Error: Unbound flowtable not
> allowed (must specify devices)
>         flowtable f {
>                 ^
> Once I added my br0 interface wih 'ip link add br0 type bridge' I was
> able to run 'nft add flowtable inet x f { devices = { br0 } \; }'
> without error.
>
> However, if I run 'nft -f /etc/nftables/firewall.nft' again and then
> 'nft list ruleset', br0 is gone. Does this mean that it is no longer
> bound to a flow table?
> 
> The way I have been handling rule changes so far is to modify a single
> '/etc/nftables/firewall.nft' file every time I need to modify rules
> and then run 'nft -f /etc/nftables/firewall.nft' to reload and apply
> those changes (I don't tend to run single nft commands to update
> things here and there -- I prefer to modify a single file as the
> source of truth and then reload the ruleset completely). Running
> something like 'nft add flowtable inet x f { devices = { br0 } \; }'
> once upon boot up when a logical interface comes up is fine, but does
> my workflow require that I then run 'nft add flowtable inet x f {
> devices = { br0 } \; }' after every time I run 'nft -f
> /etc/nftables/firewall.nft'?

# cat firewall.nft
table ip x {
        flowtable y {
                hook ingress priority filter
        }

        chain y {
                flow add @y
        }
}
# nft -f firewall.nft
# nft list ruleset
table ip x {
        flowtable y {
                hook ingress priority filter
        }

        chain y {
                flow add @y
        }
}

This is your base ruleset.

Now you add devices to the flowtable (requirements: kernel >= 5.8
and nftables >= 0.9.7):

# nft add flowtable x y { devices = { eth0, eth1 } \; }

Listing shows:

# nft list ruleset
table ip x {
        flowtable y {
                hook ingress priority filter
                devices = { eth0, eth1 }
        }

        chain y {
                flow add @y
        }
}

Note: If eth0 is gone, then this is automatically removed from the
flowtable.

Is "flush ruleset" at the very beginning of your firewall.nft file?

If so, that is tearing down everything and creating it from scratch,
so the devices you have dynamically added are gone since they are not
in the original firewall.nft file.

I would expect you load firewall.nft at boot time, then dynamically
add devices as needed in run time.
