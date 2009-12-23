From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: IPTABLES and NATTING
Date: Wed, 23 Dec 2009 09:51:57 +0530
Message-ID: <5f765be60912222021y5de642a4u785aecf0476a2c29@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=O5UacBjfUy85qeVBLL1mk3dUV4gWctOYJYvazz0yNWA=;
        b=b6lPE2MEnh1OWssnQCBjAjSWzt2sQVCX3piFx9oFKZSGrrqtZfhjudMa6+DoHVCNCC
         P0Xa8T84uSsW7WG/ftlAEQTyAyzBiU7DF8jTG7hiYKXNwxuGlp3MpsTNtFM8EAJKGTaP
         dlwswOb2XR3W9IErgOT1tGNHRyuD/orBq43kE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

Below is my network setup.

                       linuxbox
                            |
                            |
 INTERNAL  ------ ABCD ----- INTERNET
(p.q.r.s)                               (m.n.o.k)

ABCD has 3 N/W interfaces connected to linuxbox, INTERNAL N/W, INTERNET.

Linuxbox has a private-address and it is not in the same subnet as
INTERNAL N/W. I have to do snat packets from linuxbox to INTERNAL N/W
or to INTERNET at ABCD.

I have a small doubt regarding the FTP from linuxbox since I have to
support ftp from linuxbox to both INTERNAL N/W as well as INTERNET.

How can I right a rule in iptables present in ABCD where it can decide
if the destination ip-address of ftp server is within INTERNAL N/W or
in INTERNET and do natting accordingly.

--
Thanks,

Ajith
---------------------------------------------
www.codingfreak.blogspot.com
