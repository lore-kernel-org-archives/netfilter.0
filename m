Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D5C072A2
	for <netfilter@archiver.kernel.org>; Fri, 17 Nov 2023 14:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbjKQOk0 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 17 Nov 2023 09:40:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjKQOkY (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 17 Nov 2023 09:40:24 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9556D4B
        for <netfilter@vger.kernel.org>; Fri, 17 Nov 2023 06:40:20 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so6242315a12.0
        for <netfilter@vger.kernel.org>; Fri, 17 Nov 2023 06:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700232019; x=1700836819; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SD7BF83/raOyGekg4ButSwGsCL8VIX/qcVPWrPkIBvI=;
        b=lC+iwfCT2o8UThFVhl3uA6cNfnRe5m8higkWYlveDnOxa3uZ07s2aOWsUW1bh/UMOH
         OFo7eYc5P6k3aPjgPoaeBqBRZpgG/cQzEcWPEXHr65Q6yBWY2Km1M2nVZRk/9jZkFj+b
         kcp0tWHJdLKZ+pf9IegphHrR3DAxJlzjvyTaMys+kTs+WnMVoSgb7yyNTBg785dHC8eN
         6nAEMQA2T5xDnxRGhO7bk3KEpQQz3vxxZADU5MveO6fTu6aouyFYYc2XPUb4MbD+7uXA
         /OVJFBEIZQT918/J+FZuikP945wbSYkPVydw0rtbY5hB5xKmmMn6c2t53liqnJfjgZ2r
         pn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700232019; x=1700836819;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SD7BF83/raOyGekg4ButSwGsCL8VIX/qcVPWrPkIBvI=;
        b=esA+9yqJ4VWUba2m4tHliZkD9BWjv4q3MXGv7pD+hYptbxbDHNaannwJZNpPe8BbKu
         q05p/JGvSvDmJfI2lVM53vSUpt3Df8pUsi66MpZcXPW4WkcpDsvFdkxSFtMpT0AKSmGs
         hA150gouSFe7W8BxgNk4bu69P408a38r1rRwdKxG91kj/JgK9jcPFzFrH0zNtSfJufTL
         0eHuT4Zns7mrVjj7ciL+v0wPz8PaZCdkjQXdKcvAhLU8vJeEo4att4tt2fuSzSSGH21b
         0MYxhVInAmNi89Ld92hc9rDkuJZV6vzVsDHVV/d0/P7WBRbndrZ09SQnyfGPzy80Pu6a
         WTNw==
X-Gm-Message-State: AOJu0YyogIhphz5jH+6h/60uUj2NkalNUurGP8zaVedIldPhQsut8Svz
        6hdo2p/x6AEqqAU9pBoGR02L29pd+/WSP+quLndBmU3t
X-Google-Smtp-Source: AGHT+IFOcJ1S48gCvZKsEFNqFjjxfQOZP7k5e+fIrvZa7yD2Jhsn+THNO1akm008qS5gVMHdcJ6Nbg15Lj4Kncz/ZPI=
X-Received: by 2002:aa7:db55:0:b0:548:5ac3:5d91 with SMTP id
 n21-20020aa7db55000000b005485ac35d91mr548435edt.11.1700232019281; Fri, 17 Nov
 2023 06:40:19 -0800 (PST)
MIME-Version: 1.0
From:   Sixene <notsixene@gmail.com>
Date:   Fri, 17 Nov 2023 15:40:09 +0100
Message-ID: <CABGCCVc7Qb5U131xUL3mwGtok61=2mwMUOqpe7B_8D+S0VNngA@mail.gmail.com>
Subject: Optimize fails on a large ruleset
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,
I hope this is the right channel to reach out for support, the wiki
mentioned this mailing list.
I'm having trouble optimizing my large ruleset of 26000+ lines.
When I run 'nft -c -o -f ruleset.nft', after the while processes, I
get the following error:
nft: optimize.c:423: merge_verdict_stmts: Assertion `0' failed.
Aborted (core dumped)

My ruleset mostly consists of just 'ip saddr x.x.x.x/xx counter
packets 0 bytes 0 drop'
Hope you can help, as I'm facing very bad performance with this list,
however I have no choice because I need to block all of these
addresses.
Thanks!

(i could not attach the file due to your service's policies, however i
am using x4bnet's lists_vpn on github)
