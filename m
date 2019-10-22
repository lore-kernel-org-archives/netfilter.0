From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: nftables v0.9.0 netlink: Error: set is not a map
Date: Tue, 22 Oct 2019 11:30:26 +1100
Message-ID: <87sgnld3kt.fsf@goll.lan>
References: <37d8e802-87c2-4ef6-d0da-173bbd2ded60@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Daniel Huhardeaux <tech@tootai.net> writes:

> I created a bash script under Debian/Buster to create nft rules: it
> works perfectly.
>
> Now I copy this script to a Debian/Stretch machine (nftables v0.7.0)
> and get in troubles to make it work: at some point I receive the
> subject error.
>
> OK, I think it's a version problem: I installed nftables from Stretch
> backports which is the same version as the Buster one, v0.9.0 But
> bang, error is still here :(
>
> What can be the cause of this error? Yes, I use sets, and no, they are
> no maps defined.

Can you show us your actual ruleset.nft?

Or (better yet) distill it down to a minimal test ruleset.nft that
generates the problem, and show us that.


I don't recognize the specific error.
I have seen similar errors before due to brainos in my ruleset.

I agree it doesn't make sense that the same version (nftables=0.9.0 on
Debian 9 and Debian 10) should parse the same way - so maybe it's a
difference on the kernel side?

Are you running
4.19.67-2+deb10u1~bpo9+1 on Debian 9, and
4.19.67-2 on Debian 10?

