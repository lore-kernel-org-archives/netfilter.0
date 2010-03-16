From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: udplite and ports
Date: Tue, 16 Mar 2010 12:28:09 +0100
Message-ID: <4B9F6B49.9060805@plouf.fr.eu.org>
References: <4B9B568F.7020609@chello.at> <4B9F3478.60702@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B9F3478.60702@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Hello,

Mart Frauenlob a =E9crit :
>>
>> what am I missing, why is that command not working:
>>
>> iptables -A INPUT -i eth2 -p udplite --destination-port 123 -j ACCEP=
T
>> iptables v1.4.7: unknown option `--destination-port'
>> Try `iptables -h' or 'iptables --help' for more information.
[...]
>> -p udplite -m multiport --ports 123,124 ... works.

According to changelogs, support for UDPLITE in multiport was added in
iptables 1.3.8 (the man page does not seem to have been updated though)=
=2E

> I would have expect it to work like -p udp. Am I wrong?
> But there's no libxt_udplite.so.

--dport is an option of some "-m <protocol>" matches (implicit with "-p
<protocol>") such as tcp, udp, sctp, dccp handled by libxt_<protocol>.s=
o
libraries. As you pointed out, there is no libxt_udplite.so, so no "-m
udplite" match nor --dport option for UDPLITE.
