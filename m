From: Patrick McHardy <kaber@trash.net>
Subject: Re: 64bit MARK
Date: Fri, 30 Oct 2009 10:20:23 +0100
Message-ID: <4AEAAFD7.1070407@trash.net>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>	 <4AEA176A.6060501@trash.net> <1256893245.1254.66.camel@francois.tc.commsmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1256893245.1254.66.camel@francois.tc.commsmundi.com>
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
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD w=
rote:
> On Thu, 2009-10-29 at 23:30 +0100, Patrick McHardy wrote:
>>> Would it be possible to have 64bit MARKs with 64bit architectures?=20
>>>
>>> Apparently they are defined as "unsigned long" in linux headers, bu=
t
>>> iptables limits them to 32bit.
>> Thats from far far back. The unsigned long only exists in compatibil=
ity
>> structures, all new revisions use 32 bit. This is deliberate to make
>> sure they're same-sized on all architectures and rulesets don't beha=
ve
>> differently.
>=20
> It might be an uncommon case, but many things I do need MARKs and 32b=
its
> is just not enough!
>=20
> For example, for input traffic I do marking for:
> - ip rules (sometimes A LOT of rules)
> - tc filters (sometimes A LOT of filters)
> - gateway selection (ip rules for multipath)
> - marking input interface to use in IMQ
>=20
> Any ideas then for someone needing more than 32bits MARK? I could use
> TOS bits (usable with ip rules and tc filters), but it's just so ugly=
,
> and would screw in any network using it...
>=20
> Could the other 32 bits be used as a MARK "category" feature availabl=
e
> only for 64bit arch?

No, as I said, rulesets are supposed to behave similar on all
architectures. Since neither routing rules nor TC classifiers
support more than 32 bit, it would be useless anyways. But you
can usually deal with this by organizing your marking rules
properly.

=46irst, all of the above support using masks for mark values,
which might be helpful. For routing and gateway selection you
only need the mark values at PREROUTING and OUTPUT, so you
can reuse them afterwards. TC marking is best done in
POSTROUTING since that doesn't interfere with routing. If
for some reason you want to do TC classification earlier than
that, you can use the CLASSIFY target, which doesn't use
mark values but priority values.
