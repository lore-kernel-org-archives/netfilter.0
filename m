From: public1020 <public1020@proton.me>
Subject: Modify packet without NAT
Date: Sat, 17 Jun 2023 03:22:46 +0000
Message-ID: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1686972175; x=1687231375;
        bh=Xo4Cr0GrcoRjdKNRwlRT0efnLHHRoGpqiidgRUcSXsM=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=eI5MBY4qJw+PPh8RWYa1qjDJWZeuTmF3fphcYsa6wQpED5bEeDxeuXmb8fYaiXE2q
         DuxfwPHU7ZEezCLxhFDktMw2S2eX7b8tWotsBEdWYGwE+q+U8AY4ORaLw19wlaBT87
         Dj4y4jjDl89xKDCRNNZbxfaKD+O+QTMrVTBVWekQtZps33hqzd7CHMyfdC0C9w6ehi
         PDNfS1AdyJ1IcZBrz83sIDJHfzbiXd5rJazWoqSoQFpc5SPhk/yrp4bqeiw0KeMrOe
         ztUQO/ODm2CxXeT3GfUw7JN7iZdFZ+ZBlU83wITM4cWGVbOdAvBkrPbmQU8JIQgVpO
         b0rANVXnsRquA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have a simple nat configuration to forward certain access to a gateway:

iptables -t nat -A PREROUTING -p tcp -m set --match-set http_port dst,dst -=
j DNAT --to-destination XXX:80
iptables -t nat -A POSTROUTING -j MASQUERADE

Can I do that without nat? Just trying to avoid the "conntrack table full" =
issue.
Is there a non-stateful solution?

