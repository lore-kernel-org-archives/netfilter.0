From: Dmitry <onyx@z-up.ru>
Subject: NAT to multiple ranges
Date: Tue, 27 Jun 2023 23:21:24 +0300
Message-ID: <5fc45938-1c10-a5fd-bf3d-0d358bbd02eb@z-up.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello!

I have lan network like 10.10.0.0/16 and two sets of external addresses=20
like 1.1.1.0/24 and 2.2.2.0/24. How to perform nat to use all my=20
external addresses? Now i have rules like

add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.10.0.0/16=20
counter snat to 1.1.1.0-1.1.1.255 persistent

add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.10.0.0/16=20
counter snat to 2.2.2.1-2.2.2.255 persistent

But,as expected, only first rule works. I need something like this:

add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.10.0.0/16=20
counter snat to 1.1.1.0-1.1.1.255,2.2.2.1-2.2.2.255 persistent

But it is not supported.

Also, i've tried to use names sets like this:

add set ip nat ext_addr {type ipv4_addr;=C2=A0 flags interval;=20
elements=3D{1.1.1.0-1.1.1.255,2.2.2.1-2.2.2.255} ;}

But

nft 'add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.178.0.0/16=20
counter snat to @ext_addr persistent'
Error: unknown raw payload base
add rule ip nat POSTROUTING oifname "vlan3" ip saddr 10.178.0.0/16=20
counter snat to @ext_addr persistent


With all respect!

