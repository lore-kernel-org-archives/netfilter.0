From: Lorenzo Allegrucci <lorenzo.allegrucci@forinicom.it>
Subject: Re: SIP vs NAT, the configuration
Date: Fri, 18 Dec 2009 15:31:30 +0100
Message-ID: <4B2B9242.5020904@forinicom.it>
References: <4B2A1ED1.5030609@forinicom.it> <07b3b533f982b9d160870cba61241e91@thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <07b3b533f982b9d160870cba61241e91@thom.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RnJhbsOnb2lzIExlZ2Fs?= <devel@thom.fr.eu.org>
Cc: rebeca.martinez-garcia@estudiant.upc.edu, netfilter@vger.kernel.org, vhuertas@indra.es

=46ran=C3=A7ois Legal wrote:
> Could you log the packets that match instead of marking, then send th=
e log
> to the list ?

Hi Fran=C3=A7ois,

I just managed to solve it by setting "directmedia=3Dupdate" on my aste=
risk configuration.
If directmedia=3Dyes RTP traffic is between the two clients, with direc=
tmedia=3Dupdate
almost all RTP traffic is via asterisk and in this way the nf_conntrack=
_sip module can match it.
The sip_direct_media=3D[0|1] parameter of nf_conntrack_sip had no influ=
ence on my test.
