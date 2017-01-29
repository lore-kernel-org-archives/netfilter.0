From: deva seetharam <deva.seetharam@gmail.com>
Subject: ssh tunnels and iptables
Date: Sun, 29 Jan 2017 20:57:35 +0530
Message-ID: <CAGU6BDkW2C3JvsryWFzZT02MUZfOA6woZjB9NZqnQnJf_7ViQA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=2vRhoQyxdbQJy9MEj+0wQfZbqYMspTpLY4IPyWimx7Q=;
        b=h2TgBKQC0b9TJD0TR/AXYrtzPGeYod6WwJ85D7SkzCgag3NQYTtqtrl0hvkUqXa2JH
         Hfom9PB6hgIaH6zmw6lstBvqXXIXbO7kI06c3K9KRfjmdFrZOIKo36L7hNOdhasgxyao
         AHRB+SSmxTGvRoPDec4UvW1WYu83iKRWNBEOYCE91FT72rwjYoWcd+hh9m8ckrp+0TAW
         ZBKwy7D6Cu3mLrCQ2oJDAOj6RalKK7R8S3c5sB9xFX/Bk6RaEC7UCwy9aBtET2q2ocD/
         SPFCZ6rUzX3p15rVEk4kVeKK/Ozf43N8i2Q+xozZXG7ia9P7JM3RRtsuLJ/3DJc5moLj
         RlgQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have setup a reverse ssh tunnel using the following command between
a Linux laptop and a remote server:

    ssh -4nNT -R 2222:localhost:22 somehost.com
That is, the laptop, which is behind a firewall, can be accessed over
ssh using the following command:

    ssh -p 2222 -l joe somehost.com

on sshd_config of somehost.com, i have enabled Gatewayports=yes.

I am glad to say all these work fine. However, one thing beats me:
there is an `iptables` running on somehost.com that does NOT have the
port 2222 opened. In spite of this tunnel works, how is that possible?
how does iptables handle gateway ports of ssh? could anyone kindly
explain? thanks in advance.

here is the output of iptables -L:

      target     prot opt source               destination

      ACCEPT     icmp --  anywhere             anywhere
icmp destination-unreachable
      ACCEPT     icmp --  anywhere             anywhere
icmp time-exceeded
      ACCEPT     icmp --  anywhere             anywhere
icmp echo-request
      ACCEPT     icmp --  anywhere             anywhere
icmp echo-reply
      DROP       tcp  -f  anywhere             anywhere
      DROP       tcp  --  anywhere             anywhere
tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
      DROP       tcp  --  anywhere             anywhere
tcp flags:FIN,SYN,RST,PSH,ACK,URG/NONE
      DROP       tcp  --  anywhere             anywhere
tcp flags:FIN,SYN/FIN,SYN
      DROP       tcp  --  anywhere             anywhere
tcp flags:FIN,ACK/FIN
      DROP       tcp  --  anywhere             anywhere
tcp flags:SYN,RST/SYN,RST
      DROP       tcp  --  anywhere             anywhere
tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
      DROP       udp  --  anywhere             anywhere
udp spt:bootps dpt:bootpc
      DROP       tcp  --  anywhere             anywhere
tcp dpt:kazaa
      DROP       udp  --  anywhere             anywhere
udp dpt:kazaa
      LOG        tcp  --  anywhere             somehost.com  tcp
dpt:ssh state NEW LOG level warning tcp-options ip-options prefix
"firewall-> ssh1: "
      ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:ssh
      LOG        tcp  --  anywhere             somehost.com  tcp
dpt:2023 state NEW LOG level warning tcp-options ip-options prefix
"firewall-> Check: "
      ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:2023
      LOG        tcp  --  anywhere             somehost.com  tcp
dpt:http state NEW LOG level warning tcp-options ip-options prefix
"firewall-> HTTP: "
      ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:http
      LOG        tcp  --  anywhere             somehost.com  tcp
dpt:https state NEW LOG level warning tcp-options ip-options prefix
"firewall-> HTTPS: "
      ACCEPT     tcp  --  anywhere             somehost.com  tcp dpt:https

      Chain FORWARD (policy ACCEPT)
      target     prot opt source               destination

      Chain OUTPUT (policy ACCEPT)
      target     prot opt source               destination
      ACCEPT     tcp  --  anywhere             anywhere             tcp spt:http


-- 
best regards,
Deva P. Seetharam
