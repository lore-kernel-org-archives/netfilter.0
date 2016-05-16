From: Adam Mills <adam@chambills.com>
Subject: Fwd: iptables mac match in PREROUTING not always matching (on bridge)
Date: Mon, 16 May 2016 15:10:26 +1000
Message-ID: <CAB-=y+DF+9px8c1-vZJ1r7M+NQtS5fvOpNfaZmhxuBhwyWk=jQ@mail.gmail.com>
References: <CAB-=y+Cmm88Yx7qefYiT2C9VyiWMnNNkH8NiLwr-a2yn4=_-QA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chambills-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-transfer-encoding;
        bh=POXoC2nKitdfnLv/du5R0IZUYbq4iGOmTvF233yQe2c=;
        b=mPmA47/wpwm7UqLDzNy7MDRgJP5wWS3jbnPXyK3DCAv/rCBMRFGIaIDP0YvTaaLkNJ
         ZQrkh7GE62r/ZdDziv9I7f1vfZIBRvK2bXjUv0qytb2RMzo80RvH/zl3vA83gzVmz4WU
         SCPs0Cu/CywVpcz7C8gm8CjT/jk1B0W29JchRwgCVaMfiRoZ5b0BrqatuL6C2bUZdmHm
         Lb8+JoV8Y8k/NXk9uA+SZfB+1Lu2l6BdCX6CX8jdh4r8hWHdujc90yZc1THICzvW9VIE
         3alIxiJDKNO5CLHMnFhFq6Gw/4kejFUJhjQv4YjgrZovInKQOB4Q9F1je+zcs5KYH9ou
         hKWg==
In-Reply-To: <CAB-=y+Cmm88Yx7qefYiT2C9VyiWMnNNkH8NiLwr-a2yn4=_-QA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

I'm running iptables v1.4.21 on OpenWRT barrier breaker configured as
a bridge with

net.bridge.bridge-nf-call-iptables=3D1

I have some rules in iptables chain PREROUTING (NAT) that filter on
mac then log any unknown devices. I regularly get logs for devices
whose mac is previously filtering to accept.

Is this a known issue? Am I doing something wrong?

Thanks
Adam

=E1=90=A7
