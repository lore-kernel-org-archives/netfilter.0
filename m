From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 02 Nov 2010 10:55:42 +0100
Message-ID: <4CCFE01E.6070205@plouf.fr.eu.org>
References: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex <mysqlstudent@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Alex a =E9crit :
>=20
> I've set up a few basic rules to throttle SMTP traffic from an
> individual host should they make more than 10 connections in ten
> seconds:
>=20
> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m r=
ecent --set
> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
> recent --update --seconds 10 --hitcount 10 -j LOG
> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
> recent --update --seconds 10 --hitcount 10 -j DROP
>=20
> Is this the correct way to do this? I notice the seconds value can't
> be any greater than 20. What is the reason for this?

--seconds or --hitcount ? The --hitcount value cannot be greater that
the ip_pkt_list_tot parameter of the ipt_recent/xt_recent kernel module
(otherwise it would never match), and the parameter default value is 20=
=2E
See the iptables man page for details.
