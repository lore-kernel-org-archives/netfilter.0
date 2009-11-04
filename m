From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 16:42:12 +0100
Message-ID: <1257349332.1254.260.camel@francois.tc.commsmundi.com>
References: <1257332494.1254.218.camel@francois.tc.commsmundi.com>
	 <4AF163EE.7060306@trash.net>
	 <1257337891.1254.220.camel@francois.tc.commsmundi.com>
	 <4AF183A7.5060005@trash.net>
	 <1257342875.1254.224.camel@francois.tc.commsmundi.com>
	 <4AF18937.5010901@trash.net>
	 <1257345155.1254.245.camel@francois.tc.commsmundi.com>
	 <4AF19253.5050107@trash.net>
	 <1257345852.1254.254.camel@francois.tc.commsmundi.com>
	 <4AF19595.10803@trash.net>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF19595.10803@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On Wed, 2009-11-04 at 15:54 +0100, Patrick McHardy wrote:
> > Does it affect even if the devices are not used at all? I can still
> > reproduce doing an "rmmod imq" before anything.
> >=20
>=20
> Probably, it adds weird code all over the place and from a quick look
> it can't even compile cleanly.

Ok, thanks for your answers. If I reproduce without IMQ I will let you
know. Otherwise I guess I'll have to wait for that xtable-addons
implementation of IMQ. :-)

=46ran=C3=A7ois.

