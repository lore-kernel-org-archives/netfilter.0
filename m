From: Patrick McHardy <kaber@trash.net>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 15:40:19 +0100
Message-ID: <4AF19253.5050107@trash.net>
References: <1257332494.1254.218.camel@francois.tc.commsmundi.com>	 <4AF163EE.7060306@trash.net>	 <1257337891.1254.220.camel@francois.tc.commsmundi.com>	 <4AF183A7.5060005@trash.net>	 <1257342875.1254.224.camel@francois.tc.commsmundi.com>	 <4AF18937.5010901@trash.net> <1257345155.1254.245.camel@francois.tc.commsmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1257345155.1254.245.camel@francois.tc.commsmundi.com>
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
> On Wed, 2009-11-04 at 15:01 +0100, Patrick McHardy wrote:
>> I can't find anything which could cause this. Please post full
>> information (all netfilter rules, ping version, qdiscs and whatever
>> else might seem important).
>>
>> Also, your kernel is already tainted (D), please retry with
>> a cleanly booted kernel.
>=20
> I reproduce right after a reboot, and it's still tainted, how do I
> remove that? The only strange thing at boot would be some vga=3D opti=
on in
> lilo that fails (because of a wrong value) and asks me for a mode.
>=20
> It might be worth noting that the kernel is patched with IMQ, latest
> version from linux-imq.net, but the IMQ device is not used.

This is most likely the cause.
