From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 19:38:52 -0500
Message-ID: <480E851C.9090901@riverviewtech.net>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E1752.2040308@solutti.com.br> <480E4596.9030000@riverviewtech.net> <480E49CF.1040405@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E49CF.1040405@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/22/2008 3:25 PM, Leonardo Rodrigues Magalh=E3es wrote:
> have you tried getting a new bridge device and bridging eth0 and lo0=20
> ??? i have never tried that, in fact never used bridge on linux. But =
i=20
> got this idea ..... if it works, it will probably meet your needs.

No I have not tried this.  Granted, this may get traffic in to the=20
loopback interface, it will very likely still be going to the wrong=20
address, at least if EBTables can not NAT it.

However this still leaves a lot of things to be desired compared to=20
DNATing traffic originally destined to the ether interface in to the=20
loopback interface.

(Again, this is just a theoretical discussion and as such I can not=20
readily test things at the moment.)



Grant. . . .
