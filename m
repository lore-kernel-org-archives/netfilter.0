From: Kerin Millar <kfm@plushkava.net>
Subject: Re: IPv4 Evil Bit
Date: Thu, 8 Jun 2023 09:07:33 +0100
Message-ID: <20230608090733.5d106bee71a9b944e9444e6b@plushkava.net>
References: <20230607131743.309d5aff@parrot>
        <CAPJdpdCeuST=ac0K5oQQq=THOPZqnXESQivLqMK0yDRfq3ZeoA@mail.gmail.com>
        <20230608095839.076d212d@parrot>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1686211655; x=1686298055; bh=0Rl3CJ0WeQNIyjnPxiEpe1J8H
        0MjhcLsAY6UCyTe720=; b=I7VgrFXaVjIXFkt/hz9kLGXWE5ZNYM7P2ml3rD2J/
        AFiKkLYVfye7P89iR97oMSeRQT2mLXw30YyZKUiVm9BnNa20QAr9vZB50K4If3tz
        lInrgAEJ3L9rqsfLJZc/Goju8YH9C9iNQCJA6Fjwfc8ERXnr/H2k71l3Q5HXJz+2
        w9N0YlqFBjT1aEaIxSqpAwOW9NPHzSqaEGTeU6fy/MuTsPx+mQlMzvfxi1cBMZhk
        joiwtY0YWpdHD3PsZ2GfXZOwC+CXGwoUONbk5XOdymoXZgzGt2r4/4nbqHlmH8kH
        qWgLTEST50zI2Jrn2rdB639DNbI2N2M4CkswCxUQxSVkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1686211655; x=1686298055; bh=0Rl3CJ0WeQNIyjnPxiEpe1J8H0MjhcLsAY6
        UCyTe720=; b=AEZ6ABqbgpjoxkVMa3zCLcFPYSj6hMoaZ7MPxDVDu8y2x3vY97V
        ylqJM1Nxhw3DBNWZIw2hOv5fHSGkGoZJT3ufzYSKtmtj9ogo7z0PyxhtfvKVpH45
        VYLLBEd/Ww4M0u79aRV/lKvUtGC3/UCXAR3Ba1x2FC4zp/oCmSiS23rxTN1Xw6OJ
        L19paQXT2uH8YFBsa4OYeP+1/1AHm9SaiOYi1dreFQK4Nc0lseMevCyPo1W05tVP
        hMurClbH6Q+cFZEYDDj6Q7PkKN75WYXZHAosBEiaqn1PBfiyQq56jzC4X+ukBAWi
        H7VHBP/21uD8y0me62ZiNNC0s+vhJyRbiVQ==
In-Reply-To: <20230608095839.076d212d@parrot>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Marek =?ISO-8859-1?Q?K=FCthe?= <m-k-mailling-list@mk16.de>, Paul Robert Marino <prmarino1@gmail.com>

On Thu, 8 Jun 2023 09:58:39 +0200
Marek K=FCthe <m-k-mailling-list@mk16.de> wrote:

> On Wed, 7 Jun 2023 10:38:23 -0400
> Paul Robert Marino <prmarino1@gmail.com> wrote:
>=20
> > Answering the first question i think you may be looking for sets
> > https://wiki.nftables.org/wiki-nftables/index.php/Sets
>=20
> Thanks for the answer. Is there a possibility to combine sets (i.e. to
> perform a kind of merge)?
> iifname @dnet_interfaces oifname {
> @client_interfaces, @dnet_interfaces } goto dnet_forward;

Named sets cannot be aggregated. This can only be accomplished with symboli=
c variables those values define anonymous sets. See https://bugzilla.netfil=
ter.org/show_bug.cgi?id=3D1539#c6 for an example.

--=20
Kerin Millar
