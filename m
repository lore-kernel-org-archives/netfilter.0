From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: come back the traffic on same interface which it input
Date: Wed, 15 Jun 2011 21:37:48 -0300
Message-ID: <BANLkTim0i-TpYxWQNRrEe4mdXyED4kZVdQ@mail.gmail.com>
References: <BANLkTimf7nTztsuo2ov1QuUN=ACKHsBsvw@mail.gmail.com>
	<1308164291.32634.26.camel@lt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1308164291.32634.26.camel@lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steven Kath <steven.kath@vyatta.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thank you Steven, it's working as your as below

Em 15 de junho de 2011 15:58, Steven Kath <steven.kath@vyatta.com> escr=
eveu:
> On Tue, 2011-06-14 at 23:31 -0300, Usu=E1rio do Sistema wrote:
>> hello everyone, I have two ISPs in my firewall that are ADSLs lines.=
 I
>> wish that all trafic input in wan1 ( ISP1 ) come back on it. but thi=
s
>> isn't happening because the firewall gateway is ISP2 ( wan2 ) so all
>> input traffic by ISP1 ( wan1 ) doesn't work because the firewall
>> forwards all traffic as it as your gateway wich is ISP2
>>
>> for exemplo, I have a http service on this firewall and when I attem=
pt
>> =A0access it from Internet doesn't work because it's on my ISP1.
>>
>> how I can do for all input traffic on wan1 come back on it and not o=
n
>> wan2 wich is the firewall gateway ??
>>
>> any tips are welcome
>
> Here is a good start for a simple implementation:
>
> http://lartc.org/howto/lartc.rpdb.multiple-links.html
>
> If you need to be more selective, you can use iptables markings to ge=
t
> finer control:
>
> http://linux-ip.net/html/adv-multi-internet.html
>
>
>
