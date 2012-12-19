From: Giuseppe Longo <giuseppelng@gmail.com>
Subject: Redirect network traffic
Date: Wed, 19 Dec 2012 15:59:01 +0000
Message-ID: <CAFpD06Q+6f_U6NCk7q+S-H3VzB6vLNRJVpgCbzOx+-XU4aFPwg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=hTQT4oCd90SRSLvqw83gZAoJDYwY26ft3Pc4DhQDigg=;
        b=sZwhcIQZDjYTH9Z5D8uSDE5E3ouyJFWbFkD4U+kYNsg77U4K21Q1nBdtMCTA7aORIC
         B4muaiWCM3sglMSM227nXtEGLuqKKo8zFMqLl1t8Zxmw7CGL9huUTUTx6IuhWtP/Ywp4
         ve+1wJ6Ulaa92NHPpmY3WFMudnmDI4G6//C7+zMA4Y0GYseqPeuHwQI9Ufe0B6LrwUa/
         dZBJAz7YSYKLDAQQXmjm9J0zJgio6i819ZCEmeQLU8ppNH/MzHF13RglIC2s8bnCWnTA
         mH1WKwx5Bfxb/e7MauvsViobiuuyJ5QXBqTOGGuFXuDpr5BqElGpCuMmT43qJ81jdiYG
         1Qog==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi guys,
I've an openvpn server with two ethernet interfaces, eth0 and eth1.

The network traffic is coming through eth0 interface, and i would like
to redirect all traffic in a specific host (ip address 172.16.1.2)
through eth1 interface.
I'm trying to explain with an example

If i want to ping the host 172.16.1.4, the ping must first pass from
the host 172.16.1.2:

Internet ---> VPN ---> Host1 (172.16.1.2) ---> Host2 (172.16.1.4)

I've tried with these rules:


iptables -t nat -A PREROUTING -p -j DNAT =96to-destination 172.16.1.2
iptables -t nat -A POSTROUTING -j MASQUERADE

But, I think that is not correct.
Any ideas?

Thanks in advice,
Regards.
