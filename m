Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8146C61D97
	for <netfilter@archiver.kernel.org>; Wed, 22 Nov 2023 15:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjKVPTg (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 22 Nov 2023 10:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjKVPTf (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 22 Nov 2023 10:19:35 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5565E7
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 07:19:31 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a02ba1f500fso261956266b.0
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 07:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700666370; x=1701271170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lazcSSXwlqCfHyLpn7gMKN32yX3j51EoSUlAujDKAvA=;
        b=LDUdtcFSowPYzew0z9vGX2mV2GW2MwRAdbtDKNPujewEmYICPkTD3zfdQ71gESSxUG
         LWhWkNJN4vsgB76ZhBzmlxLnHBiHM+hwBB5iVZHlDmdiQYMzhRl2RGxbyq48M1ng39yu
         1pw/tMu4Jam2duBTGyIYI7wIWYDmXsLjLex41TbiyRkJK06aS6Q80Icsg9UsaCpqArVz
         AYxVzNfotB5Ga8PvQHhFwVmtTdsQE7X6C/nCyDiatLPxkwc/vMQbhVmoB6rljjwLXIYN
         V57PZpR5Y1dgCe1jsVhjZhUyXCajEzPF3HzB2HMPsONugK9ddOpyOuAyToE61C0AVAc+
         OUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700666370; x=1701271170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lazcSSXwlqCfHyLpn7gMKN32yX3j51EoSUlAujDKAvA=;
        b=XWBu/RPFJovyyCWlmx9KWUXi263tbKq7akaklBXBx8BkiPObRrtdwLObCYGT6gVgVg
         b8VrSCbga3Qepu4HHebNnf9jbX4vCnbe/VLVeiBtzOH6H3U3vQYsMcXutI1znXZzl99A
         J/m3aQffHKS64LHwVj5yLow3PG5qc+mRu3EvEEXa4zOwljlXXmYqMGf55x7HO1Pf7nIS
         4iQtf/mMH7d43e77IUHUmn/E3KAbF3ZZBOwr+jGzfU9PabwpIa80U9wj3ghRqWyZC3CX
         94mQQMX6vE+a0bHh+zTADt11YKP1ztxvP2ysHnhWlphTVWX5MP7I55oA7IbRNwOxS3ej
         FJKg==
X-Gm-Message-State: AOJu0Yyps8l4LpTMwaPZ6WPUEAdNhgFws2NJb7Zieu6sI7uZYw7eUyUh
        f6RGtG1vuqwLnHq8TUGfnE7Nd89spU0NNFm7+n8=
X-Google-Smtp-Source: AGHT+IHkrfvMKCsmlWcSG4Lv3nBJQeaod4DL961m3NtWpvE1HQLwtmy7ncjQm2rpD5uGoq15vW3o5vYr8IUe86a6AQk=
X-Received: by 2002:a17:906:f295:b0:9fc:346c:a5fa with SMTP id
 gu21-20020a170906f29500b009fc346ca5famr1771208ejb.46.1700666370134; Wed, 22
 Nov 2023 07:19:30 -0800 (PST)
MIME-Version: 1.0
References: <CANf9dFNCeUf20yza=ika3YYGH1RjUwagWOkoCCg8=aGnNCQs3Q@mail.gmail.com>
 <ZV3JJtLjIdLY54PD@calendula>
In-Reply-To: <ZV3JJtLjIdLY54PD@calendula>
From:   Martin Gignac <martin.gignac@gmail.com>
Date:   Wed, 22 Nov 2023 10:18:54 -0500
Message-ID: <CANf9dFNuJquaRrA_GQiyreK3GeAfAE7DHYJxp0i93CkZQGFGhQ@mail.gmail.com>
Subject: Re: Getting error "Error: missing hook and priority in flowtable
 declaration" in nftables 1.0.9
To:     Pablo Neira Ayuso <pablo@netfilter.org>
Cc:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

> This is bug of mine, apologies.
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122085912.3098-1-pablo@netfilter.org/

With the patch applied everything seems to work fine.

Thanks Pablo!

Regards,
-Martin
