From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: iptables role in protecting XMPP servers
Date: Fri, 11 Jun 2010 14:32:32 +0100
Message-ID: <AANLkTilITzuPsH2qbn2SC-GDg8erV6f7mH1bpFvWm5ws@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=kDBKOGGkRVsX4COH9SkA2Cfntkwp7KvnvgLKqIZPS24=;
        b=P/IKU3ek4hFirUjVpKoExTOOp/ImGrVS0wo3nV0JJTIIJDAWJcEL1fTrXOatow7KHD
         IIXUGqd4vxa+KkgbEwb0F7MgU2ZPJXKldzSwI40+qMxAA+qNg/9mAnaBZvLc7w6p83pv
         YMMneVf5hKtPdCtZg/9WykrPiBPn7HwaDUq98=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

Can iptables filter xmpp traffic, even some rudimentary inspection?

I am curious to know what role an iptables firewall can play in
protecting an XMPP server, such as Openfire, in conjunction with the
XMPP server's capabilities.

Apart from opening the correct ports, and providing typical DoS and IP
address spoofing protection, what other treats can iptables prevent
specific to xmpp?

I presume it can use U32, String-match and L-7 filtering to inspect
XML based traffic within client-2-server and server-2-server XMPP
communication.

regards,
Paddy.
