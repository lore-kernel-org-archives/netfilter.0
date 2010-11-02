From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 2 Nov 2010 12:01:02 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011021159300.11991@obet.zrqbmnf.qr>
References: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com> <4CCFE01E.6070205@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CCFE01E.6070205@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Alex <mysqlstudent@gmail.com>, netfilter@vger.kernel.org

On Tuesday 2010-11-02 10:55, Pascal Hambourg wrote:

>Hello,
>
>Alex a =C3=A9crit :
>>=20
>> I've set up a few basic rules to throttle SMTP traffic from an
>> individual host should they make more than 10 connections in ten
>> seconds:
>>=20
>> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m =
recent --set
>> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
>> recent --update --seconds 10 --hitcount 10 -j LOG
>> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
>> recent --update --seconds 10 --hitcount 10 -j DROP
>>=20
>> Is this the correct way to do this? I notice the seconds value can't
>> be any greater than 20. What is the reason for this?
>
>--seconds or --hitcount ? The --hitcount value cannot be greater that
>the ip_pkt_list_tot parameter of the ipt_recent/xt_recent kernel modul=
e
>(otherwise it would never match), and the parameter default value is 2=
0.
>See the iptables man page for details.

And on newer kernels (>=3D 2.6.34), this is also communicated through a=
=20
line in dmesg.

