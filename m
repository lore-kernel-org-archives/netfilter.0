From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Access Interfaces Wan
Date: Fri, 30 Sep 2011 15:25:18 -0300
Message-ID: <CAMTjHrwM65DpLDsxy43K_AzUUA2TCivFbM_a5y6Z3mZ38uxcdA@mail.gmail.com>
References: <CAMTjHrznU95sGq-0e1CPYetKdXpzprHAo_E3q_R6NdfFFDrLpw@mail.gmail.com>
	<CAA2qdGXKDB13HGx3spq2NqqFEB5WfncMBqUVeCvd0D5QH1bRaw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGXKDB13HGx3spq2NqqFEB5WfncMBqUVeCvd0D5QH1bRaw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pandu Poluan <pandu@poluan.info>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Maybe been a problem inside of the firewall but I need sure that my
rules are right.



thanks





Em 30 de setembro de 2011 12:58, Pandu Poluan <pandu@poluan.info> escre=
veu:
>
> On Sep 30, 2011 8:52 PM, "Usu=E1rio do Sistema" <maiconlp@ig.com.br> =
wrote:
>>
>> Hello everyone,
>>
>>
>> I'm needing that my inside network accesses some IPs which are in th=
e
>> my firewall wan interfaces. for exemplo, in the firewall there is th=
e
>> IP 200.247.222.1 on the wan interface. those has a destination NAT t=
o
>> a inside network machine for FTP protocol. so from Internet to
>> ftp://200.247.222.1 it's Working! but from my inside network to
>> ftp://200.247.222.1 isn't Working.
>>
>> I've done some rules as follow:
>>
>>
>> iptables -t nat -I PREROUTING -s 128.2.0.0/24 -d 200.247.222.1 -p tc=
p
>> --dport 21 -j DNAT --to-destination =A0128.2.8.214
>>
>> iptables -t nat -I POSTROUTING -s 128.2.0.0/24 -d 200.247.222.1 -o
>> bond0 -j SNAT --to-source 128.2.7.16
>>
>
> I'm betting that this is the problem. After the packet has undergone =
DNAT in
> PREROUTING, the destination is no longer 200.247.222.1 but 128.2.8.21=
4, so
> the SNAT rule isn't triggered.
>
>> iptables -I FORWARD -s 128.2.0.0/24 -d 200.247.222.1 -j ACCEPT
>>
>
> Also add a rule to ACCEPT packets from 128.2.0.0 destined to 128.2.0.=
0.
>
> Rgds,
>
