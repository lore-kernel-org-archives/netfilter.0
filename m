From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: ipv6 rule icmp bug maybe
Date: Thu, 4 Apr 2013 10:02:28 +1000
Message-ID: <CAMD-=VJU3PesmF7P4c0nQuk1Nw_XdoUf559h8tXfbEGXEv=2dQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=UNDG+7VYTbIGLDypKAtP5OZLG0Y8Pb6xirTbD9VVk24=;
        b=NCNgda6xGeVrTpWb9Hac0qhym1YPHL6jsiQKwiSz3OGwJJfjnVpN75QNwY4UKgCsVR
         Zlwf+AZEHdXjvnkIsi5RWYj4IBVMttpHkPDyJanPmpDhDhz+Ovno6TNsZeDnhy4sUDOW
         YDQRVtV/L9HH1QvRUB7NOQ6epIDxQNJt9a6DAPxp1vtzIlc5NYXH2+UzRSfH3lc5l7Zd
         8bxeOn5cfFxSePrAnhqj+hyjkQdAn/DPGNuTeX7g2NsuE1VY83sVdpriQzIY4eAcAFGx
         zKSMVR2H8xP9w9AcG/IqF32HSZhvjlzJ4eCRNg0drtBbmVoD1y3NOJ4tKvOZqryV/eF8
         z3KA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Wondering if this is by design, or  bug

with ipv4 we have been able to
-P INPUT DROP
loopback accepts etc...

-A INPUT -s 192.168.1.0/24 -j ACCEPT

hitting this, means allow all from 192.168.1.1/2/3/4.... etc  - tcp.
udp. icmp whatever..

But with ip6tables this same approach does not seem to work, it
permits tcp/udp, but it does not allow icmp, bug?
