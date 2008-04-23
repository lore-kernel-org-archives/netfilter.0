From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 16:42:10 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F49BE.60600@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: Yves DUF <yves.duf@gmail.com>, ML netfilter <netfilter@vger.kernel.org>


On Wednesday 2008-04-23 16:37, Leonardo Rodrigues Magalh=C3=A3es wrote:
> Yves DUF escreveu:
>> I think that iptables on the GNU/Linux FTP server would be a good
>> solution, to do a sort of "ftp contracking". But I don't manage to
>> write a simple rule as "All traffic that comes from ethX will output
>> by ethX"
>> Does somebody got ideas on this subject (iptables or whatever else)?
>>
>>  =20
>   This is not iptables related, this is ROUTING related.
>
>   iptables does not route packages.

apt/smart routes packages :p
