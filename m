From: Mike Dillinger <miked@softtalker.com>
Subject: nftables NAT & Gaming Consoles
Date: Sun, 10 May 2020 14:19:03 -0700
Message-ID: <7f0d599d-8eaa-74ef-37ff-8c56c0ae126b@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I tried to research this on the Internet, even using iptables, and I couldn=
't find anything conclusive so I thought I'd ask here.=A0 There are conflic=
ting reports regarding if this will work or not.

We have recently acquired a second Xbox and they will need to co-exist behi=
nd our nftables firewall.=A0 We have an IPv4 setup on both sides (ISP/WAN, =
LAN) using NAT.=A0 If both consoles are up and running at the same time, we=
 need a way for NAT'd traffic to be routed to the proper console.

If I were to take a guess, I'm going to assume I need to mark packets using=
 the nftables meta command, but I'm not sure.=A0 I am assuming a generic NA=
T setup will not work for both consoles.

If I could get a starter example, I think I can take it from there. I can e=
ven take a working iptables example and migrate it to nftables using iptabl=
es-translate.

Thanks a lot!
-MikeD
