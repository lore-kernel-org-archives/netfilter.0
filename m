From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Load Balance
Date: Tue, 17 May 2011 14:00:46 -0300
Message-ID: <BANLkTi=gB609MZNzuJ-277B23wCiB5EhOQ@mail.gmail.com>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
	<1305480225.1708.2.camel@andybev>
	<BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>
	<1305581912.2041.15.camel@andybev-desktop>
	<4DD1C539.20404@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD1C539.20404@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

well....I've just done a test with CONNTRACK and CONNMARK modules as
link indicated for Andrew and it's work the load Balance.

but I still wonder what is the metric used to do the load balance I
guess that the point is in line below

iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
statistic --mode nth --every 2 --packet 0 -j CONNMARK1
iptables -t mangle -A PREROUTING -p tcp -m state --state NEW -m
statistic --mode nth --every 2 --packet 1 -j CONNMARK2

I understand that each  two new connections the third go out to next
link making the load balance.

right ??

thank!








2011/5/16 Grant Taylor <gtaylor@riverviewtech.net>:
> On 5/16/2011 16:38, Andrew Beverley wrote:
>>
>> If you don't do this, then each gateway will only see half the
>> packets for a connection stream, which although I am not an expert, =
I
>> guess is not a good thing.
>
> The problem has to do with the fact that most connections are using N=
AT at
> the edge, not a globally routable IP behind the load balancer with mu=
ltiple
> routes back in.
>
> So what happens is that some of the traffic for a session is sent out=
 one
> gateway and being NATed to one external IP and the other traffic for =
the
> same session is being sent out the other gateway and being NATed to a
> different external IP. =A0Thus, the server sees weird traffic, coming=
 from two
> different IPs. =A0One connection exhibits drops and the other exhibit=
s
> incorrect sequence (think TCP 3-way handshake). =A0The server will ab=
ort the
> out of order / incorrect state traffic, which really causes the clien=
t to
> abort the entire connection. =A0You end up with a mess. =A0Thus you n=
eed to use
> something like conntrack to make connections be persistent when NAT i=
s
> involved like that.
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
