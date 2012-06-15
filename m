From: sreejith menon <sreejithjmenon@gmail.com>
Subject: Iptables Drop rule - strange behaviour
Date: Sat, 16 Jun 2012 00:31:15 +0530
Message-ID: <CACJKonpcSF2X2PPBZzg_ZuEO6FNvPQ6AQEH4nSQWf4natD36=w@mail.gmail.com>
References: <CACJKonoWuj1=He00eD7e9YENHXvwEY1Hmg6_Cjq5GeYT6DchoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=hCVDMJ01MDD4CJkU0KwXf77MLPfdrgFV6tQN4SSz1i8=;
        b=Ba+40xUsz9B8iki4g6UjYcwGYYFMceWv3hovSeM9qNxNMhd/x2OQtJTeU/jdgtjJmD
         EPALLNhVQJ+Qo8qPVN0Yg7FNVw2NZY7Ks2tDsT6DGO8cH/HUwwuXMhT+13k63l9A64sw
         lxMTIUu6RDo15wQyALyHbroNjELQRmJCQrfqm3vBWzoV9dmx1Uvtbu5h9Gmo2dBRCj3V
         4d728YZuLcDIA6nUtVBfPoUmLC8bdjYE1s+nRqdnvPXm/7jeSlKvnwEGPAdCtngcO2k8
         AWPR10Jei9deReTrcw0VfVcZWkjGGdTgGQZFP+Zcm/JauUfZbJ6uJ6sN/2wLmx7nBboy
         L37A==
In-Reply-To: <CACJKonoWuj1=He00eD7e9YENHXvwEY1Hmg6_Cjq5GeYT6DchoQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: sreejith j menon <sreeju_menon@rediffmail.com>

Hi,

I have the below setup for my firewall and i am using iptables 1.4.9.1 =
v


Client PC (eth0, 172.31.114.239)--------------(eth0 172.31.114.252)
=46irewall Router (eth1, 10.2.2.2)--------------------Network PC
(10.2.2.1)

I have set the default policy as accept for my testing purpose. My aim
is to prevent ssh from Client PC to Network PC. But allow ssh from
Network PC to Client PC.

I have the following iptables rule

iptables -nvL

Chain INPUT (policy ACCEPT 744 packets, 46652 bytes)

 pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=A0 =
source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 destination

 9989=A0 780K ACCEPT=A0=A0=A0=A0 all=A0 --=A0 *=A0=A0=A0=A0=A0 *=A0=A0=A0=
=A0=A0=A0=A00.0.0.0/0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 state RELATED,ESTABLISHED


 Chain FORWARD (policy ACCEPT 3 packets, 180 bytes)

 pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=A0 =
source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 destination

 =A0=A0 82 17854 ACCEPT=A0=A0=A0=A0 all=A0 --=A0 *=A0=A0=A0=A0=A0 *=A0=A0=
=A0=A0=A0=A0=A00.0.0.0/0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 state RELATED,ESTABLISHED

 =A0 =A011=A0=A0 660 DROP=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 *=A0=A0=A0=A0=A0=
 eth1=A0=A0=A0=A00.0.0.0/0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 source IP range 172.31.114.1-17=
2.31.114.254 tcp
spts:2:65535 dpt:22 destination IP range 10.2.2.1-10.2.2.254


 Chain OUTPUT (policy ACCEPT 1741 packets, 149K bytes)

 pkts bytes target=A0=A0=A0=A0 prot opt in=A0=A0=A0=A0 out=A0=A0=A0=A0 =
source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 destination
 =A0=A0=A0 0=A0 =A0=A0=A00 DROP=A0=A0=A0=A0=A0=A0 tcp=A0 --=A0 *=A0=A0=A0=
=A0=A0 eth1=A0=A0=A0=A00.0.0.0/0
0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 source IP range 172.31.114.1-17=
2.31.114.254 tcp
spt:22 dpts:2:65535 destination IP range 10.2.2.1-10.2.2.254

 Observations
 -------------------

1. Ssh from Network PC to client PC =A0--- ssh successful as expected
2. ssh from client pc to Network PC ---- ssh blocked as expected
3. =A0Again ssh from Network PC to client PC =A0--- ssh =A0blocked whic=
h was
not expected.
4. If i=A0randomly insert some rules which has no relevance to ssh, and
do step 1 alone again - ssh sucessful
5. =A0Again do step 2 followed by step -- ssh blocked ..problem.

 Please help or any idea will be very much appreciated

Also, noted that if i have a ssh rule to deny from client PC to
network PC. If i do ftp, it is fine. But if i do ssh followed by ftp,
ftp doesnt work. please note that default policy is accept all. I did
not add or delete rules in between.


thanks and regards
sreejith
