From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Fwd: IPTABLES and SAMBA behind NAT
Date: Wed, 28 May 2008 19:22:11 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805281920400.19264@fbirervta.pbzchgretzou.qr>
References: <3f88e2aa0805280226l3a229469lbff78c20cbd3d9f6@mail.gmail.com>  <3f88e2aa0805280227y5a88d899n365fa4d6c24d8cb1@mail.gmail.com>  <alpine.LNX.1.10.0805281351290.1470@fbirervta.pbzchgretzou.qr>
 <3f88e2aa0805280544h591fcde5x4d9f098fac91220c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3f88e2aa0805280544h591fcde5x4d9f098fac91220c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ad marginem <admarginem@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-05-28 14:44, ad marginem wrote:

>Sorry for broad description. I mean, that when I try to telnet from
>external network to port 139 - I cannot.

That is because 

>I have added to script: $IPTABLES -t nat -A PREROUTING -p tcp -i
>$IF_EXT -d $NT_EXT --dport 7139 -j DNAT --to 192.168.1.3:139
>and tried to connect to port 7139 - it worked.

In case of Windows 2003, it probably suffices to forward
445, without having to expose 137-139.
