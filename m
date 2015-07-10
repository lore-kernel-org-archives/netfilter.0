From: Donald Schlicht <dschlic1@gmail.com>
Subject: Help with routing ping requests
Date: Fri, 10 Jul 2015 18:07:23 -0400
Message-ID: <14e7a023590.279f.a66e0210b6f036863bfeb88685b7aa6c@gmail.com>
References: <14e79fd9210.279f.a66e0210b6f036863bfeb88685b7aa6c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:date:message-id:in-reply-to:user-agent:subject:mime-version
         :content-type:content-transfer-encoding;
        bh=yJAuaB1ljYEQ3o813GgYrQ69dTRsWV5b0Xbn67xa3t8=;
        b=TXYCDC++aV5JzK4e1H3Vra4fZtQ0YruNhXF3HDoQ/hEToBcyD9Z43xAh3oDvMaFaJW
         iqXDftgKrzuJsVXB5LFZmCYAWx3KmAkmtd8AhWhLfen0GxXXqTvPQ9/60aK9krUu6KxI
         X+evAPmnoJmXcAPGAAHGUgQUCObYeaEZJCTbcWJSiMPeKb2H5q8WJLM0AMZgBrm+buYQ
         /K02gSbLP4K4ua5pUjQSNe5rTTnFGnrkYrnD8LsncjqhPxa369VUCjKvRwGSecBSW+Fs
         2pTLV3Fvt25/fv7mXvUFUyLCLvAu/GWof18eQBK197r1MecpsyIWqKI0Lo+eNMSFVXZH
         6efg==
In-Reply-To: <14e79fd9210.279f.a66e0210b6f036863bfeb88685b7aa6c@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

I have an application where I need to configure a router to pass throug=
h=20
ping requests (ICMP type 8) through to the LAN port. I have a Linksys=20
WRT54GS with tiny DD-WRT V24 SP2 installed. I am adding the following=20
iptables rules:=C2=A0

iptables -t nat -I PREROUTING -p icmp --icmp-type 8 -s 72.64.140.50 -j =
DNAT=20
--to-destination 192.168.1.200=C2=A0
iptables -t filter -I FORWARD -p icmp --icmp-type 8 -s 72.64.140.50 -d=20
192.168.1.200 -j ACCEPT
=C2=A0iptables -t nat -I POSTROUTING -p icmp --icmp-type 8 -s 72.64.140=
=2E50 -d=20
192.168.1.200 -j ACCEPT

=C2=A0The intent is that the first rule will change an incoming echo re=
quest=20
destination to the unit on the LAN which I want to receive the ping req=
uest.=C2=A0

The second rule allows the modified echo request to pass through the=20
=46ORWARD table.=C2=A0And the last one allows the modified echo request=
 to pass=20
through the POSTROUTING table.=C2=A0When I send a ping to the router wi=
th four=20
tries, I get no pings out the LAN. Using iptables -L -v -n I can see we=
re=20
rule #1 passes one packet (but not four), rule #2 passes four packets=20
(good!) and rule #3 passes 1 packet.=C2=A0At this point I am at loss as=
 to why=20
this is not working. Can someone help me out here?

Sent with AquaMail for Android
http://www.aqua-mail.com


