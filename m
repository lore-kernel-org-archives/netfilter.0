From: Robert Steinmetz <rob@steinmetznet.com>
Subject: IPTables ISP Open Port Notices
Date: Wed, 1 Jun 2022 12:30:41 -0400
Message-ID: <eb720ea4-1d97-8eb7-0529-1d0d8ed6473c@steinmetznet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; bh=2Ywf/IouRSl+gNYoIpnCmrtLTAoFdt/aCFKTMa
 au2BE=; c=relaxed/relaxed; d=earthlink.net; h=from:reply-to:subject:
 date:to:cc:resent-date:resent-from:resent-to:resent-cc:in-reply-to:
 references:list-id:list-help:list-unsubscribe:list-subscribe:list-post:
 list-owner:list-archive; q=dns/txt; s=dk12062016; t=1654101043;
 x=1654705843; b=FC603c56M3cTm6MCTsRjFVUV9NZjW5n4PFx+/3ozk6OuivZRFtWGBjK
 yzbKNtkqGtUPcMYcPZNCUGjRL/0a5nvt6lS1VRACkWAif19vYvAY1Lka2U69jKiBuWgo8M0
 eLkiYmE+xDp7LAML78kJxHEkYpjAJULEbVB31uz0MQOavPIBpME7Ad84V1fTyZechp6kTeZ
 p8Pl8FOZXAYmtSpX+ru3vSb3AyHrKFLbvVDz7HO9AyXIDdu+zMqk2SuTQYCK+RaT5rtQVQk
 0oEoI5pTIeK4R6kQjPEsJuYJ1kHYr82MEwkiy9t5OQ+Gc9Rr8QDpUpio5jjsE/f6UFucD34
 5Yg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

I keep getting notices from my ISP (ATT) that I have an open port. I've=20
tried to block it and nothing seems to satisfy them. So far I'm not=20
detecting any traffic on that port, but in an abundance of caution I'm=20
reluctant to post too much information. So I'll try to describe what is=20
going on.

I have a computer running Ubuntu 18.04.6 LTS (GNU/Linux=20
4.4.0-109-generic i686) using Iptables to do address mapping to my block=20
of static IP addresses. I am also running fail2ban, this appears to be=20
running as expected.

In the routing section I have pairs of statements doing the Address=20
Translation, one pair for each ip address

-A PREROUTING -d aa.bb.cc.12/32 -j DNAT --to-destination 192.168.1.29
-A POSTROUTING -s 192.168.1.29/32 -j SNAT --to-source aa.bb.cc.12
-A POSTROUTING -o enp1s0 -j MASQUERADE

I have other ports I have blocked which seem to work. In fact I got=20
similar notices for those ports and added a INPUT and OUTPUT statement=20
for each port, both tcp and udp both general and for a specific IP=20
address ranges.

-A INPUT -p udp -m udp --dport <port> -j DROP
-A INPUT -p udp -m udp --dport <port> -j DROP
-A OUTPUT -p tcp -m tcp --dport <port> -j DROP
-A OUTPUT -p udp -m udp --dport <port> -j DROP

-A INPUT -s aa.bb.cc.8/29 -p tcp -m tcp --dport <port> -j DROP
-A INPUT -s aa.bb.cc.8/29 -p udp -m udp --dport <port> -j DROP
-A OUTPUT -s aa.bb.cc.8/29 -p udp -m udp --dport <port> -j DROP
-A OUTPUT -s aa.bb.cc.8/29 -p tcp -m tcp --dport <port> -j DROP

The notice I get from my ISP says the port is a udp port for a Windows=20
service on a Windows server (the only one we have.
 =C2=A0With my limited understanding of IP tables this seems like it should=
=20
work, but apparently it's not.

I guess I could add an INPUT and OUTPUT statement for the specific IP=20
address, something like this:

-A INPUT -s aa.bb.cc.9/32 -p udp -m udp --dport <port> -j DROP
-A OUTPUT -s aa.bb.cc.9/32 -p udp -m udp --dport <port> -j DROP

--=20
Robert Steinmetz, AIA
Principal
Steinmetz & Associates
Signature
