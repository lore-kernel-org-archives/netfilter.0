From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Let me understand *RETURN*
Date: Fri, 18 Feb 2005 19:30:28 +0100
Message-ID: <42163444.70206@lopsch.com>
References: <1108743358.9509.12.camel@localhost.localdomain>	<20050218173442.GA32562@bender.817west.com>
	<1108749685.9509.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108749685.9509.25.camel@localhost.localdomain>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Mohammad Khan schrieb:
> On Fri, 2005-02-18 at 12:34, Jason Opperisano wrote:
>=20
>>On Fri, Feb 18, 2005 at 11:15:58AM -0500, Mohammad Khan wrote:
>>
>>>I have couple of chains and rules for filter table
>>>
>>>-N TCP_IN
>>>-N TCP_OUT
>>>-N UDP_IN
>>>-N UDP_OUT
>>>-N ICMP_IN
>>>-N ICMP_OUT
>>>
>>>-N P1_IN
>>>-N P1_OUT
>>>-N P2_IN
>>>-N P2_OUT
>>>
>>>-A FORWARD -d IP_OF_P1 -j P1_IN
>>>-A FORWARD -s IP_OF_P1 -j P1_OUT
>>>
>>>-A FORWARD -d IP_OF_P1 -j P1_IN
>>>-A FORWARD -s IP_OF_P1 -j P1_OUT
>>
>>why do you have the above 2 rules twice?
>=20
> Sorry, copied and pasted ..=20
> should be=20
> -A FORWARD -d IP_OF_P1 -j P1_IN
> -A FORWARD -s IP_OF_P1 -j P1_OUT
> -A FORWARD -d IP_OF_P2 -j P2_IN
> -A FORWARD -s IP_OF_P2 -j P2_OUT
>=20
>=20
>>
>>>-A FORWARD -j LOG --log-prefix "NOT_FORWARDED "
>>>-A FORWARD -j DROP
>>>
>>>-A P1_IN -t TCP -j TCP_IN
>>>-A P1_IN -t UDP -j UDP_IN
>>>-A P1_IN -t ICMP -j ICMP_IN
>>>-A P1_IN -j RETURN
>>>
>>>-A TCP_IN -t TCP --dport 80 -J ACCPET
>>>-A TCP_IN -j RETURN
>>
>=20
> Sorry again.. for the typo
>=20
> should be:
> -A P1_IN -p TCP -j TCP_IN
> -A P1_IN -p UPD -j UDP_IN
> -A P1_IN -p ICMP -j ICMP_IN
> -A P1_IN -j RETURN
> =20
> -A TCP_IN -p TCP --dport 80 -j ACCEPT
> -A TCP_IN -j RETURN
>=20
>=20
>>the option to specify the protocol is "-p" not "-t" (that specifies the
>>table to operate on)
>>
>>
>>>For any tcp packet that going to P1 and don't have destination port 80=
:=20
>>>
>>>returned to P1_IN chain from TCP_IN chain, then after
>>>returned to FORWARD chain from P1_IN, and finally
>>>dropping the packet after kept log.
>>>
>>>Am I right?
>>
>>yes, assuming the IP P1 is not local to the gateway in question.
>=20
>=20
> IP_OF_P1 is local IP.
> I didn't typed rules for P2_IN and P2_OUT
>=20
>=20
> I am just trying to understand *RETURN* .
>=20
> Thanks
> Mohammad
>=20
>=20

RETURN only says that you stop testing the packet against the rules in=20
the actual chain, return back to the outer chain and continue testing=20
the packet against that rules in the outer chain. E.g.

iptables -P INPUT DROP

iptables -A INPUT -j rule1
iptables -A INPUT -j rule2
iptables -A INPUT -j rule3

iptables -N rule1
iptables -A rule1 -j RETURN
iptables -N rule2
iptables -A rule2 -j RETURN
iptables -N rule3
iptables -A rule3 -j RETURN

So now every packet destined for the local machine always wents through=20
the INPUT chain. The default policy is set to drop.
Now let=C2=B4s say there=C2=B4s a packet for the local machine. It went=C2=
=B4s to the=20
INPUT chain. The INPUT chain sends it to rule1. In rule one the RETURN=20
traget sends it back to the INPUT chain. The INPUT chain sends it to=20
rule2. Rule2 sends it back to the INPUT chain and so on till it is=20
droppped by the default policy.

iptables -P INPUT DROP

iptables -A INPUT -j rule1

iptables -N rule1
iptables -A rule1 -j rule2
iptables -N rule2
iptables -A rule2 -j RETURN
iptables -N rule1
iptables -A rule1 -j RETURN

Again the INPUT chain sends it to rule1. Rule1 sends it to rule2. Rule2=20
sends it via RETURN back to rule1 and rule1 back to INPUT chain where it=20
is dropped via default policy.

I hope this will help you. You can see RETURN always sends a packet back=20
to the outer chain from where it was send to the actual chain.


