From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: ipv6 link local address
Date: Tue, 07 Jun 2011 10:44:27 +0400
Message-ID: <1307429067.7853.1.camel@hakkenden>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: bmcdowell@coxhealthplans.com
Cc: netfilter@vger.kernel.org

=D0=92 =D0=9F=D0=BD=D0=B4, 06/06/2011 =D0=B2 21:47 +0000, bmcdowell@cox=
healthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello list.  I'm updating my IBF (invisible bridging firewall) deploy=
ments, and I'd like to add support for ip6tables.  In the near-term, I'=
d like to '-P DROP' everything, but I'd rather not have to reinvent the=
 wheel once/when/if we start supporting this protocol in the DMZ.
>=20
> Everything seems to be moving along just fine, except the matter of t=
he link local addressing.  While not specifically a netfilter issue, I =
do wonder if anyone on the list has dealt with this in the past.  It se=
ems to my somewhat-limited understanding of the protocol that there's s=
imply no way to filter ipv6 without 'speaking' it.  Even in my very ear=
ly days of learning ipv4 I could have specified a '0.0.0.0' address on =
the interface, but ipv6 is designed from the ground up to prohibit this=
 behavior.  Ostensibly for issues such as address allotment, any ipv6 e=
nabled interface defaults to being able to converse with any other inte=
rface on the same layer 3 link.  For an IBF this is potentially a bad t=
hing, because now my unaddressable device is suddenly addressable, even=
 if only to those on the same local link. The simplest example scenario=
 I can imagine is a compromised FTP/Web server speaking to a vulnerable=
 iptables firewall and re-writing the rules it carries.
>=20
> While I can certainly firewall off this traffic easily using netfilte=
r today, I'll not be able to do that forever.  The moment I allow link-=
local traffic I'll be exposing my bridge interfaces to the same.  Assum=
ing netfilter is never down or misconfigured seems to be a fatal concei=
t.
>=20
> Thoughts?
>=20
>=20

You can turn off ipv6 on interfaces. This should not prevent bridging
ipv6, but will remove any ipv6 logic from them.

> Thanks in advance.
>=20
> Bob McDowell
> Network/Security Engineer=20
> Cox HealthPlans
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


