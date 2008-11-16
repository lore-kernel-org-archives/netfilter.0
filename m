From: sean darcy <seandarcy2@gmail.com>
Subject: Re: where are my udp packets going?
Date: Sun, 16 Nov 2008 16:31:11 -0500
Message-ID: <gfq3f0$9ot$1@ger.gmane.org>
References: <gfndh9$n0s$1@ger.gmane.org> <gfnngg$gvn$1@ger.gmane.org> <492043E5.1080903@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <492043E5.1080903@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Hello,
>=20
> sean darcy a =E9crit :
>> sean darcy wrote:
>>> I'm trying to setup port forwarding for a VOIP server that uses IAX=
=20
>>> packets, port 4569:
>>>
>>> + /sbin/iptables -t nat -A PREROUTING -i eth0 -p udp --dport 4569 -=
j=20
>>> DNAT --to 10.10.10.180:4569
>>> + /sbin/iptables -A FORWARD -p udp -m state --state NEW -d=20
>>> 10.10.10.180 --dport 4569 -j ACCEPT
>>>
>>> but the packets aren't showing up at 10.10.10.180.
> [...]
>> Well, they're going to input.
> [...]
>> In other words, it's port forwarding all iax except from 76.
>=20
> This happens probably because your NAT box started to receive UDP/456=
9=20
> packets from 76.zzz.xxx.yyy before the DNAT rule was created and=20
> continually receives packets since then. The netfilter connection=20
> tracking created a conntrack entry without any NAT operation so=20
> subsequent UDP/4569 packets from 76.zzz.xxx.yyy use that same conntra=
ck=20
> entry and skip the nat chains, until the entry expires. If the box=20
> continally sees UDP/4569 packets from 76.zzz.xxx.yyy, then the entry=20
> never expires. If you pull the ethernet wire off eth0 for a couple of=
=20
> minutes, the conntrack entry should expire.
>=20
> Rationale : don't allow any traffic before all rules are created. A=20
> simple way to achieve it is to create the rules before network=20
> interfaces are UP.
> --=20

I was able to shut down the 76. machine, reboot the server, and it=20
worked. So, thanks.

But all this leaves me puzzled.

My server does NOT generate 4569 packets, and iptables INPUT drops all=20
from eth0, except for ssh and ESTABLISHED. So how could there be a=20
conntrack entry?

Is there a way to DNAT traffic before it reaches the conntrack entry?=20
Can I change the destination in raw/PREROUTING?

Is there a way to flush the conntrack entry? I'd reallly like not to=20
take the network down if this happens again. It's a very remote machine=
,=20
and if ssh didn't come up again, I'd need a new job.

Thanks for the help.

sean

