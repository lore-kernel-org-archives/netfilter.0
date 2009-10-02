From: John Little <jlittle_97@yahoo.com>
Subject: Re: Using iptables with high volume mail
Date: Fri, 2 Oct 2009 06:50:17 -0700 (PDT)
Message-ID: <150303.95092.qm@web53112.mail.re2.yahoo.com>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com>  <1254412984.11386.63.camel@enterprise.ims-firmen.de>  <4AC4DB93.6060707@freemail.hu>  <900981.20015.qm@web53108.mail.re2.yahoo.com> <1254486676.19832.20.camel@enterprise.ims-firmen.de>
Reply-To: John Little <jlittle_97@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254491418; bh=FCdWpabYvNlDlfSQswGzZSKJkGetrykat9dEd1Ty07s=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=fCuT5b51u0lENGlWTvfkzL1Ff1yj02nJLosX9TNxVDDzxFVqtpwx0LpxVBqBY8ZPAOkkmtKUI7ETBGiRD6bJqx4juExs9t70qOqQG8MKdVNVJYhHGl52Y6XbQ6QebwZa4FRlV9w2FfMz7q+l0UOXl7WA6k+Gd86iJVdAkxq3h+Q=
In-Reply-To: <1254486676.19832.20.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter@vger.kernel.org



----- Original Message ----
> From: Thomas Jacob <jacob@internet24.de>
> To: John Little <jlittle_97@yahoo.com>
> Cc: G=E1sp=E1r Lajos <swifty@freemail.hu>; netfilter@vger.kernel.org
> Sent: Friday, October 2, 2009 8:31:16 AM
> Subject: Re: Using iptables with high volume mail
>=20
> > @thomas Thanks for those metrics.  We are looking to see if the con=
nections=20
> per second is
> > generated with our current devices.  What we do know is that our ma=
x
> >outbound connections will get as high as 16000 for a period of time =
>
> >(maybe 2-4 hours) and will occasionally burst up to around 20000.
>=20
> I am guessing that means existing parallel connections, not new
> connections per second (cps), the kind of server box I was referring
> to can easily sustain millions of those, given enough
> memory for the tables (The last number I remember was <300byte per
> connection in the conntrack table + space for entries into the routin=
g
> cache for each different IP). Slabtop is your friend here.
>=20
> What matters most is
> what happens in each time slice, not so much how many connections
> you have in the connection hash table (you can tune that table with
> with /proc/sys/net/ipv4/netfilter/ip_conntrack_max
> and /sys/module/ip_conntrack/parameters/hashsize).
>=20
> > How does that compare to the metrics that you mentioned earlier?
>=20
> Well, any Switch/Router with SNMP support allows you to track bytes a=
nd
> packets per second, so you could collect some data on the current
> situation with that (www.cacti.net is a very nice tool).
>=20
> As for new connections per second, once you have the iptables box
> running you can get this info with lnstat -f ip_conntrack/column new.
>=20
> If you have a reasonably good switch/router in the datapath, you coul=
d
> also use port mirroring to get a copy of the data stream and then
> count all tcp/syn packets to port 25 to give you a rough idea
> about the number of connections per second.
>=20
> However, emails per time should be pretty much the same as connection=
s
> per time, unless you open several tcp connections over the nat box
> for each email, and I see no reason why you would need to do that ;)


Ok thanks.

We have some stats now:

Packets per second:  avg 6221 max 41,810
=20
Connections peak: avg 7263  max 22,981
=20
New connections per second: avg 102 max 1029=20

Given your numbers of 8000 cps and the above comments it would seem tha=
t we are well within any types of overload issues with any decent off t=
he shelf server equipped with two dual core CPUs and the necessary memo=
ry.  If I allocate 500 bytes per connection at the max connections I wo=
uld need ~87Mb + machine overhead.  That's not much in today's world of=
 servers.

Am I looking at this properly?

Thanks,
John



     =20
