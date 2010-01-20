From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Netfilter packet flow and VLANs
Date: Wed, 20 Jan 2010 14:58:46 +0200
Message-ID: <1263992326.3936.17.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

Hi there.

I has recently realized it is unclear how does VLANs are processed
according to netfilter packet flow.

Mostly I'm using simplified packet flow diagram like this:

http://www.chinalinuxpub.com/doc/www.siliconvalleyccie.com/images/iptab=
les.gif

But even more complicated diagram like this:

http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flo=
w.svg

doesn't answer my question.

I was believing processing VLANs is linear, like the job is beinf done
at one point.

Consider setup:

eth0: physical interface
eth0.11: VLAN 11 on eth0
eth0.12: VLAN 12 on eth0
eth0.13: VLAN 13 on eth0
br0: bridge of eth0.11, eth0.12, eth0.13

After seeing original incomming packet on eth0.11 and it already DNATed
on br0 with tcpdump I understood I was wrong. It seems like the packet
is being processed until some point, then unVLANed and reinjected. I'm
suspecting that im this setup the packet could even make 3 rounds, one
as it is from eth0, one unVLANed as it is from eth0.11 and one as it is
from br0 (???).

The later scheme covers bridge traffic. So the question is how does VLA=
N
proceccing relates to the later scheme and where does tcpdump -i eth0,
tcpdump -i eth0.11 and tcpdump br0 sees the packet relating to the late=
r
scheme?

If you could also answer the same question about imq that would be
perfect.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

