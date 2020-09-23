From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Wed, 23 Sep 2020 10:30:42 +0200
Message-ID: <20200923083042.GB10267@salvia>
References: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c60c340-d6d8-1f7c-67da-2782360a92fe@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: netfilter@vger.kernel.org

On Tue, Sep 22, 2020 at 10:49:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> kernel 5.9.0-rc6 armv7l | nft 0.9.6
> 
> ------
> 
> (1) netdev rate limiting
> 
> /table netdev filter {//
> //        set glv4 {//
> //                type ipv4_addr//
> //                size 65535//
> //                flags dynamic,timeout//
> //                counter//
> //                timeout 15m//
> //                gc-interval 10s//
> //        }//
> //        chain input {//
> //                type filter hook ingress device "eth2" priority -500;
> policy accept;//
> //                ip saddr @glv4 counter packets 0 bytes 0 log prefix
> "nd glv4 DROP" flags all drop//
> //        }
> 
> /Then however
> 
> /nft add rule netdev filter input ip protocol tcp { ip saddr limit rate
> over 50/second burst 15 packets } update @glv4 { ip saddr }/

table ip filter {
        set glv4 {
                type ipv4_addr
                size 65535
                flags dynamic,timeout
                timeout 15m
                gc-interval 10s
        }

        chain input {
                ip protocol tcp update @glv4 { ip saddr limit rate over 50/second burst 15 packets }
        }
}

This reads: update set 'glv4' with ip saddr using limit rate over
50/second burst 15 packets.

You cannot combine counter and limit yet though.

> producing:
> 
> Error: syntax error, unexpected saddr, expecting comma or '}'
> add rule netdev filter input ip protocol tcp { ip saddr limit rate over
> 50/second burst 15 packets } update @glv4 { ip saddr }
> ^^^^^
> 
> Is rate limiting not meant for the netdev chain or where do I go wrong
> with the syntax?
> 
> ----
> 
> (2) timeouts
> 
> Like in the above statement is the timeout applicable to the entire set,
> i.e. the entire gets wiped after 15 min, or the timeout applies
> selectively to each entry?
> 
> Perusing
> https://www.netfilter.org/projects/nftables/manpage.html#lbANhttps://www.netfilter.org/projects/nftables/manpage.html#lbAN
> 
> /nft add rule ip filter input tcp flags syn tcp dport ssh meter flood
> size 128000 { ip saddr *timeout 10s* limit rate over 10/second} add
> @blackhole { ip saddr *timeout 1m* } drop
> 
> /I fail to comprehend what the first statement (/timeout 10s/) achieves;
> what is the purpose?
> 
> As for the second statement (/timeout 1m/) I am wondering whether it
> would clash with or supersede the statement in the set (e.g. /timeout
> 15m/ as in the above example)?

timeout in your rule (if specified), eg.

... update @xyz { ip saddr *timeout 1m* }

overrides the global set timeout policy.
