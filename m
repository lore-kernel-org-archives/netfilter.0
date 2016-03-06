From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Rewriting target IP and port on Linux with iptables or firewall-cmd
Date: Sun, 06 Mar 2016 21:52:35 +0100
Message-ID: <56DC9893.1000108@plouf.fr.eu.org>
References: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com> <alpine.DEB.2.20.1603050130390.24095@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1603050130390.24095@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: Alex Barylo <abarylo@gmail.com>, netfilter@vger.kernel.org

> On Fri, 4 Mar 2016, Alex Barylo wrote:
>=20
>> I have a server in a DC1 with a private IP, of say 10.10.10.10. This
>> IP is NAT'd to a public IP, say 216.58.219.10 in this way:
>>
>> 216.58.219.10:8090 -> 10.10.10.10:8089
>>
>> I have a server in DC2 which knows about (and wants to connect to)
>> 10.10.10.10:8089 but doesn't know about 216.58.219.10:8090 (long
>> story).
>>
>> So I want to rewrite dest IP/port from 10.10.10.10:8089 to 216.58.21=
9.10:8090.
>>
>> This is what I tried:
>>
>> # sysctl net.ipv4.ip_forward=3D1
>> # iptables -t nat -A PREROUTING -p tcp --dest 10.10.10.10 --dport 80=
89
>> -j DNAT --to 216.58.219.10:8090

And what happened ?
On which machine did you run these commands ?
If it is on a machine acting as a gateway between the server in DC2 and
the server in DC1, then you are correct. If it is on the server in DC2,
then the sysctl is useless and the iptables rule should be added to the
OUTPUT chain (for locally-generated traffic) instead of PREROUTING (for
incoming traffic).

Sven-Haegar Koch a =E9crit :
> Try adding the same rule also to the nat OUTPUT chain.

Why "also" ? Rather "instead". Both rules on the same machine are usele=
ss.
