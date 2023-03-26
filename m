From: Eric <evil.function@proton.me>
Subject: Re: nftables: Internal error when checking rules
Date: Sun, 26 Mar 2023 15:18:36 +0000
Message-ID: <mRTPINcNTgVHNZwhiGGmj5BkMxnFt7fH3uDqfviAAbr-e1JQ-Rwz_DPBemdqmLsgadrf79NDARXyDGP3LsFkP6W5rPQSEqok17BxvVrgzOs=@proton.me>
References: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=6jgyarf6v5efzlsajsm5wizgzi.protonmail; t=1679843924; x=1680103124;
        bh=bR/QgNdgQE9dKQn6EtXtTToH9cjusZIsoowrzqDPWpc=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=mS9rebOwXWQo53vFwyakJ9crWMXfI72BIvxGTj+h+Lm0akf4etHwpjvclNR6YF0nS
         do3bBiRP9WGyuXJ9G+nSQhRfftmFb5Xn/jXaxb9NGg9PQgpduDVcs8wwjdBheoNH+h
         r8/pHol/xAkJ1mFopSoZG4dBLTP7ZSnvEw5PlB5Ps/vZrQfeRDwxcx7ytvfNnfEQiI
         QUSDVQhTFfPlV3CPApeeaK6TWvggpupU7OO7Y6m9vfgmfnnzjrlcxuKSmH81ySFl5j
         pDnzlF1gPyCvsLTZw3JD6MRXY73DNSRfGrMYQP8AJTb2U9mf4QE/uBxTpCN0iC70H6
         10clX1LmjV4xA==
In-Reply-To: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org

On Sunday, March 26th, 2023 at 02:46, Serg <seentr@at.encryp.ch> wrote:
> Today I have encountered strange behaviour of the `nft -cf` - I receive
> an error message with an exit code 1. The error message is
> "internal:0:0-0: Error: Could not process rule: File exists".
>=20
> My configuration consist of several files and I have found one that
> causing this error - it is set with a list of networks in CIDR format.
> The file is pretty big - it takes 15K on its own (it does not contains
> any rules at all, just a single set).

Hi Serg,

The only reference to "File exists" I could find was in the test linked
below, so maybe that's a starting point.

https://git.netfilter.org/nftables/tree/tests/shell/testcases/sets/0057set_=
create_fails_0

That leads me to search for NFT_MNL_ACK_MAXSIZE, and into

https://git.netfilter.org/nftables/tree/src/mnl.c

where the mnl_batch_talk function has a socket receive buffer of that
size.  It could indeed be that your set contents are just to large and
you need to break it into several smaller "add" pieces???

Eric

