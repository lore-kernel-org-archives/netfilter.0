From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: nftables auto-merge on combined sets
Date: Fri, 30 Apr 2021 09:12:34 +0200
Message-ID: <20210430091234.21d98fdf@elisabeth>
References: <ABB1C3DA-882A-4D0C-B573-C1F634F718D6()charite!de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619766759;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/apcv05FBCluk3m6i1HgV1JGaYVJmgxY7+l95E982LQ=;
        b=fzA4105xEaY+RbvcDrnE2kbutgdjMC8H8YZfJWE6x8HfwXl0GKirkgV8pygafyerjnt7tt
        P63SIzeEIynGuZMY7uVfZQ5AKozkEU3Snfk7nu62PUE3rR1YWI2SkDBasLpmmygHdJZHJ5
        PlUXOz9rb12dn8Vlo7SdzIrAn96TTyU=
In-Reply-To: <ABB1C3DA-882A-4D0C-B573-C1F634F718D6charite!de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: christian.froemmel@charite.de
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>

Hi Christian,

On Sat, 24 Apr 2021 11:08:20 +0000
"Fr=C3=B6mmel, Christian" <christian.froemmel@charite.de> wrote:

> Then our parser combines both into the set with
>=20
>   elements =3D {
>       123.45.6.0/24 . 80,
>       123.45.6.7 . 80,
>     }
>=20
> When installing this we get
>=20
> ./debug_username.nft:4:7-23: Error: Could not process rule: File
> exists set user-username_tcp {
>       ^^^^^^^^^^^^^^^^^
>=20
> This isn't "auto-merged" as we expected. To make it a little more
> complex, we have network-ranges and port-ranges on some rules.
> Therefore, the auto-merge would have to "unroll" and merge both parts.
>=20
> Is there any way to achieve this combined-sets with auto-merge?

The set you describe is implemented by the nft_set_pipapo set back-end,
that allows concatenation of ranges. For reference, "123.45.6.7 . 80"
would be handled by the nft_set_hash back-end, and nft_set_rbtree would
handle "123.45.6.0/24".

The definition of overlap needs to differ slightly between different set
back-ends simply because they inherently allow different types of
overlap.

For nft_set_pipapo, the set you describe has elements that are
completely overlapping, and thus they're not merged, which would happen
instead if they were partially overlapping (thus making "merging"
sensible). Here you want the second element to be ignored, instead.

If you "create" those elements, though, instead of performing an "add",
errors from already existing elements are ignored. From nft(8):

	create command is similar to add with the exception that none
	of the listed elements may already exist.

I didn't check right now with your set, but it should work.

I know this should be documented in better detail, that's still
(arguably for too long) on my to-do list. For the moment being, the set
examples in these test scripts:
	https://git.netfilter.org/nftables/tree/tests/shell/testcases/sets/0044int=
erval_overlap_0
	https://git.netfilter.org/nftables/tree/tests/shell/testcases/sets/0044int=
erval_overlap_1

might help clarifying this behaviour.

--=20
Stefano

