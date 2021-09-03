From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Cannot reference sets in later rules until next nft run
Date: Fri, 3 Sep 2021 09:42:28 +0200
Message-ID: <20210903074228.GA22010@salvia>
References: <20210903012502.GA246533@lotus.rw.madduck.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210903012502.GA246533@lotus.rw.madduck.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter users list <netfilter@vger.kernel.org>

On Fri, Sep 03, 2021 at 01:25:02PM +1200, martin f krafft wrote:
> Dear list,
> 
> I am trying to create an nft ruleset that uses the include directive and a
> run-parts.d style directory for additions to the main ruleset.
> 
> I've run into a problem with nft v0.9.8 on kernel 5.10.0, which I summarise
> as follows: If a rule in the main ruleset defines a set then I cannot use
> that set outside the current scope until a later run of nft.
> 
> Let me illustrate:
> 
> I have the following files (please find them attached):
> 
>   ==> inc.d/20-ssh.nft <==
>   table inet test {
> 
>       set recent_ssh_connections4 { type ipv4_addr; timeout 30s; }
> 
>       chain incoming_ssh {
>           update @recent_ssh_connections4 { ip saddr } \
>               accept comment "SSH connections"
>       }
> 
>       chain input {
>           tcp flags syn tcp dport 22 counter jump incoming_ssh
>       }
>   }
> 
>   ==> inc.d/50-mosh_ports_v4.nft <==
>   add rule inet test input \
>     ip saddr @recent_ssh_connections4 udp dport 60000-61000 counter accept \
>     comment "Portrange required for mosh"
> 
>   ==> ruleset.nft <==
>   table inet test {
> 
>       chain input {
>       	type filter hook input priority filter;
> 
>       }
>   }
> 
>   include "./inc.d/*.nft"
> 
> When I try to load this ruleset, it fails (debug output is attached):
> 
>   % sudo nft -f ruleset.nft In file included from   ruleset.nft:9:1-24:
>   ./inc.d/50-mosh_ports_v4.nft:2:12-35: Error: No such file or directory
>     ip saddr @recent_ssh_connections4 udp dport 60000-61000 counter accept \
>              ^^^^^^^^^^^^^^^^^^^^^^^^

Just tried it here with lastest:

# nft -v
nftables v1.0.0 (Fearless Fosdick #2)

WorksForMe(tm)

# nft -f ruleset.nft
# nft list ruleset
table inet test {
        set recent_ssh_connections4 {
                type ipv4_addr
                size 65535
                timeout 30s
        }

        chain input {
                type filter hook input priority filter; policy accept;
                tcp flags syn tcp dport 22 counter packets 0 bytes 0 jump incoming_ssh
                ip saddr @recent_ssh_connections4 udp dport 60000-61000 counter packets 0 bytes 0 accept comment "Portrange required for mosh"
        }

        chain incoming_ssh {
                update @recent_ssh_connections4 { ip saddr } accept comment "SSH connections"
        }
}

This is an old cache bug that was fixed starting 0.9.9 IIRC.

> If I load the included files with a separate invocation of nft, it works:
> 
>   % sed '/^include/d' ruleset.nft | sudo nft -f -
>   % for f in inc.d/*.nft; do sudo nft -f $f; done
> 
> At first, I thought this was a problem with include, but even if I replace
> the include directive with the contents of the files it would include, the
> error is the same.
> 
> The error also stays if I convert the command-style content of
> inc.d/50-mosh_ports_v4.nft to the native format.
> 
> The only way to make this work is to include the rules within the main and
> first table declaration in ruleset.nft, which means it's not possible to use
> sets in include files.
> 
> Is this a bug, or am I doing something wrong?

It's a bug, please try out lastest.

Thanks.
