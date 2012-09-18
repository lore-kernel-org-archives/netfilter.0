From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Block Facebook with Layer7
Date: Mon, 17 Sep 2012 23:53:47 -0300
Message-ID: <CAMTjHryLgyApzBrUex08hNnXZpX5wuHceq=3bU0r1QwWFZrvoA@mail.gmail.com>
References: <CAMTjHrwPuUTra2hHqP8oq3=SDVi_K_nAE4cjcGsaANL_ge63cA@mail.gmail.com>
	<47e26662c03e90efdd07a69583376777@linuxwall.info>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47e26662c03e90efdd07a69583376777@linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Julien Vehent <julien@linuxwall.info>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi, thank you Julien.

iptables -t filter -I FORWARD -p tcp --dport 80 -m string --string "hos=
t:
facebook.com" --icase --algo bm -j DROP

Of course, this won't work with HTTPS connections.

sorry, but to work with HTTPS just add an new rule with --dport 443 rig=
ht ??








2012/9/17 Julien Vehent <julien@linuxwall.info>:
> On 2012-09-17 18:30, Usu=E1rio do Sistema wrote:
>>
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
>
> --
> Julien Vehent - http://jve.linuxwall.info
