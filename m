From: Eric <evil.function@proton.me>
Subject: Re: Processing nftable rules without loading them into the kernel
Date: Sun, 09 Jul 2023 15:12:31 +0000
Message-ID: <DCRE19RgCyYzfyvb4gv3bKsN5oCut4gnJz4RbbOZ9xboIv61XcIxVf4M-7lNixc60MbBeJ6ni2G1a_fBHpsDjJ0MqVkzxTAh5SGFKgy1tuY=@proton.me>
References: <431a99d3-38b6-7108-4b54-3f8620a58c6c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1688915558; x=1689174758;
        bh=2fMa5ME6cIRiOLsGYjIiDOvlGBgw+whzpVV4ibp2gl8=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=D2hZ83yOnG1GpvteuWH/DtLAk5rkx7hp0q8iXBtGdYOpN1A1EHGlRipz/hgbfN6gN
         5JCX6Nso41vvWgkg3qEIAP3YzQddLZkay2EBCOk6wXMuXF7nZ1pe1TxEeAe7U269iD
         s6xb7w35Jxf5u7XRPciYmebC0Kq5kZPGXr0fam/CjFHb6wn6kDZVRf5AJVXvTsI/HM
         pV7eyusrTz0A++/jaw41YO/KlhFiboRwS25hgtrgz6ktXX10lOmoHa27D7R/tSbYCM
         0ID+P9jjbZdX7P240Dy7/t+Q5Bff4DjvI7dKY/ZCdYs1teY/Kg8l9b2pedDLy3t53q
         +8c5D4y8uYWbQ==
In-Reply-To: <431a99d3-38b6-7108-4b54-3f8620a58c6c@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: George Shuklin <george.shuklin@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday, July 9th, 2023 at 01:02, George Shuklin <george.shuklin@gmail.co=
m> wrote:
> I got a rather interesting task: I need to check if a given set of rules
> on the disk is the same as loaded into the kernel.
>=20
> The main problem is that nft list is quite different from the original
> config (ordering, comments, etc), so I wonder if there is a way to make
> nft just to read rules, process them and output back in the same format
> as it is from nft ruleset list. Is there a way to force nft to just
> 'process' rules to stdout without loading them into the kernel?

Well, after experimenting a bit, I'm not going to say, "No, it can't be don=
e" as I've got sort of a hack that might be usable.

$ nft list ruleset | nft -c -d netlink -f - > x
$ nft -c -d netlink -f my_rules.nft > y
$ diff x y

At the very least, the counter values are different (so sed them?), but may=
be it might be made to sort of work???

Eric
