Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CB7C54FB9
	for <netfilter@archiver.kernel.org>; Sun, 19 Nov 2023 14:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjKSOou (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 19 Nov 2023 09:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjKSOku (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 19 Nov 2023 09:40:50 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9CF9F9
        for <netfilter@vger.kernel.org>; Sun, 19 Nov 2023 06:40:45 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9becde9ea7bso916091966b.0
        for <netfilter@vger.kernel.org>; Sun, 19 Nov 2023 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700404844; x=1701009644; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4jdNWgSQpgsQu48cyXC+nFC81cqQuWgTb4CLU941ID8=;
        b=PMe8XxraYvzlsLJpyrQm36ZUlmNC4jREKfL4Afd88QDuTZZiBFWCq2/1Nj4uVqslAR
         obbraK5fkkkSSAdNRIu8haq3hRwppvthBrMO7gLT2NWs7YLNZV0xhYMOOXN5q6y1ppsn
         5eGbDtIZwAJ34pC/sF4AmG0CIBe7CA+KPIxWUXF2SQ3K9BikLhV74MnwxYsmggEIxAy9
         gIIZZBmapekorYmDOYcHs1cioTg8uYLW27gnU291HRXeh7o6XLxSJ0PH5Zasj/s+H71b
         B32jcDF0Zq5wMad/gVF6Leq1GEWm+HRKyNENzeeGwkkEImMeXylsDJ3xeYOfhFI8UOOk
         Lvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700404844; x=1701009644;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jdNWgSQpgsQu48cyXC+nFC81cqQuWgTb4CLU941ID8=;
        b=shO343kFacqAEsdWL7aVm9PxcsL6uasf4jS4v1IkYwD4w0npS3Ml11YG7C6banXOIL
         JaqPWCuJUhYDhGswz63YPqwzzdS++08ZtpKK5ouwWyVWH9ccBzJdVgfuBPrzwgDgWiC5
         0KaRhr1L3d5KkNFgV3ibivhELESvWpFoxj/xTNiCuqqXjHNTBkT2yIKqZVTlhEycEwoO
         DulZfkfeBAKHOxAV5vE+I61eafdqmLy/Bkkvr3tJohLzu99D0jvJ0yUZmTZO/TIJ5/RE
         OrRy9MDEpaxur89U+Tdpgc2/WZ6icQ6DZDNdg6zr/CtV5La8aIT+yZ1Ssp0rHJlUvl5R
         9nrA==
X-Gm-Message-State: AOJu0YyauVDZr0cFEnol2WQMmEW1RM8U8nQhqFEFhzjthSdJeb3x62Gr
        d822/D1tbmTIUBD7se2gUCe6/9qZEteAPNj3dihn3xvl68I=
X-Google-Smtp-Source: AGHT+IGBfhOR5Zhj411prfmeoLsy1kvL2Ov7VMqnfPGNYLutQjlW87bA00zTebOdC9ckPikghbnD290Wexen0F2ER3Y=
X-Received: by 2002:a17:906:51dc:b0:9b2:b15b:383d with SMTP id
 v28-20020a17090651dc00b009b2b15b383dmr4575169ejk.11.1700404843751; Sun, 19
 Nov 2023 06:40:43 -0800 (PST)
MIME-Version: 1.0
From:   Martin Gignac <martin.gignac@gmail.com>
Date:   Sun, 19 Nov 2023 09:40:07 -0500
Message-ID: <CANf9dFOQJvW8AOBdJ327sb8hnJAyonpnRYe1kvEYKGYn=BXqKg@mail.gmail.com>
Subject: Getting error "Error: missing hook and priority in flowtable
 declaration" in nftables 1.0.9
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

I'm seeing a difference in behavior between nftables 1.0.7 and 1.0.9
with regards to flowtables:

    # nft -v
    nftables v1.0.7 (Old Doc Yak)
    # ip link add dummy1 type dummy
    # ip link set dummy1 up
    # nft 'create flowtable inet filter f1 { hook ingress priority 0; counter }'
    # nft 'add flowtable inet filter f1 { devices = { dummy1 } ; }'
    (no output)


    # nft -v
    nftables v1.0.9 (Old Doc Yak #3)
    # ip link add dummy1 type dummy
    # ip link set dummy1 up
    # nft 'create flowtable inet filter f1 { hook ingress priority 0; counter }'
    # nft 'add flowtable inet filter f1 { devices = { dummy1 } ; }'
    Error: missing hook and priority in flowtable declaration
    add flowtable inet filter f1 { devices = { dummy1 } ; }
                             ^^^^^^^^^^^^^^^^^^^^^^^^

I don't understand the error: "Error: missing hook and priority in
flowtable declaration" since I HAVE indicated a hook and priority with
the command "nft 'create flowtable inet filter f1 { hook ingress
priority 0; counter }'", which worked before, but now doesn't.

What am I missing?

Thanks,
-Martin
