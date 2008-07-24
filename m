From: "ibramo addison" <ibramo5050@gmail.com>
Subject: [CONFIG] Block port when listening socket is closed?
Date: Wed, 23 Jul 2008 21:10:24 -0300
Message-ID: <8e8818110807231710k6f15cfb3n694a409f83e2833f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=OHXqxqlSTo5iP5Ni0PaYmm/543M7h+Qxig3QX20TLAg=;
        b=knbLu09LcNW3+QwUbyVLS/mB06PqeetOID85257twa9AtAAX2hL29P1dMYVPk7MsLw
         FRso2H76cvk0y3+J5h87zIfnvs/hsmtstZHf19j8UQwibZz0SZJuACASn2SsBRbW9hL/
         gKdVI3HL9x/ZX/JabQm/Gylcdvgm9IbKbPl0g=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi

Would you happen to know a way to control system behaviour when
connection requests are received on TCP or UDP ports where there is no
socket listening? I know this can be done using net.inet.tcp.blackhole
or net.inet.udp.blackhole in FreeBSD but I'm not aware of anything
similar in Linux, so I thought iptables would be the only possibility.
