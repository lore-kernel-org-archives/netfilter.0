Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47320C2BB3F
	for <netfilter@archiver.kernel.org>; Wed, 15 Nov 2023 18:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjKOSdW (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 15 Nov 2023 13:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjKOSdW (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 15 Nov 2023 13:33:22 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B4E182
        for <netfilter@vger.kernel.org>; Wed, 15 Nov 2023 10:33:18 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so11403920a12.2
        for <netfilter@vger.kernel.org>; Wed, 15 Nov 2023 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700073196; x=1700677996; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uTXTemcbou/w1ZD86wHyowfwIjX8mveVI9fUXpHrxPM=;
        b=ldZtiNR2/TSKw8aYmifAanI6ckAPmeXOv6rECZoS9RY1LYvr5AMFetMZz6r9t4pFUD
         yeB9mdoS2/q7L8qUfL90OxcSB/EeO0CuD1tw8pTxoAsv3q/lEecjoWltJRRq3WCipxvX
         35FY6GQXFTdouX9YEuC9ET3kg8scLMd3z5B2sqnk/TyGclYGrQUqFg9sE/5O94FrlxxN
         h3pfV6UMSNT9/mIw2cKRolVKEStkcf5YYJ+s1qgnB2+vGH4i+hc0LsqVaPdvaqo5Y38Z
         XFwNEJ63PIcNgOYoinAGii6jQdwfArfBJLFpdtkNYoTnyhjqO8/oKy1jBmjwCmtpGjLN
         6Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700073196; x=1700677996;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTXTemcbou/w1ZD86wHyowfwIjX8mveVI9fUXpHrxPM=;
        b=nZTgPadRm29cNfX3QiAwVJTvJj+BHGw+Fyeo37fhx/K/45p67WsDVF0pB7ZqeLGVPE
         JcKmxls10RVdAKMx5XB6ogg9ymSNkqk/CVNQ1uXmweVMv3V5u2mvY5LhsAzylJhg9vRD
         Ed1dIp06eV+xRl7LCDOuvpvl0QTsxf/bg/p97WsM4l2j0JRxQ+ZIPZe5q/1hreEbjjfW
         kuUYV50OVHoL1Nh3nR5mWyxS9YQ4Su7+n2/L/es/XUsgzufcox/CWe+ggxJFea6Yl48V
         eYjX8xQXG2JhyCvIcPbnUbcyGatM7BskYHKML/AwMhoYwOHe6U55gAAzs01+xBBk8+MN
         Vb/w==
X-Gm-Message-State: AOJu0YzGyo9TRSVzb6D8+s9lOuLbwQNPrK1kUL89pJeJ3EEP6jW+pl2Y
        gjRAtGasRHlJGXuj7+DEoKJEzy6GkN7gXdbM0o/EpSFyDGqYGw==
X-Google-Smtp-Source: AGHT+IEVsAmQRZKmjyxGxd1N37sQ5JfZSPT0ur0ECTI8OGrxrRqlrcZKIx8alk0YYxhn1iZTiK5ORdFzzFoKiSzPQC0=
X-Received: by 2002:aa7:d943:0:b0:544:b880:b316 with SMTP id
 l3-20020aa7d943000000b00544b880b316mr11540053eds.30.1700073196454; Wed, 15
 Nov 2023 10:33:16 -0800 (PST)
MIME-Version: 1.0
From:   Brian Davidson <davidson.brian@gmail.com>
Date:   Wed, 15 Nov 2023 13:33:05 -0500
Message-ID: <CAOoaxdH25O+QYWkzGQ7uOU5NLqROHu-WfpY4AZtVwb4V80=F=g@mail.gmail.com>
Subject: meta time/hour questions
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

The man page states that meta time and meta hour optionally accept
seconds, but I get errors on v1.0.6 or v1.0.8. meta time doesn't even
like the dash date separator.

# nft -c add rule inet t c meta hour "17:00:01" drop
Error: syntax error, unexpected colon, expecting end of file or
newline or semicolon
add rule inet t c meta hour 17:00:01 drop
                                 ^
# nft -c add rule inet t c meta time "2023-12-24 17:00:01" drop
Error: syntax error, unexpected -, expecting end of file or newline or semicolon
add rule inet t c meta time 2023-12-24 17:00:01 drop
                                   ^

Documentation problems or legitimate defects?
