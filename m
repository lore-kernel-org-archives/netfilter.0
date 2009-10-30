From: Patrick McHardy <kaber@trash.net>
Subject: Re: 64bit MARK
Date: Fri, 30 Oct 2009 11:17:59 +0100
Message-ID: <4AEABD57.7050001@trash.net>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>	 <4AEA176A.6060501@trash.net>	 <1256893245.1254.66.camel@francois.tc.commsmundi.com>	 <4AEAAFD7.1070407@trash.net>	 <1256896320.1254.82.camel@francois.tc.commsmundi.com>	 <4AEAB811.7000707@trash.net> <1256897706.1254.97.camel@francois.tc.commsmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1256897706.1254.97.camel@francois.tc.commsmundi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: fdelawarde@wirelessmundi.com
Cc: netfilter@vger.kernel.org

=46ran=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD wrote:
> On Fri, 2009-10-30 at 10:55 +0100, Patrick McHardy wrote:
>> Well, one more. You don't need any mark values for the input interfa=
ce,
>> both routing rules and TC classifiers (flow, route, meta) support ii=
f
>> classification directly.
>=20
> I unfortunately do not need it for routing rules which works nice, bu=
t
> for TC classifiers, and apparently it does not work with those, maybe=
 I
> don't know how to use them.
>=20
> # tc filter add dev imq0 parent 1: iif eth0 flowid 1:2
> Unknown filter "iif", hence option "eth0" is unparsable

tc filter add ... route fromif ... classid ...

should work.
