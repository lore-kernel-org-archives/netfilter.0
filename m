From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Load Balance
Date: Tue, 17 May 2011 13:07:48 -0500
Message-ID: <4DD2B974.7060105@riverviewtech.net>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>	<1305480225.1708.2.camel@andybev>	<BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>	<1305581912.2041.15.camel@andybev-desktop>	<4DD1C539.20404@riverviewtech.net> <BANLkTi=gB609MZNzuJ-277B23wCiB5EhOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=gB609MZNzuJ-277B23wCiB5EhOQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/17/11 12:00, Usu=E1rio do Sistema wrote:
> but I still wonder what is the metric used to do the load balance I
> guess that the point is in line below

(I'd have to go back and re-read to know for sure what the "metric" is=20
that you are referring to and how it effects things.)

> iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
> statistic --mode nth --every 2 --packet 0 -j CONNMARK1
> iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
> statistic --mode nth --every 2 --packet 1 -j CONNMARK2
>
> I understand that each  two new connections the third go out to next
> link making the load balance.
>
> right ??

In (basic) theory, yes.

If we limit the scope to be just new connections (that will match the=20
above rules), yes, they will alternate between the connections (via=20
marks) thus hypothetically equalizing the load on the connections.

The thing that this does not take in to account is what type of traffic=
=20
a given connection is nor how long lived and active it is.

Let's say that I have the following (new) connections in the following=20
sequence.

   1)  Simple SMTP test email.
   2)  HTTP download of kernel source.
   3)  Simple DNS query.
   4)  VPN connection.

You will find that connections #1 and #3 are marked with CONNMARK1 and=20
that connections #2 and #4 are marked with CONNMARK2.  So what you end=20
up with is two very ""light connections on CONNMARK1 and two much=20
heavier connections on CONNMARK2.

The connections did end up "load balanced" (in a manner of speaking), o=
r=20
"distributed" (is probably a better way to describe it) across the=20
multiple CONNMARKs.  However, if you look at the utilization of the two=
=20
CONNMARKs or the physical connections they represent, you will find tha=
t=20
one is way under utilized and the other is probably saturated.

However, with out doing some relatively nasty things (i.e. spoofing=20
which requires support upstream) there is little that you can do about =
this.

So, you do end up distributing the connections, but not necessarily loa=
d=20
balancing.

> thank!

You are welcome.



Grant. . . .
