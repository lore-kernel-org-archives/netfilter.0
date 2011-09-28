From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip accounting with centos 6
Date: Wed, 28 Sep 2011 14:28:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109281426130.32661@frira.zrqbmnf.qr>
References: <509ABFBD82E8B740BC211E8B93E28F71B2475F5A55@server2.dsi.intra>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <509ABFBD82E8B740BC211E8B93E28F71B2475F5A55@server2.dsi.intra>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?DSI=2ENET_-_Arvid_Z=C3=B6bisch?= <zoebisch@dsi.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2011-09-28 12:06, DSI.NET - Arvid Z=C3=B6bisch wrote:

>Hi there.=20
>
>I have a problem on a centos 6 server running KVM. I want to account t=
raffic
>per IP. I am using the same rules on an Ubuntu 10.04 LTS-Server where =
my
>accounting is working. These are my rules:

I challenge above's statements #3 and #4.

>iptables -N INET_OUT
>iptables -N INET_IN
>iptables -A FORWARD -j INET_IN
>iptables -A FORWARD -j INET_OUT
>
>/sbin/iptables -A INET_OUT -s x.x.x.x
>/sbin/iptables -A INET_IN -s 0.0.0.0/0 -d x.x.x.x
>
>Kernel is 2.6.32.x86_64
>iptables is v 1.4.7
