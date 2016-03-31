From: "Perol.Chen" <perol.chen@gmail.com>
Subject: Split traffic between VPN and local interface
Date: Thu, 31 Mar 2016 13:32:11 +0800
Message-ID: <CAL6-xCbC6gDCYMZ9KhctcGRQ=6kQZL2oZGNEV6NT9NQRO44BUQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=m9eVUvC5PMrBgZPsvdK0hfD0gXv7V9iTWJRr8c7tSc4=;
        b=r19iSDbngQULiTis7czE+GVTuqc3SC8Ls4bGcrwNgn7Z4Z6t8D41U5/Z44m5w754Zj
         BpP/sEPOFdN6TL1XKVv6ZEK5/InxoT6SFRUKed6agmZ3ZwT+4iriyPtvaW9fD+feokaF
         1PhRgamMuVh4rog/prPW3az0zxxLLyY5yuNfmopvPj4w6WzSkNb/1PdiM6P1RlQ9OyAN
         kFKL0aShyDDmXxvvxeYuDIZJisiB3OAOYRSM4lFeJICraEgy/J+yMoSSh/JXoMYW+hIi
         cXQuGjXF5aVB2N4eb+Ewaf6SeFJVfM9RWogwZJ3gGtuychWfir2IGGeSgomLFEicHn8q
         P5NQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear all:

I start one vpn client on my computer, but I want my country's traffic
direct from local interface,

because the ip list is large, so I save them to ipset named chinaip.

I use commands below split the traffic, 192.168.1.1 is local interface
gateway, 10.7.0.2 is the vpn tun ip.


id="11"
ip rule add fwmark $id lookup $id
ip route add default via 192.168.1.1 table $id
iptables -t mangle -I OUTPUT 1 -m set --match-set chinaip dst -j MARK
--set-mark $id
iptables -t nat -A POSTROUTING -s 10.7.0.2 -o eth0 -j MASQUERADE


wireshark show the traffic send to eth0, but the local process can not
receive data.

128    5.583482000    192.168.1.118    180.149.134.141    TCP    74
33474 > http [SYN] Seq=0 Win=27840 Len=0 MSS=1392 SACK_PERM=1
TSval=17843425 TSecr=0 WS=128

129    5.586962000    180.149.134.141    192.168.1.118    TCP    66
http > 33474 [SYN, ACK] Seq=0 Ack=1 Win=14600 Len=0 MSS=1448
SACK_PERM=1 WS=128

249    6.332233000    192.168.1.118    180.149.134.141    TCP    74
[TCP Retransmission] 33473 > http [SYN] Seq=0 Win=27840 Len=0 MSS=1392
SACK_PERM=1 TSval=17843613 TSecr=0 WS=128

250    6.335188000    180.149.134.141    192.168.1.118    TCP    66
[TCP Retransmission] http > 33473 [SYN, ACK] Seq=0 Ack=1 Win=14600
Len=0 MSS=1448 SACK_PERM=1 WS=128

There are all TCP Retransmission, Are there something problems?

Thanks very much.
