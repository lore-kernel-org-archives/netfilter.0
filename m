From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: NOTRACK not working
Date: Tue, 26 Jan 2010 22:35:15 +0200
Message-ID: <1264538115.4004.71.camel@casper.meteor.dp.ua>
References: <4B5F36B7.5010004@conversis.de>
	 <1264531798.4004.67.camel@casper.meteor.dp.ua>  <4B5F4D76.200@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B5F4D76.200@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: "Dennis J." <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

=F7 =F7=D4=CF, 26/01/2010 =D7 21:15 +0100, Dennis J. =D0=C9=DB=C5=D4:
> On 01/26/2010 07:49 PM, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=
=C9=CB wrote:
> > =F7 =F7=D4=CF, 26/01/2010 =D7 19:38 +0100, Dennis J. =D0=C9=DB=C5=D4=
:
> >> Hi,
> >> For a while now I excluded two IPs on my firewall from connection =
tracking
> >> which works very well. Now I tried adding another IP but that does=
n't seem
> >> to work. I added the following rules:
> >>
> >> iptables -t raw -A PREROUTING -s 192.168.10.10 -j NOTRACK
> >> iptables -t raw -A PREROUTING -d 192.168.10.10 -j NOTRACK
> >>
> >> Yet when I look in /proc/net/ip_conntrack I still see 192.168.10.1=
0 using
> >> up most of the entries.
> >> Is there something else that needs to be done to exclude this IP c=
ompletely
> >> from the connection tracking table?
> >
> > Probably conntrack has seen packets from this IP before you added t=
hose
> > rules, they will remain until connection is "closed" and/or timeout
> > occurs. Quick hack is to do "conntrack -F; conntrack -F expect".
> >
>=20
> Makes sense. Where can I find the conntrack command? This is a regula=
r=20
> centos 5 system but I can't find any packages that contain this comma=
nd.

In Debian this is in "conntrack" package. I'm not centos user, but you
will propably find a way to see which package contains a certain file o=
n
centos website.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

