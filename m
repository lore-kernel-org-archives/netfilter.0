From: Prashant Batra <prashant0100@gmail.com>
Subject: ip6tables support for filtering sctp packets with specific ports
Date: Thu, 6 Oct 2011 20:14:15 +0530
Message-ID: <CAG+XuE607ciut+hUOMUvE_5h98fE4xf7J48Oc9ecanGrFKhvoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=LY9OKjdieAJbZiLdW5mZnmRZ2OdJ/iifh8CQmJNuP7k=;
        b=K5iRK69OXmiaags5r3X+WWcv72tnG5R0XI0o0WP+g588QhnH7UPv44BYXDuHw7uNi+
         Ge7sQXLEhmfuTDCrBfZwHZ5z04Sy37KZReHC5AwivYA9FCLGavh8x3ygI+EAr1Esa5hU
         +tTpVebkxJUWrzRRiUzNLeQhiwrp/6Wpw/E2Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello,


I am trying to achieve sctp(ipv6) packet filtering using ip6tables.
I have tried to use the following-

ip6tables -I OUTPUT =96p sctp --sport 3232:65535 -d 2001:db8:0:242::36
-s 2001:db8:0:242::37 -j QUEUE

But, it seems that ip6tables does not accept the port number for sctp p=
rotocol.
Similar command works for udp/tcp.

Can someone help me on this?

-- Thanks
Prashant
