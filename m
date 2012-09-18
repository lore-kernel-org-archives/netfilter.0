From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Block Facebook with Layer7
Date: Tue, 18 Sep 2012 07:32:24 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1209180731540.1837@nerf07.vanv.qr>
References: <CAMTjHrwPuUTra2hHqP8oq3=SDVi_K_nAE4cjcGsaANL_ge63cA@mail.gmail.com> <47e26662c03e90efdd07a69583376777@linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47e26662c03e90efdd07a69583376777@linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Julien Vehent <julien@linuxwall.info>
Cc: =?UTF-8?Q?Usu=C3=A1rio_do_Sistema?= <maiconlp@ig.com.br>, Mail List - Netfilter <netfilter@vger.kernel.org>

On Tuesday 2012-09-18 03:54, Julien Vehent wrote:

> On 2012-09-17 18:30, Usu=C3=A1rio do Sistema wrote:
>> Hello everyone,
>>
>> it's possible to drop traffic to facebook with iptables Layer7 ? I
>> have done some test with Squid but I found some difficult because I'=
m
>> using Transparent Proxy so maybe it been  more easy to drop with
>> iptables layer7.
>>
>> any tips is welcome......as well as some how to....
>>
>>
>
> iptables -t filter -I FORWARD -p tcp --dport 80 -m string --string "h=
ost:
> facebook.com" --icase --algo bm -j DROP
>
> Of course, this won't work with HTTPS connections.

And easily kills the connection whenever there's "host: facebook.com" i=
n=20
the payload. Like... this mail, when read through a web archive.
