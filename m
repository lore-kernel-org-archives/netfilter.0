Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAB2C4332F
	for <netfilter@archiver.kernel.org>; Mon, 13 Nov 2023 02:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjKMCgg (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 12 Nov 2023 21:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjKMCgf (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 12 Nov 2023 21:36:35 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE59109
        for <netfilter@vger.kernel.org>; Sun, 12 Nov 2023 18:36:32 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 29E3D3200437;
        Sun, 12 Nov 2023 21:36:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 12 Nov 2023 21:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1699842988; x=1699929388; bh=V7oOPLOKEcAZtbY+Cmcu8ZmwH
        M/XfmsFfUl92iF+v6U=; b=MplpExHwaxfuW97MYTVGhWlIK4g0csNY6LvO+rwF3
        aiLsXnoB/rbDSqgJSHTFyk8+L225CbjImIOYUF3yMIAkrntQhwDGx/yafnWMCDXW
        g1kbcnjDAetPgta7X8VCofcLdrWswVicyjIXPwkH9/yAufw3+PbjyN+12XivGH2X
        acDeq1UT1S3nccneVlUzeBobUfl1DLViJAUfSkrjjY82TSG9bMxNbT8tpQmElmXe
        XXsbLpwxlHY0T3uav44nM66ahcks47/5f+61d+av3Pk2SD1KMcxcDeAYuXFQHXpv
        /sEMdo9FF7Lh1RAALJvdOrbzBVLMVg32MeE7lnN1ovOUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1699842988; x=1699929388; bh=V7oOPLOKEcAZtbY+Cmcu8ZmwHM/XfmsFfUl
        92iF+v6U=; b=nncW4xuvaH5X/jsaC2fekFP0EoT8/E7zSvWxzPWIUjf6w+o5WwP
        kumyZ8QeCeDP91jXtLMiYBD0LhZx1ZWIcunvChJu1Cwa4MAy2pmMsiR6l0p/fDSc
        juObzbDmhsSn+2vj3OrI9nA17eLucaUnGM3AEmNIQEt1oaNHe2lVn9hGL0YtwwYR
        nAYHM2GBFK3Af999UUumBuhmqaYgECTPEe8Q8PbUAh77qhnZhskhzPucaB/50HD+
        BqjXaLl0+ainpkZZKlyEj2tlo5d5Euyc+8tkad529+t0vRhLvjtuwP6nVvhskaD8
        4xtuLTL7wUsfmtiW05e8WTuS70Vmclw7mDA==
X-ME-Sender: <xms:rItRZVVf7B9qaw8Eyh43SOFWjEz4uQEDxnAQTQkxo98OieGviwLX4A>
    <xme:rItRZVkRndWTNlTBMwp72Ro4EDu4jNMGKYIPaKw-HBwwVvVSQe5kW3YaZCmWCbtnz
    zkmu1sH2b8jfZyx>
X-ME-Received: <xmr:rItRZRax4jT5IjSG3VdX2YohLRBrF590aI4jw5jg78Ruxm7TcNxC4-bvo0mN8_i16c-XxNYt-K7AUdsT8RjF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddvledggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesth
    hqredtjfdtudenucfhrhhomhepmfgvrhhinhcuofhilhhlrghruceokhhfmhesphhluhhs
    hhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepledtgfelgfekudfhheduffeitd
    fgvefgtdevkeeuvdfhgfelgeejkeduteegtdehnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:rItRZYWWysiPIPCeN3hYxg8q0wdou-0hGXxBA7w9Q3JfzUOP6ZxpkA>
    <xmx:rItRZflYXdbOd33xG0ci6oyFQsSq3S-2Aptkz2P_uGQpWEKIL-3qQg>
    <xmx:rItRZVc0IZhvMQvCC5XNAZkYVFqcxgWJl4BnOqwQg_0qx_AG8Zdnog>
    <xmx:rItRZeuasAf0_UpmdhnctM8n1xGwwisGOrZTNiOZKQkymLKtDrSxwQ>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Nov 2023 21:36:27 -0500 (EST)
Date:   Mon, 13 Nov 2023 02:36:25 +0000
From:   Kerin Millar <kfm@plushkava.net>
To:     =?ISO-8859-1?Q?Rub=E9n_M=E9ndez_Hern=E1ndez?= 
        <rmendezh@ies-sabadell.cat>
Cc:     netfilter@vger.kernel.org
Subject: Re: Problems getting started with dnat and port forwarding
Message-Id: <20231113023625.daf9eb47e3ecf9e8514f0c78@plushkava.net>
In-Reply-To: <CAHpzd2o47vs=yA28FzMMjYvYfU1iPsDM_9fopXrwk9pWfLcHnw@mail.gmail.com>
References: <CAHpzd2o47vs=yA28FzMMjYvYfU1iPsDM_9fopXrwk9pWfLcHnw@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Sun, 12 Nov 2023 18:31:58 +0100
Rub=E9n M=E9ndez Hern=E1ndez  <rmendezh@ies-sabadell.cat> wrote:

> Dear netfilter team.
> I'm starting with nftables and trying to set an ssh port forwarding
> from my firewall IP 192.168.1.252 to my dmz IP 10.0.0.2. But I get
> this error:
> -------
> nft -cf nft/test.nft
> nft/test.nft:30:62-65: Error: ip or ip6 must be specified with address
> for inet tables.
> add rule inet nat prerouting iifname $int_ext tcp dport 2222 dnat to 10.0=
.0.2:22
>                                                              ^^^^

The synopsis of the dnat statement is as follows.

dnat [[ip | ip6] [ prefix ] to] ADDR_SPEC [:PORT_SPEC] [FLAGS]

The square brackets indicate components of syntax that are optional, or opt=
ional under certain circumstances. The error message indicates that [ip | i=
p6] is not optional under the circumstance that your rule is expected to re=
side in an inet table. Therefore, you must specify "ip" immediately after "=
dnat".

Your nftables version must be out of date because the error message has sin=
ce been improved.

--=20
Kerin Millar
