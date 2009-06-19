From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Problem with IPv6 tunnel
Date: Fri, 19 Jun 2009 14:13:43 +0200
Message-ID: <200906191413.43513.ben@differentialschokolade.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <200906191218.03217.ben@differentialschokolade.org> <9948385e0906190503i223f715s49730aa8e5e5df89@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0906190503i223f715s49730aa8e5e5df89@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: David =?utf-8?q?Bala=C5=BEic?= <xerces9@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 19 June 2009, 14:03 David Bala=C5=BEic wrote:
> One more thing: Where is the timeout for this set ?

/proc/sys/net/netfilter/nf_conntrack_generic_timeout I presume.

> After the mentioned ping, the world can contact me for hours.

That's much too long for the default setting of a timeout. AFAIK the he=
artbeat=20
client must send keepalive packets every 300 seconds so the tunnel and=20
connection tracking timeouts may influence each other.

> I want to lower the timeout to a minute or so, so I can test the
> setting without the need to wait hours for the timeout to happen.

Why do you want to conntrack proto-41 packets at all? If you're worried=
 about=20
security, filter the IPv6 traffic using ip6tables.

Benedikt
