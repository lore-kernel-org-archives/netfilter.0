From: budi wibowo <bwibowo@gmail.com>
Subject: router and masquerade
Date: Mon, 9 Sep 2013 06:41:27 +0700
Message-ID: <CAKnRR0ZrEyKL1oQTLiP8AoWhoC7kyTajbzboHdPn6-9RLxoBtA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=CYW4xav4BY0zcPgxvaXQILY2Kk3R7O6usdGVL6QCW8U=;
        b=KQg3dSpfcVGrYYHBwZuKR0cLSlgjchLTPjNMeHHUzc4qU/jkigYYuXBdcsXL1HltE2
         ETsrOQYROExmzZ5sVSVDZqBenMssB86WLk/UU52o3sxNFAn6/yKyMUQlKPJrldQ1CSGO
         qc+DdME7E82BNFPQnoUV0G06JddsMGVCQehXIBU3ZquSriDKdftF6UOIwiqbps+HeSvD
         s+V7aQ+C3DcGWAVaL7dC+T9cJSysv6RYRBnV2Z10+N8nVnMzQENqxn5kEB/TEhUD2luy
         +J7j4+XOCFZs+T3yi/kzudfBZxPdaHGVpN10sL4ddv0aMCM3lRaIvafDYQKWjc6Rvg+Q
         KfRA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi
i have question and i hope the question is on the right list .

i setup PC router running on ubuntu 10.12, since it is router all IP
address are public IP.
Topology will be like this



Router_to_Intl             Router_to_local_IX
       |                                   |
       |                                   |
       |                                   |
       |                                   |
        \                                 /
          \                              /
            \                           /
              \                        /
               \                     /
           Distribution Router
                         |
                         |
                    Client

on Router_to_Intl i have define rule to ACCEPT all INPUT OUTPUT and FORWARD
chain, also have enable ip_forward in sysctl.
the result is client cant ping outside, but when i define MASQUERADE, ping
and connection to internet are working normally.
i dont want masquerade happen in this case


anything missing on my configuration?

Regards

Budi Wibowo
