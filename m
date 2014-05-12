From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Losing connection between nat and filter tables
Date: Tue, 13 May 2014 00:40:49 +0200
Message-ID: <53714DF1.70407@plouf.fr.eu.org>
References: <536CECA8.1000604@riosoft.com.br>	<CAEzD07JLeCTxUT_rR3H6QDv6_jVH2mFH1q8B2T4EvtJsDGqF1g@mail.gmail.com>	<536CFE75.90005@riosoft.com.br> <CAEzD07LqPgQiftaS6831c2-7Kw0XM=3i84+4WX6XN2GSX0k6Qw@mail.gmail.com> <536D3E84.5020102@riosoft.com.br> <536D4983.8040105@chello.at> <536D7375.9090909@riosoft.com.br> <536E602E.5070103@plouf.fr.eu.org> <5370CAA5.1010805@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5370CAA5.1010805@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Bruno de Paula Larini a =E9crit :
> yes, the two interfaces are in the same network, but it's a limitatio=
n=20
> that our ISP imposes to us, as we have a limited range of public IPs =
in=20
> only one /28 subnet. The objective this "messy" configuration is that=
=20
> two different groups of users have access to different FTP sites with=
out=20
> having to set a non default port.

But why did you connect two interfaces to the same network ? If you nee=
d
two public IP adresses on the box, couldn't you just assign them to the
same interface ?

> Would you do that in a different way?

If possible, I would assign the two public IP addresses to the same
interface. And I would also assign two private addresses to the
(interface of the) final server. Then I would setup two FTP server
instances to listen on one different private address and port 21 each,
and DNAT each public IP address to the corresponding private address.
This way you would not need to mangle the FTP ports.

