From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Traffic limitation with iptables
Date: Wed, 23 Jul 2003 09:17:39 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192C6@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Esteban Ribicic <eribicic@sinectis.com>
Cc: epv_xemul@mail.ru, netfilter@lists.netfilter.org

Well sorry. I can't understand your question.

" some chain reaches or exceedes any fixed value then IMMEDIATELY insert =
into that cahin new first rule (e.g. -j DROP)"
The Subject says "traffic limiting" but nothing in your body says =
dropping after an exceeded limit which is what QUOTA does.. you do not =
DROP packets as such with shaping, it merely puts them into a QUEUE and =
only on a congested network is where DROPing occurs.

what you want is TC which is part of iproute2 to do proper bandwidth =
throttling or use Bandwidth Arbitrator www.bandwidtharbitrator.com which =
is pretty good.


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Esteban Ribicic [mailto:eribicic@sinectis.com]
Sent: Wednesday, July 23, 2003 8:16 AM
To: George Vieira
Cc: epv_xemul@mail.ru; netfilter@lists.netfilter.org
Subject: Re: Traffic limitation with iptables


that would not be shapping...ass dropping/rejecting packets implicates
much more yhing under tcp/ip..

maybe lartc.org may help too..(this is not the mailing-list i think)
fix me if im wrong
Esteban


On Wed, 23 Jul 2003 08:07:40 +1000
"George Vieira" <georgev@citadelcomputer.com.au> wrote:

> Use the Quota patch and it'll limit the rule by itself..		=09
>=20
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>=20
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>=20
>=20
>=20
> -----Original Message-----
> From: Xemul [mailto:epv_xemul@mail.ru]
> Sent: Wednesday, July 23, 2003 2:09 AM
> To: netfilter@lists.netfilter.org
> Subject: Traffic limitation with iptables
>=20
>=20
> Hi.
> I wanna solve such a problem:
> When I see that byte counter on some chain reaches or exceedes any =
fixed
> value - then IMMEDIATELY insert into that cahin new first rule (e.g. =
-j
> DROP) or delete some rules from any other chain. Or more abstract - =
how
> can can discover that byte counter is higher than smth without
> "polling" chains?
>=20
> Sorry for sending such a mail into announce, developers and user
> maillists but I need help as soon as possible. :)
>=20
>=20

