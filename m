From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: randomly SNATed devices after reboot
Date: Fri, 16 May 2014 21:01:53 +0200
Message-ID: <537660A1.9060907@plouf.fr.eu.org>
References: <20140515104238.26ce6626@pulsar> <53759AB5.6050101@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53759AB5.6050101@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: "Ethy H. Brito" <ethy.brito@inexo.com.br>, netfilter <netfilter@vger.kernel.org>

Hello,

Vigneswaran R a =E9crit :
> On 05/15/2014 07:12 PM, Ethy H. Brito wrote:
>> Hi All
>>
>> I have this setup in which there are lots of static IPs "SNATed" IP-=
Phones
>> behind a Linux machine. A very simply NAT machine. Just one SNAT rul=
e for the
>> phones' network.
>>
>> At every Linux machine reboot, some of those phones, randomly, simpl=
y does not
>> register at some outside-nat SIP server.
>>
>> Investigating with tcpdump I can see, at the external interface, "no=
t snated"
>> packets from those not registered phones. Packets from the other pho=
nes are
>> correctly "snatted".
>=20
> May be, some phones are trying to register via ESTABLISHED connection=
s=20
> which not getting SNATed. So, the registration fails.

Not ESTABLISHED (that would require return traffic, but existing (NEW).

If a phone sends a SIP packet before the SNAT rule is active, then the
whole SIP flow, including further packets, will not be SNATed until the
related conntrack entry expires. Expiration never happens if the sendin=
g
period is shorter than the UDP conntrack expiration delay.

If you don't want this to happen, just DROP all FORWARDed traffic until
the SNAT rule is active.
