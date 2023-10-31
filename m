Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27216C4332F
	for <netfilter@archiver.kernel.org>; Tue, 31 Oct 2023 18:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbjJaSyD (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 31 Oct 2023 14:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbjJaSyB (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 31 Oct 2023 14:54:01 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5969E8
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 11:53:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so10461673a12.0
        for <netfilter@vger.kernel.org>; Tue, 31 Oct 2023 11:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698778437; x=1699383237; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h/2+hBb0GsCAaQ29C8aK7g2ximVbU4YZTAy4/pheG3g=;
        b=m6CaQL5MZTQGB16bFhMEkV3coZCFJD/ZS9hms59UzCqfnDuOXG7MWvJfxRjjRGec08
         tD5n1Cpqj4f2U4NdF1qgHk5l1XNN5Tq/hKS6lAphvNXq08LGGR0Lu4HDjjIlHjWQer18
         vaRqlPD8xcTUxvSJfyzea7shM2KfVjLpV4QXE/E8VO+9jgMGv3hdL97slZgUI5NavmqR
         A8GaL/kjV625dUMZak1FFBLzV8i5MqTlf/nhU+nNiHwhkcvogHl+50dg7OivSH9hzWN2
         5S+SeeBZL2HT/qT7TfscQRzGtdFLqWOD1a3W48ByEbBKZOqctaR6/oaxw40e4De0yiT2
         kNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698778437; x=1699383237;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/2+hBb0GsCAaQ29C8aK7g2ximVbU4YZTAy4/pheG3g=;
        b=ao2Wg7NM05dAIOXFTJe6nvzwSiIII6liv2PezUP04FSrtpSrUSN79dun7ebCKh+6VR
         MA+H0Gj2wyEShpUMPfbohDGPOmPedAxNRlRs+R+qaEpm00YYacnfmk0xq3X92AWt4FVD
         d2Va06HZbiIeO6fjOe7ZP5ZszoCDkB7EQYrFXuOY7pDDHjHg9kD/Jeb4RUwbskTf1rJ6
         vIF22yb6Ak5VaNEbpYyaI/VXWzGCD/mJ+CKObEgbOy6H9D3//CSOqszz2444D9djDtcE
         Hch03BQTn/pegHUBtzplmGyxsBzSf3kusPQAuc7crrdMWHw/blvu81+1j1iaF0G8bLoc
         EBGw==
X-Gm-Message-State: AOJu0YwczTtXnGbI1iVOBvUgbfGF+Mj54KPAh8DrA504iR8xMs9M8pre
        vFXdBfSuDXTz3OQ1nI0VzSsVn6u3bTz1iwOdKR2f4cH/rHE=
X-Google-Smtp-Source: AGHT+IGjhl0Wq4/FiCFLMETkCaRjVQUycok0W19r20YcXUXch3I/4fLp6LRUUHDvkJQnEvKaPqvv+L+BkRc6e9kmZ9Y=
X-Received: by 2002:a17:907:940a:b0:9d0:5fa5:54b5 with SMTP id
 dk10-20020a170907940a00b009d05fa554b5mr191496ejc.25.1698778436851; Tue, 31
 Oct 2023 11:53:56 -0700 (PDT)
MIME-Version: 1.0
From:   Brian Davidson <davidson.brian@gmail.com>
Date:   Tue, 31 Oct 2023 14:53:45 -0400
Message-ID: <CAOoaxdFXq6aJJMrFC40PRqd7ZTJDroRVh-BpH8Vz7H618V5GYQ@mail.gmail.com>
Subject: meta time rules display after 00:00 UTC
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

meta hour rules don't display properly after being created when the
hour is on or after 00:00 UTC. The netlink debug looks correct for
seconds past midnight UTC, but displaying the rules looks like an
overflow or a byte order problem. I am in UTC-0400, so today, 20:00
and later exhibits the problem, while 19:00 and earlier hours are
fine.

nft add table ip t
nft add chain ip t c
nft add rule ip t c meta hour "19:00"-"19:59" counter
nft add rule ip t c meta hour "20:00"-"20:59" counter
nft list table ip t
table ip t {
        chain c {
                meta hour "19:00"-"19:59" counter packets 0 bytes 0
                meta hour "1193042:28:16"-"1193043:27:16" counter
packets 0 bytes 0
        }
}

# nft -d netlink -c add rule ip t c meta hour "20:00"-"20:59" counter
ip t c
  [ meta load hour => reg 1 ]
  [ byteorder reg 1 = hton(reg 1, 4, 4) ]
  [ cmp gte reg 1 0x00000000 ]
  [ cmp lte reg 1 0xd40d0000 ]
  [ counter pkts 0 bytes 0 ]

# date
Tue Oct 31 02:47:31 PM EDT 2023
# nft -v
nftables v1.0.6 (Lester Gooch #5)
# uname -a
Linux router 6.1.0-13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.55-1
(2023-09-29) x86_64 GNU/Linux
