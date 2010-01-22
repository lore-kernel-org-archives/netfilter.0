From: "J. Bakshi" <joydeep@infoservices.in>
Subject: limit module not working with drop policy
Date: Fri, 22 Jan 2010 08:54:41 +0530
Message-ID: <4B591A79.2030600@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Dear list,

My firewall policy is default drop.  But the limit module is not workin=
g
here. I have the following rules to defeat ping flood

``````````
iptables -A INPUT  -p icmp -m limit --limit 3/minute -j ACCEPT
iptables -A INPUT  -p icmp -j DROP
``````````````````
and it is not working. The same rule set is working with default accept
policy.  What modification should I need to make it working with drop
policy firewall ?

Thanks



--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

