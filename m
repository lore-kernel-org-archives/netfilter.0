From: kotayabu <ronholy@gmail.com>
Subject: How to mark a package using ebtables and can be seen by iptables?
Date: Thu, 17 Jul 2008 09:26:44 +0800
Message-ID: <db5661d60807161826r365754dxa0b2c178f29839f0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=RPtrR7pf0I4vX7gw8rDaXXTsN/mrsM1luo7q4aUZdJw=;
        b=DKf3eJj54lTM13ZPqlU7LeEzmj1EfrtvGi5vXoHQy04MPtR8q5aUs98NSaGrHTsN7m
         RMq8ppFMjxNrpkyAXVBXte4MY5IIVPGBYewwQYILsPXYfLDvQrPLXTQSM2UnNNpNhqFx
         VdZ8gCAY4cQ2I7cVZvczeYcIRwNuq+D6oMm4k=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have those rules to accomplish my need, but it failed:

ebtables -t nat -A POSTROUTING -p ipv4 --ip-src 10.111.207.26 -d
00:50:56:C0:00:08 -j mark --mark-set 2 --mark-target ACCEPT
iptables -t nat -A POSTROUTING -s 10.111.207.26 -m mark --mark 2 -j MASQUERADE

What i'm trying to do is when the package routes to one of my gateway
00:50:56:C0:00:08, it's masquaded, and others defaults to accept.
and i tried many times but still not result.

does anybody knows how to solve this?

:P
