Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3729C2BB3F
	for <netfilter@archiver.kernel.org>; Mon, 20 Nov 2023 18:30:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjKTSa4 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 20 Nov 2023 13:30:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjKTSa4 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 20 Nov 2023 13:30:56 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9803992
        for <netfilter@vger.kernel.org>; Mon, 20 Nov 2023 10:30:52 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c5071165d5so58831691fa.0
        for <netfilter@vger.kernel.org>; Mon, 20 Nov 2023 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700505050; x=1701109850; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZqQoCTycbEQjQ8+eQ8Zr9ljpZMBlDRrXbooUryz1hE=;
        b=OkhdcsgXs4kDrLBzlWSIJJCbkR4u/Ph8/8LhMpbcKzeD+zI5e7QgQ3a90HQf+RvkMQ
         xVTPZE+fwsb43bUXNx7DuY6o+iK7M99oglExsQtoF9AuNP11qW0b3Wg3S3s+pmrcsmoC
         wq1jRZxoPe7HA/LnFDwpjpSNA+lD5dnoBqnL5pCVfxgCDQCCorGcyjy9TB9t4kl4nqLR
         Fg1bSitpxSBKnJbix3HwlcigtZrzfBgGUBEnl7LLf++qR8+yYL0cEXATuu/e5hMda5cA
         bJjt+AGSO7LyCqf9u8DHyfxG9ZS3oz2sYg0QcujD/lzkNBsH8bmuxc+xHo6xAo/wnj1g
         vL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700505050; x=1701109850;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZqQoCTycbEQjQ8+eQ8Zr9ljpZMBlDRrXbooUryz1hE=;
        b=Rgp6t59HjkdWiVz1urG5GxOEajeYNOY06gATr2I9ABxduXusMjS6CPj+RQDujOwOgu
         6np23wsgqyC7nYwK4v2dnnTavGWJNal37i6y0/4UORsS6wqSrHAWGoz3nHP0go0dN7j5
         dchmFAzMdBwvmZK51D+LEDMxxqnILBw6JbPB+1WpAb879TFLbaWwKxyy6FfuR+t8NR7g
         UR6XS9HJ4l2Ttp7POd5ibmbTSbqzy0h5rkRlsI+7MxhoVNmOIMV/rTT3J03KWKzH4tLv
         cSyNDm0OwRARo8cxm/bMycTJAzIZIoulXWRbJRV0CK3gSNW7nV90D+7/mCS/TftCXE+X
         5chA==
X-Gm-Message-State: AOJu0YycnGNrEQ3e9Md+Z2RNmNFI16KQjrsjXfCUuygpMXjy+7hMF+8B
        bjYs9hWyXBkm/1tQPxaXK0EdMnaHUkb79I4QRH600J3HAH9Qow==
X-Google-Smtp-Source: AGHT+IEIQZuFgNr62VEHt4oCdH7xL3Zr9BTD2OYPu0KJxKXj7DompDvj7OKHr0dxj9yXNp0qPB1BDbeRMmKv8V8JmgE=
X-Received: by 2002:a2e:81d8:0:b0:2c6:f625:cc61 with SMTP id
 s24-20020a2e81d8000000b002c6f625cc61mr5357127ljg.31.1700505050286; Mon, 20
 Nov 2023 10:30:50 -0800 (PST)
MIME-Version: 1.0
References: <CABTgHBtq5LGLoERAXzhNsoQCjsQSHrLq5Zn+1=U5Gukxc+qWMg@mail.gmail.com>
In-Reply-To: <CABTgHBtq5LGLoERAXzhNsoQCjsQSHrLq5Zn+1=U5Gukxc+qWMg@mail.gmail.com>
From:   Nayan Gadre <beejoy.nayan@gmail.com>
Date:   Tue, 21 Nov 2023 00:00:39 +0530
Message-ID: <CABTgHBt3qAxLf9kYg3TjUbges1yUKnMAL0okcr=W9s=v1KhWfg@mail.gmail.com>
Subject: Fwd: nfqueue at postrouting hook does not work
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Kernel 4.4.60. nft ver: 0.9.6

Hi,

I am trying to send packets to a user space application using nfqueue.
I added the following chain and rule.
table ip hotspot {
        chain nchain { # handle 3
                type filter hook postrouting priority 400; policy accept;
                udp sport 53 counter packets 71 bytes 38194 queue num
43 bypass # handle
                udp dport 53 counter packets 73 bytes 5184 queue num
43 bypass # handle 33
        }
}

The counter increments but the application does not receive the packets.

If I try at a different hook position then the application receives it.
table ip hotspot {
        chain dns-snoop-forward { # handle 2
                type filter hook forward priority raw; policy accept;
                udp sport 53 counter packets 23 bytes 12951 queue num
43 bypass #
                udp dport 53 counter packets 28 bytes 2031 queue num
43 bypass # handle
        }
}

1. Does post routing hook not allow nfqueue ?
2. Also Is it possible to send packets to userspace after the
_nf_conntrack_confirm() has confirmed the ct. I tried to change the
static priority of NF_IP_PRI_CONNTRACK_CONFIRM to 350 and added my
hook at 400, but packets were not received by userspace. Anything I am
missing.

Kindly suggest.

Thanks
ngadre
