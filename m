From: Alex Barylo <abarylo@gmail.com>
Subject: Rewriting target IP and port on Linux with iptables or firewall-cmd
Date: Fri, 4 Mar 2016 11:45:42 -0800
Message-ID: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=n+UQXVRROxTVQZizCM/rjPSAC7qNzo44lHMDxBxdhgw=;
        b=RC5Udkl3CxPSfSNhp1MsQMbMPfcMNGoixiEkZfGkgy8eX4rG1Z7Kc+RAwyEH4rGjUl
         GQC0QaK3z0zsszjDFTpJB1vVZOI77hsvmGMvx5h6IFGrT4CcSojs5Ozhj/ZwoxJPVkht
         2X93JUKjIENKiFP9Ad/uwjnXxl56xOIy+XRL9Fb3IBMYNT5ByM7X6Ex0f8GedS3vEX6d
         su8MhiMEXRnhuUguuCKnh7uhElg3Hc8+GTHnE4lv++qBbtmUfyr2LrDXsjWvyGfA0Cgy
         VdCi2qfvQmZzPinyuhq2/q9PAaNCZ4PZf8gW/5ZSS0Ct2HbYufByfdp2G7ZReplpzWei
         lx4g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a server in a DC1 with a private IP, of say 10.10.10.10. This
IP is NAT'd to a public IP, say 216.58.219.10 in this way:

216.58.219.10:8090 -> 10.10.10.10:8089

I have a server in DC2 which knows about (and wants to connect to)
10.10.10.10:8089 but doesn't know about 216.58.219.10:8090 (long
story).

So I want to rewrite dest IP/port from 10.10.10.10:8089 to 216.58.219.10:8090.

This is what I tried:

# sysctl net.ipv4.ip_forward=1
# iptables -t nat -A PREROUTING -p tcp --dest 10.10.10.10 --dport 8089
-j DNAT --to 216.58.219.10:8090

...and it gives me this:

# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             10.10.10.10       tcp
dpt:8089 to:216.58.219.10:8090

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

... and it doesn't work.

I see neither traffic to 10.x or to 216.x with tcpdump on the host in
DC2 where I'm trying to rewrite.

A side question: is there a way for me to see how traffic moves
between/through chains?

Any pointers are greatly appreciated.

Thanks,
Alex.
