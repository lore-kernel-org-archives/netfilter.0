From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Load Balance
Date: Tue, 17 May 2011 17:06:05 -0300
Message-ID: <BANLkTini_riVbMGu-14CRxgDbJeA8KTc9A@mail.gmail.com>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
	<1305480225.1708.2.camel@andybev>
	<BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>
	<1305581912.2041.15.camel@andybev-desktop>
	<4DD1C539.20404@riverviewtech.net>
	<BANLkTi=gB609MZNzuJ-277B23wCiB5EhOQ@mail.gmail.com>
	<4DD2B974.7060105@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD2B974.7060105@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thank for everyone!!

until next issue









2011/5/17 Grant Taylor <gtaylor@riverviewtech.net>:
> On 05/17/11 12:00, Usu=E1rio do Sistema wrote:
>>
>> but I still wonder what is the metric used to do the load balance I
>> guess that the point is in line below
>
> (I'd have to go back and re-read to know for sure what the "metric" i=
s that
> you are referring to and how it effects things.)
>
>> iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
>> statistic --mode nth --every 2 --packet 0 -j CONNMARK1
>> iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
>> statistic --mode nth --every 2 --packet 1 -j CONNMARK2
>>
>> I understand that each =A0two new connections the third go out to ne=
xt
>> link making the load balance.
>>
>> right ??
>
> In (basic) theory, yes.
>
> If we limit the scope to be just new connections (that will match the=
 above
> rules), yes, they will alternate between the connections (via marks) =
thus
> hypothetically equalizing the load on the connections.
>
> The thing that this does not take in to account is what type of traff=
ic a
> given connection is nor how long lived and active it is.
>
> Let's say that I have the following (new) connections in the followin=
g
> sequence.
>
> =A01) =A0Simple SMTP test email.
> =A02) =A0HTTP download of kernel source.
> =A03) =A0Simple DNS query.
> =A04) =A0VPN connection.
>
> You will find that connections #1 and #3 are marked with CONNMARK1 an=
d that
> connections #2 and #4 are marked with CONNMARK2. =A0So what you end u=
p with is
> two very ""light connections on CONNMARK1 and two much heavier connec=
tions
> on CONNMARK2.
>
> The connections did end up "load balanced" (in a manner of speaking),=
 or
> "distributed" (is probably a better way to describe it) across the mu=
ltiple
> CONNMARKs. =A0However, if you look at the utilization of the two CONN=
MARKs or
> the physical connections they represent, you will find that one is wa=
y under
> utilized and the other is probably saturated.
>
> However, with out doing some relatively nasty things (i.e. spoofing w=
hich
> requires support upstream) there is little that you can do about this=
=2E
>
> So, you do end up distributing the connections, but not necessarily l=
oad
> balancing.
>
>> thank!
>
> You are welcome.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
