From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Redundant netfilter gateway
Date: Thu, 17 Jun 2004 15:37:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E336@alderaan.smgtec.com>
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
To: =?iso-8859-1?Q?G=FCnter_Zimmermann?= <guenter@guenter-zimmermann.com>, "B. McAninch" <bmcaninch@penson.com>
Cc: Patrick Ahler <patrick@vikus.com>, netfilter@lists.netfilter.org

> I think this is the only realy full redundant opensource firewall
> available.=20

I've used linux-ha's heartbeatd in the past. I've had mixed results, so =
I can't recommend it before you try it. It does perform  automatic MAC =
failover with gratuitous arp's. I used it on a 5 net homed setup and I =
found issues with the takeover. Maybe a 2 network link would behave =
better.

SARU I believe was never actually implemented, or at least not yet. The =
Linux Virtual Server seems to have 'something' but I can't say that I =
know what it does. The netfilter module listed in their download page =
seems to indicate that its an active state failover.

Harald Welte is also developing a netfilter failover module, but I =
haven't heard much of that in the past 6 months.

