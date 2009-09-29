From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: SSH Port Forwarding with iptables
Date: Tue, 29 Sep 2009 19:00:43 +0200
Message-ID: <4AC23D3B.6050705@freemail.hu>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>	 <4AC232F2.6050401@freemail.hu> <a0017e7e0909290941h38aeafd3hda04418654bee004@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a0017e7e0909290941h38aeafd3hda04418654bee004@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bill Hendrickson <wjhendrickson@gmail.com>
Cc: netfilter@vger.kernel.org

Bill Hendrickson =EDrta:
> Swifty,
> You nailed it - thanks!  I needed to do both things (set the default
> gw on internal server and use the rule).  Re: my other post, which is
> the better way to go, in your opinion - FORWARDing or MASQUERADing?
>  =20
Your welcome! :D

=46ORWARD is the chain...
MASQUERADING is a techique...
But to answer your question:
You are FORWARDing packets to and from your internal/external networks=20
on the firewall/gateway.
If you have fix external IP then you should SNAT every packet that=20
leaves your network.
If you have dynamic IP then you should MASQUERADE.
Your first attempt was unsuccessful because the external client expecte=
d=20
the packets from the gateway and not from an "internal" unknown IP.

As of the manual:

   MASQUERADE
       This target is only valid in the nat table, in the POSTROUTING=20
chain.  It should only be used with dynamically assigned IP (dialup)=20
connections: if you have a static IP
       address,  you  should  use the SNAT target.  Masquerading is=20
equivalent to specifying a mapping to the IP address of the interface=20
the packet is going out, but also has
       the effect that connections are forgotten when the interface goe=
s=20
down.  This is the correct behavior when the next dialup  is  unlikely =
=20
to  have  the  same  interface
       address (and hence any established connections are lost anyway).

Swifty

