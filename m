From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Disabling conntrack on an interface
Date: Thu, 02 Jul 2009 20:45:37 +0200
Message-ID: <4A4D0051.4040900@plouf.fr.eu.org>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>	 <1246548394.17132.19.camel@enterprise.ims-firmen.de> <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d1f9a6b0907020906g207b273fr125cc75d022db638@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Terry Burton a =E9crit :
>
> As soon as I bind the (unaddressed) interface into the bridge the
> packets are conntracked.

This is because by default bridged IPv4 traffic is passed to iptables.=20
So another method is to set /proc/sys/net/bridge/bridge-nf-call-iptable=
s=20
to 0 to disable this.
