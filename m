From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilter_queue question
Date: Thu, 05 May 2011 11:12:42 +0200
Message-ID: <4DC26A0A.8050402@tana.it>
References: <1304489658.32272.19.camel@compot-mob>	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1304586785; bh=DPqTMEP9+NsnXAfxpxxEebLajzQ4z/KrAENgWjEsJ+I=;
	l=1193;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=GcoYa2SCZSMy45IjCPEzg4bQkI0PUv7RNRuTbjORWhrIRLFbFCHtL0ivrFsPYd1im
	 q5JbBkObakVG0SLhNMIQwKG45Nfg7nrRllOmcgCitzULCdZJw3309NN+9ClsSSEnUC
	 c9/gQyplaM16mUfTGpucWvspy8WiUlXFrqZYZc8E=
In-Reply-To: <1304533951.25221.8.camel@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On 04.05.2011 20:32, Nikolay S. wrote:
> =D0=92 =D0=A1=D1=80=D0=B4, 04/05/2011 =D0=B2 20:13 +0200, Alessandro =
Vesely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 04.05.2011 08:14, nowhere wrote:
>>> Several packets at the beginning get lost.
>>
>> Are they always at the beginning, or does that depend on the distrib=
ution of
>> delays?
>=20
> Indeed. The first packet is never dropped, then comes a serie of drop=
s
> (the number of dropped packets depends on the sending rate, i.e. test=
ing
> with iperf on, say, 50 Mbit/s shows drops of ~800 packets) and after
> that no drops at all. Distribution and it's parameters do not matter
> except for zeroes: if there is no artificial delay, no packets are
> dropped.

Looks like pretty reproducible.  I'll have a try with your code when I =
get
back to my place.

>> I see nothing wrong in it.  However, I'd print out occurrences of rv=
 < 0
>> after recv() and look for errno=3D=3DENOBUFS in particular.  It shou=
ld report
>> lost packets
>=20
> Yes, I did it (actually this was one of the first checks). There are =
no
> situations when rv < 0.

Did you check return codes from nfq_set_verdict()?  If that is 0, it mu=
st be
a bug.  What versions of library and kernel are you using?

