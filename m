From: Robert White <rwhite@pobox.com>
Subject: Re: SNMP mangling anybody?
Date: Mon, 11 Dec 2017 18:40:13 +0000
Message-ID: <7c8313a3-b60d-5afe-bd1c-d3743b644354@pobox.com>
References: <038581F89849074CAFDAFA8E4AE887F41F76D74C@GAALPA1MSGUSRBF.ITServices.sbc.com>
 <c38d24c0-9425-2b08-6db6-6df1db83261e@pobox.com>
 <038581F89849074CAFDAFA8E4AE887F41F771684@GAALPA1MSGUSRBF.ITServices.sbc.com>
 <9871b3d5-87b3-0d25-6e4b-b42c4978cc7a@pobox.com>
 <038581F89849074CAFDAFA8E4AE887F41F774004@GAALPA1MSGUSRBF.ITServices.sbc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <038581F89849074CAFDAFA8E4AE887F41F774004@GAALPA1MSGUSRBF.ITServices.sbc.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "FAIR, ED" <ef7193@att.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

First, if you are using VLAN 2 as an _internal_ network, why are you
giving it a default route at all. Simply using the 192.168.0.X addresses
will put you on the right link. That link doesn't leave. "Default"
routes are only for finding a way to non-local segements, e.g. the
larger internet.

I'm confused as to how/why you have 192.168.0.0/24 as a descriptor when
you are variously using 192.168.168.84/24 and such. the /24 locks all
the bits of the first three octets as the host part so 192.168.168.84 is
_not_ accessible from 192.168.0.0/24 except via a router.

So it appears that you've drastically over-thought your addressing and
made a mess. Or you've made a typo.

I also have no understanding of your desire to _bond_ the interfaces.

So here's the deal...

This looks like some of the ATCA stuff I've worked with.

You seem to be bonding two interfaces (eth0 and eth1)

You talk about VLAN1 and VLAN2, so I am assuming you have some sort of
switch in the chassis that is letting one VLAN out into the world (e.g.
RTR) and keeping the other private.

So if you strip out all the nonsense and just put the addresses on
bond0.1 and bond0.2, then only generate traffic to 192.168.168.anything
addresses when you want to use bond0.2 then everything is finished.

The main routing tables that control all the access to all the locally
attached segments is inviolate because things don't work at all if the
user can bone finding 192.168.168.X/24 via the wire directly attached to
the 192.168.168.Y/24 adapter.

On 12/04/2017 02:36 PM, FAIR, ED wrote:

So rp is upchucking because (first line of main table)
> 192.168.168.0/24 \
>   dev bond0.2 \
>   proto kernel \
>   scope link \
>   src 192.168.168.84

is just basic plumbing. It's unavoidable. And it has nothing to do with
the default routes at all.

So to say it in different words, "default" in "default route" is the
entry to use for "not otherwise listed" address ranges. But the
192.168.168.0/24 range is explicitly listed.

In the end you've outsmarted yourself with a few classic misunderstandings.

To acheive what you want:

(1) don't mess with the routing tables at all. The default route that is
added, with the via naming the address of RTR, plus all the local rules,
is all you need, and it only applies for larger internet-world destinations.

(2) you really _ought_ to use the clientaddr config, but you don't have
to really do that as the src stanza of the above citation has you covered.

(3) you don't need policy when your problem set is already constrained
by addressing. So you don't need to do _anything_ with "ip route", "ip
rule", iptables, or nft to get what you want to happen.

When you use a 192.168.168.something target address it _will_ go out on
the correct vlan using the correct address, as that's what thous
unavoidable routes _do_ for you. This will affect any application using
any address in that matching subnet.

If this _isn't_ working for you then go back to the switch config and
that line where you said vlan 2 was for the 192.168.0.0/24 range of
addresses. If your switch is actively filtering that vlan for that
address range then you need to reconcile that by changing your
addresses, changing the filter in the switch, or using some other vlan
number.



But in general, for locally attached things, and in the absence of bad
actors, just let the magic happen. 8-)
