From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Wed, 22 Apr 2020 14:51:20 +1000
Message-ID: <87blnkqg1j.fsf@goll.lan>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Martin Gignac <martin.gignac@gmail.com> writes:

> I'd like to know if it's possible tell 'nft' to load a ruleset from
> file *without* applying it (a la 'nft -c -f <ruleset>) *but* also have
> it show the parsed (yet unapplied) ruleset in 'nft list ruleset'
> format as well?

I am also interested in this.

You can simply put "list ruleset" at the bottom of the foo.nft file.
However in my experience this routinely gives outright wrong rulesets
(as at nftables 0.9.1), so I don't trust it.

A possible short-term workaround would be to spin up a netns, load the
new ruleset in *there*, then dump it and tear the ns down again...

    $ sudo nft list ruleset | b2sum
    5524[...]3459  -
    $ sudo ip netns add delete-me
    $ sudo ip netns exec delete-me  nft -i
    nft> list ruleset
    nft> add table inet filter
    nft> add chain inet filter frobozz
    nft> add rule inet filter frobozz  tcp dport ssh accept
    nft> list ruleset
    table inet filter {
            chain frobozz {
                    tcp dport 22 accept
            }
    }
    nft>
    $ sudo nft list ruleset | b2sum
    5524[...]3459  -
    $ # Good, the production ruleset hasn't changed.
    $ sudo ip netns del delete-me   # clean up

If you need to do this as unprivileged user,
I guess look into unshare(1) or bwrap...

