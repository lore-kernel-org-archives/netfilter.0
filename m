Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD1BC4167B
	for <netfilter@archiver.kernel.org>; Fri,  3 Nov 2023 16:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343808AbjKCQTQ (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 3 Nov 2023 12:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbjKCQTP (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 3 Nov 2023 12:19:15 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C717CA
        for <netfilter@vger.kernel.org>; Fri,  3 Nov 2023 09:19:12 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo3649941a12.3
        for <netfilter@vger.kernel.org>; Fri, 03 Nov 2023 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699028351; x=1699633151; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o3sR1Opw7XvskawhCl7+1FvvIxqjjrvbFuVUlIEdLkY=;
        b=IykkDMqKtvM5SdbmUQt5zFBEX9h3PeJd7Np1isaSUmQKtG4Y8NP3VIpJQTL/IkY5q6
         13h24w1RL9kkRpT6IHULXOgsro5eXy9VLyElrAsG5ZWoQ0vl9ls8cyZy6nArffiDY9Gl
         qJOkVgVLBlY1n5uFzM6WGzYzxiQwoC01oGtLC5fGGhiyRRJ9DAHjnyTa/AzoAUvwkDz0
         1AK2u2golA3a+arRBWj1fqctfMqiqEbnZVZkTFSi1/q5x/Qz4aK5SAKspWPTlevy9H3d
         vw6Aut/EuH+XBAF66+rwLBmm/A90bFsSPB1RLTIcPp4KfbouiCeuuQ1JDwnsfILQVO/n
         PTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699028351; x=1699633151;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3sR1Opw7XvskawhCl7+1FvvIxqjjrvbFuVUlIEdLkY=;
        b=jJKXPY/uxL2W5Z6fTlHVfhOe2hPAJBnJwY7oOz2ktOKqz1rFggoAVlNN/5q6c/KYAS
         Px3r28RBzIukrL/9IUvF2kSvNEJv/vK9zLJa/yv3vWrelHxYOwBSH9DpyRaFeaCD8FYQ
         veTZ7ZUPaTpJbVPvzLHoA/FRVbSoZ/jtAYTPH8cbuPrq5I/kUkEcN2ximcwWX9VBJ/Rk
         hk+iIB9V4fr4Qz8uapluwc2gsIwQJDd9EuaH4YnQ6mz/LLSRv+gRACEPpoaIVkIdxnPL
         BhaRwATyCWQ6Dapfm8kmn59BRRiLrWi17LMTtvm2itIkS9inTpKrlJKWjn7nVt9wA3Pd
         QrBw==
X-Gm-Message-State: AOJu0YyQGAm4H/HzZdC1J2cIQX7ER36w/o9dbO55K+kSVJ0n4gOV1Ega
        EMbIaP73Ws0yqE3qiXxwqE9vSktit7xgDujhI6ULYl7w
X-Google-Smtp-Source: AGHT+IGXGEKilMTbVnJIQ7JZe6s6tkzMBftpJsZjbIsuNtYboKxffPbmcDQXXetVJwHqk/M1b5GnQO6ulgF5TRM/CMg=
X-Received: by 2002:a17:907:764c:b0:9b8:b683:5837 with SMTP id
 kj12-20020a170907764c00b009b8b6835837mr5844631ejc.46.1699028350619; Fri, 03
 Nov 2023 09:19:10 -0700 (PDT)
MIME-Version: 1.0
From:   Brian Davidson <davidson.brian@gmail.com>
Date:   Fri, 3 Nov 2023 12:18:59 -0400
Message-ID: <CAOoaxdEpJDAQMYxRCC6rUVc=sMY=YXxF42LSeDvMQUPC5sahLA@mail.gmail.com>
Subject: ip6 dscp fails map lookup
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Using 'ip6 dscp' in a map lookup does not give expected results. It
seems to always match the zero value (cs0). It appears in the first
rule that the byteorder is not being converted between the two bitwise
operations, which is what happens when using ip6 dscp directly in the
second rule.

# nft -f - <<EOF
add table ip6 t
add chain ip6 t c
add map ip6 t mapv6 { typeof ip6 dscp : meta mark; }
EOF

# nft -d netlink add rule ip6 t c meta mark set ip6 dscp map @mapv6
ip6 t c
  [ payload load 2b @ network header + 0 => reg 1 ]
  [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
  [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
  [ lookup reg 1 set mapv6 dreg 1 ]
  [ meta set mark with reg 1 ]

# nft -d netlink add rule ip6 t c meta mark set ip6 dscp
ip6 t c
  [ payload load 2b @ network header + 0 => reg 1 ]
  [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
  [ byteorder reg 1 = ntoh(reg 1, 2, 2) ]
  [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
  [ meta set mark with reg 1 ]
