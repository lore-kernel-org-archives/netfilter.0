From: Robert White <rwhite@pobox.com>
Subject: Re: Fwd: Accept nftables statement doesn't prevent lower priority
 chains for same hook from execution
Date: Tue, 9 May 2017 09:23:37 +0000
Message-ID: <567fc0f3-ffad-1d93-23c3-aa3d1a391622@pobox.com>
References: <CAPQ8kBXK1m6tJWYaqsmUTTDzov8ey2ZaMmMKe3nX-FLGw-PYeA@mail.gmail.com>
 <CAPQ8kBUwz1QJoT-w9yAmng8BxKikQ1LJP4mMv1fWBYzG0qHQbg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPQ8kBUwz1QJoT-w9yAmng8BxKikQ1LJP4mMv1fWBYzG0qHQbg@mail.gmail.com>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Lebedev <zeronineseven@gmail.com>, netfilter@vger.kernel.org

On 05/08/17 14:43, Vladimir Lebedev wrote:
> Suppose you have 2 basic chains for the same hook(e.g. filter input)
> where first chain has higher priority(executed first) than second.
> Currently it looks like that if packet is "accept"ed in the first
> chain second is still executed and can "drop" _already accepted_
> packet.

You have the gist of it by my understanding.

Any drop is a true drop causing immediate discard.

Any accept is terminal for the hook executing but does not render the
packet immune to subsequent hooks.

In iptables, since there is only one (implicit) "hook" the distinction
makes no difference. In nftables you need to be able to deal with things
like multiple policies.

So, for example, you don't want to have the accept _policy_ of the first
table to eternally mask the subsequent later tables.

If you want to easily pass a final verdict then you should mark the
packet with a mark that you use to accept the packet in later hooks/tables.

The asymmetric treatment of drop/accept is required to prevent the need
for a "not yet classified" flag. And if you had such a flag then you'd
need to have to do away with policies and explicitly classify every packet.

Also remember that the other facilities are in the same evaluation stack
(which is why the priorities exist).

So the rules are no more difficult in nftables than they are in iptables
if you stick to one hook the way you are forced to do in the latter. But
in the former, if you decide to use the much more detailed facilities
you will have to expend more detailed effort.

In particular mixing "inet" with "ip" and/or "ip6" means you'll have to
take extra care as I don't think there's any guarantee which is
evaluated first if you use the same priority.

So yes.

You only need to drop once, but you need to accept in every frame
implicitly or explicitly.

It only takes one hanging to kill, but you have to survive every charge
in every court to escape the noose.
