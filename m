From: Brian Bostwick <bostwick.brian@gmail.com>
Subject: dnat port range to single port, udp, between two local machines on a LAN
Date: Tue, 31 Jan 2017 11:28:18 -0500
Message-ID: <CAM9he-WxJmUh53geOrRDAXuGCHQ7AxQ=0i7PgvVWxtNPryA_bg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ZM7s/OqfhD+i0YO2D5WAOrfW1GDUfrJIa9/kqYipMUE=;
        b=OnTZ1ffE0R2lZRY35lGoyHnNkXg9IzUxn42fk67ezNtGlzFQs82p1w/u7NmHLDt6EJ
         Roa20g+rdXh0avZb7FblC3sehQSzOUUBW3iUOnaMTThS2cJ7IhxO/E+ope66u9YbBzxj
         7QRu787nqUHieIHkBxw5b1T43UZFJ71jQSdn9FKS4ETFsdrtkxz3WdKhEfajoaO47LGu
         Fvk9iDpMtHwiW65JBWvscGkWannx3YRHo9RobDoV3GTw8Sfhtn+D+aXuf6LiKeRnLMe1
         f8k+EbKBNgEOZ1enpA6Wami8JD7tszgmcCHwP8DI/pHG/SJw9REsUC67WobPseLJsCbC
         tdpg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi, I am running DD WRT and trying to use iptables to change the
destination port based on a port range used by the source connection.
I am not very well versed with this tool, but have had success doing
similar things, but not using a port range and over TCP.

I am using two rules, after scourging the internet for help. The
answer I found says that I can do DNAT in the PREROUTING, but I have
to have an SNAT rule in the POSTROUTING back to the source IP.

Here are my two rules:

iptables -t nat -A PREROUTING -p udp --dport 45000:65000 -j DNAT
--to-destination 192.168.1.131:5000

iptables -t nat -A POSTROUTING -p udp -d 192.168.1.131 --dport
45000:65000 -j SNAT --to-source 192.168.1.122

I don't think the second one makes sense, because I believe I would
need to specify the exact destination port (original source port),
which I do not have because it is a rule based off a range.

In Wireshark, I see no change:

142243 1078.651017 192.168.1.122 192.168.1.131 UDP 144 9296 =E2=86=92 55900=
 Len=3D102

I hopes this makes sense. Basically, I would like to change the
destination port going from A to B, where the originating packet will
be on a port range and UDP. Is this possible between two local
machines behind the same router?

Thanks!
