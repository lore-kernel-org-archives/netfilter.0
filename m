From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: Re: nf_conntrack_sip and nf_nat_sip can do this??
Date: Wed, 17 Feb 2010 09:23:22 +0100
Message-ID: <20100217092322.10636xhk7rezynoc@ek2pim.upc.edu>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>
	<20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>
	<4B4D82E2.6090405@trash.net>
	<20100113143859.18292p3kbz00a60g@ek2pim.upc.edu>
	<4B4DD05A.4000606@trash.net>
	<20100114111329.216832szeqp9zdyc@ek2pim.upc.edu>
	<4B4EF71D.7010104@trash.net>
	<20100115092906.15796e278u2h26os@ek2pim.upc.edu>
	<4B503C78.7070405@trash.net>
	<20100115113829.1720778iyiylgn0g@ek2pim.upc.edu>
	<4B507446.9090503@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B507446.9090503@trash.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, vhuertas@indra.es, devel@thom.fr.eu.org


Hello,

I have detected in my scenario that during an internal communication =20
between two Eyebeam terminals, nf_conntrack_sip and nf_nat_sip work =20
fine in the SDP part although not in the SIP header. The result is =20
that RTP streams go between them and not to my gateway as before.
However, just substituting one Eyebeam terminal by the IMS one I am =20
using (Mercuro IMS client) the problem again appears.

Which is the difference between using one or the other type of =20
terminal in this case?

Thanks in advance,
Rebeca

"Patrick McHardy" <kaber@trash.net> escribi=C3=B3:

> rebeca.martinez-garcia@estudiant.upc.edu wrote:
>>
>> Hello,
>>
>> I have gzip'ed them.
>> I hope this time you do not have problems while saving.
>
> Works fine, thanks, I'll have a closer look.
>


