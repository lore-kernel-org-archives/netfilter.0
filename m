From: Greg Cope <gregcope@gmail.com>
Subject: Re: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 20:07:36 +0100
Message-ID: <c0e9781f05042112072ac5d6f5@mail.gmail.com>
References: <c0e9781f0504202352240208e4@mail.gmail.com>
	<426753A3.7030800@riverviewtech.net>
	<c0e9781f05042102544437b319@mail.gmail.com>
	<c0e9781f0504210718566c4025@mail.gmail.com>
	<4267BE69.6080203@riverviewtech.net>
	<c0e9781f05042108122c7b02c3@mail.gmail.com>
	<4267ED40.6040803@riverviewtech.net>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4267ED40.6040803@riverviewtech.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

> > So the last few hurdles...
> >
> > I need to use the same router - an ADSL thing as everything else, I
> > just want the packets to be sent from a different $MAIL_INET_ALIAS IP
> > (as opposed to the usual INET_IP
>=20
> This makes perfect sense to me and is what I understood you to be wanting=
.  Now to just get the syntax correct so that it does work.

ok.
=20
> > However I think these are the sticking points:
> >
> > ip route add table $IPROUTE2_SMTP_TABLE dev $INET_IFACE src $MAIL_INET_=
ALIAS
> > ip route add table $IPROUTE2_SMTP_TABLE default via $INET_IP
> >
> > I get
> >
> > $ ip route add table smtp.out dev eth0 src 217.154.55.250
> > $ ip route add table smtp.out default via 217.154.55.241
> > RTNETLINK answers: File exists
>=20
> You may need to change your device entire in the above rule to be eth0:1 =
not eth0.  Some testing should tell you this for sure.

Tried that :-)

> Hmm, would it be possible for me to see the full output of your ip route =
tables and rules prior to what we have done here?  I'd also like to see the=
 output of your iptables rules for the filter, nat, and mangle tables.  Thi=
s way I can look at the entire picture and hopefully give you the correct i=
nfo with out having to work with pieces of the information.

The IP tables are quite long as we have quite a few VPN rules.

The rest is quite straight forward.

What would be easiest to start with.

Greg

PS its night time here in the UK ......

