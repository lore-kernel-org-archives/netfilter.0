From: Martin T <m4rtntns@gmail.com>
Subject: packet flow for connections to 127.0.0.0/8 network
Date: Tue, 23 Aug 2016 10:13:41 +0300
Message-ID: <CAJx5YvHu0+U-_zK4DNoTGJ_7FZVf3tBiJeunwg+VBDouB7pttg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=4YOt2XTHpDMParyBpL6Yqx8C5zGrfah8kU5/DiXs9X8=;
        b=yBMuDy7BOtFB0YmCdJkzUXpP6tbHK2vGTm3gq2pR1C6uaUEA051OhEB/iSd465ocJi
         +3JQX2iCtvpEcxXQFrLBhYmFCRlhk24X+az5xWIXfwAnTt83dLTAU7VH57YiPLbeZHe5
         Xn1nZdRXgTVqdRIRV/QAwwJOZZBsh0x1V3nM0C9SeHxYxf0/MABqA7xnNeI/U1sw1NXU
         7SAiAwhTtPrRaTdQFAvf5ODgz/d9YhoOGfM74m7JO1NIZ87o+YVBH8Zc7wJQFsvwtcru
         lHC6N3o7ZtzvusXMl3xS626Vpmy46Sijst8A+o4JjY+Cnk/W5u/KJDih/G4zBX8H4flJ
         3Ztw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a following very simple iptables configuration:

# iptables -n -v -L INPUT --line-numbers
Chain INPUT (policy DROP 21 packets, 1683 bytes)
num   pkts bytes target     prot opt in     out     source
  destination
1        4   336 ACCEPT     all  --  *      *       0.0.0.0/0
  0.0.0.0/0            ctstate RELATED,ESTABLISHED
#

As seen above, I don't explicitly allow connections to 127/8
network(-A INPUT -i lo -j ACCEPT) and thus while I receive for example
ICMP "echo reply" messages from 8.8.8.8, I don't receive replies if I
ping 127.0.0.1(configured to lo interface) or 10.10.10.1(configured to
physical eth0 interface). How does a day in the life of a packet look
like when it does not leave the machine?


thanks,
Martin
