From: Robert White <rwhite@pobox.com>
Subject: Re: PPTP passthrough
Date: Thu, 4 May 2017 19:58:21 +0000
Message-ID: <f93e8723-75e6-d4c1-8219-4d0f7237bea3@pobox.com>
References: <6d2c9c2f-2636-9e3f-b8e1-eec95eb02370@suse.com.au>
 <019de373-baa3-0e9e-d7f0-4fa63c106091@pobox.com>
 <901f9141-693e-2ec8-772a-5961fd6ddfff@suse.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <901f9141-693e-2ec8-772a-5961fd6ddfff@suse.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven O'Connor <steven@suse.com.au>, netfilter@vger.kernel.org

On 05/04/17 03:46, Steven O'Connor wrote:
> I'm not using any SNAT only masquerade.

Masquerade _is_ SNAT, abet with automatic network address selection and
connection tracking "forgetting" features, so the same caveats apply.
You should _not_ let the SNAT (masquerade) touch the packets that
originate on the local host. It's "usually fine" but it can get a little
iffy in some corner cases since it's a greedy modification of packet
contents.

Though Pascal's comment about needing to assign the helpers to your
connection is probably more on target.

I'd still make sure that you are only applying the address rewrite rules
via explicit limit of the rule by using explicit mention of both the
obvious --out-interface and the highly recommended --in-interface selectors.

ASIDE: I, long ago, started using ext+, int+, and loc+ as interface
names. ext+ are external-facing interfaces. int+ are internal interfaces
such as bridges and such. loc+ are real interfaces that don't get their
own addresses because they'll end up inside a bridge or bond or
whatever. I'm migrating to group id numbers with higher numbers being
assigned to loc+ than int+ and than ext+ respectively so that in
nftables I can use group ID greater-than/less-than X rules.

But anyway, you should only SNAT things that don't already have the
correct structure if you want to avoid some potential messes.

