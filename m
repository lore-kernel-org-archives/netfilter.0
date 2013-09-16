From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Mon, 16 Sep 2013 12:44:52 +0530
Message-ID: <5236AFEC.5020505@atc.tcs.com>
References: <8761u59uit.fsf@vostro.rath.org> <5232B01B.2030007@atc.tcs.com> <5234678F.6010401@plouf.fr.eu.org> <52348363.6080804@rath.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <52348363.6080804@rath.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Nikolaus Rath <Nikolaus@rath.org>
Cc: netfilter@vger.kernel.org

On 09/14/2013 09:10 PM, Nikolaus Rath wrote:
> On 09/14/2013 06:41 AM, Pascal Hambourg wrote:
>> Vigneswaran R a =C3=A9crit :
>>> Hello Nikolaus,
>>>
>>> I have a doubt. It seems, rath of ebox is assigned with IP address =
in
>>> the range 192.168.12.0/24. However, IP address of vostro seems to b=
e
>>> 192.168.17.47 (assuming /24). Ebox doesn't have any route to this r=
ange.
>>> So it try to use default route via eth0.
>> Correct.
>>
>>> What I assume is, 'vostro' has IP addresses in (atleast) two ranges
>>> (192.168.12.0/24, 192.168.17.0/24). In the default routing table, t=
he
>>> src IP is set to 192.168.12.x (for the packets originating from vos=
tro).
>>> However, the 'tovpn' table didn't specify the src IP. So, when the
>>> 'tovpn' table is being used, the packets may have got the src IP as
>>> 192.168.17.x.
>>>
>>> I think, you can avoid this by explicitly specifying the src IP whe=
n
>>> adding the route to 'tovpn' table,
>>>
>>>       ip route add default via 192.168.12.1 src 192.168.12.x table =
tovpn
>> This won't work. It's too late. The source address has already been
>> selected by the TCP layer when the packet was created and won't be
>> changed when the packet is re-routed due to the mark.
> I see. Out of curiosity: how is the source address selected when the
> packet is created, and in which situation would the source entry in t=
he
> routing table become effective?

=46ollowing is my understanding.

=46or a packet created by local process, it seems, there are two places=
 in=20
which the IP Rules have been evaluated and various routing tables have=20
been consulted.

1. Just before getting into OUTPUT chain
   -- Here, the outgoing Interface, SRC IP have been decided for the pa=
cket

2. After processing OUTPUT chain and just before getting into=20
POSTROUTING chain
   -- Here, the outgoing Interface is getting modified, if necessary.=20
However, the SRC IP didn't.

So, in our case,

1. Just before getting into OUTPUT chain
   -- At this point, the IP Rule (based on FWMARK) doesn't evaluate to=20
true as the MARK is not yet set.
   -- Due to that 'tovpn' table is not consulted
   -- This means, there is no explicit route to 190.93.249.164. So, it=20
uses default route 'via 192.168.17.1 dev br0' (based on main table entr=
y).
   -- This results in SRC IP being 192.168.17.47 and the outgoing=20
Interface being 'br0'.

2. After processing OUTPUT chain and just before getting into=20
POSTROUTING chain
   -- At this point, the IP Rule (based on FWMARK) evaluates to true as=
=20
the MARK is added by OUTPUT chain.
   -- Now, the 'tovpn' table is also consulted which has route to=20
190.93.249.164 'via 192.168.12.1 dev rath'.
   -- In my observation, only the outgoing Interface is updated at this=
=20
point.
   -- This results in SRC IP being 192.168.17.47 and the outgoing=20
Interface being 'rath'.

The following workaround solves our purpose. However ugly and not=20
scalable, I think.

Using some condition for IP Rule which evaluates to true at the 1st ste=
p=20
itself. eg., (matching destination IP).

     ip rule add to 190.93.249.164 table tovpn


Regards,
Vignesh
