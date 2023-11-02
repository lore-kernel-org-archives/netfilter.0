Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B61C4332F
	for <netfilter@archiver.kernel.org>; Thu,  2 Nov 2023 22:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234450AbjKBWVa (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 2 Nov 2023 18:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234140AbjKBWV3 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 2 Nov 2023 18:21:29 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77B610E
        for <netfilter@vger.kernel.org>; Thu,  2 Nov 2023 15:21:25 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so1358054276.0
        for <netfilter@vger.kernel.org>; Thu, 02 Nov 2023 15:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698963684; x=1699568484; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjBSrgPshkKmPjRApJfZd9hb6/hmnPHmP+c+mLpQOdY=;
        b=HYuhRrs2GiBBHqIfmN3VggNqK1qsI7wRFiDuriveMF5SHzltx8ANsytJked8hyum/a
         IAJN0R8s8aULO9de0lEXWC/L/s7dIfx0NQJQBkW5Rg+Wa5caH8MxfcN/XFcuHJqgAYml
         XJtzLxY143PfKn/fCfMWkWZ6cELnfMJCAioSNFQAzsVdiZFPEJT9CT+tFy3hlYMyOXO4
         s1TZgyUx+ooa8KBWXXLLogzALVUKu2m7tKVGW/9QzKkOiLjzaGTm3sOCVGz1fAFKwqDB
         f/8A3/Vq5IqNsGEbZgujDFIs6auWhbAd50ZVPoOw2/7/1LyAlXQaZlYhYqsFZPNUD3Rg
         4s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698963684; x=1699568484;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjBSrgPshkKmPjRApJfZd9hb6/hmnPHmP+c+mLpQOdY=;
        b=nJQXQSQmotZE3T7yBycwlXesF/wUXcXTR6e60yGEQM/k6FHnMa377SmEExjv1YLF4c
         t3UtpYuOWpl+6iv3UYE/n3HW5/1+aplfK+ycRMx7PmofF/zT8dcycroRmwx4SBhRmZCe
         l4DJmdVJaRYp/VWhJfNZCkUneouhihQVFNZgQRbf/7UJ0eX2WeGLewcPCp15DghoilaJ
         Ak7Fh3sue772wbqLTiqNwSarsMgMBhXlgx92GEofJIkPYDn8CqdWIQCo8VS7WJc+M+NF
         kafbXyUYEwsdstGVJheWj0//aFgDZRfrsMQ+TD7CPZESAReWI0sHmXrHBBY2bpomq1kE
         NDyg==
X-Gm-Message-State: AOJu0YyTLxs3VWnBfujPc0CJiacKFcVFAR7wdJNHcx0jsZuf97RGVWi6
        PLJdVkDta6HZyjVdVbfyIyHPUL3LuHACpeUT4U29mVWoqCcdH+eP
X-Google-Smtp-Source: AGHT+IHcVhaZw7V/3e8fmw1u6REnJUtKDzMqho+JuhcgnoKxRCu0Vok/p2miq3itgkUfsSBypd/c5Gd2EZUL9fjXTlo=
X-Received: by 2002:a5b:b07:0:b0:da0:3ec1:f3f with SMTP id z7-20020a5b0b07000000b00da03ec10f3fmr1252024ybp.3.1698963684658;
 Thu, 02 Nov 2023 15:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALDEYCfdiRSxm1bG_Zz0qn+avm2gOD5nQk-ttCuxqug6RW-AyA@mail.gmail.com>
 <CALDEYCeVPZdCdDLhnPC92SGbcW46EamFvHbh8q5fwshjUa7ZYA@mail.gmail.com>
In-Reply-To: <CALDEYCeVPZdCdDLhnPC92SGbcW46EamFvHbh8q5fwshjUa7ZYA@mail.gmail.com>
From:   niconorsk <niconorsk@gmail.com>
Date:   Fri, 3 Nov 2023 08:21:13 +1000
Message-ID: <CALDEYCeOTs8g=ZxCgM-M1AJUwi0NbgbmP=63=_=dfCmR+pO7ig@mail.gmail.com>
Subject: Re: Help with debugging combination of tproxy and policy based routing
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

For those reading along at home, I have now discovered that this was
indeed a kernel bug but that this bug was already fixed by:
https://patchwork.kernel.org/project/netdevbpf/patch/20210418210415.4719-13-pablo@netfilter.org/
