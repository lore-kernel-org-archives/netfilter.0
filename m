From: <stevesz@enternet.hu>
Subject: Re: ipt_MASQUERADE issue
Date: Fri, 7 Sep 2007 09:51:32 +0200
Message-ID: <fc263e8bf456fa849f0cb7b1e4602138@62.112.192.6>
References: <46E02CEE.2030503@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46E02CEE.2030503@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thu, 06 Sep 2007 18:38:06 +0200, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> stevesz@enternet.hu a =C3=A9crit :
>>>
>>>I am not sure I understand what the problem is. When the IP address=20
>>>changes, any existing connections that were using the old IP address are
>=20
>>>broken. So new connections have to be established using the new IP=20
>>>address. New P2P connections should be identified and marked again by=20
>>>ipp2p and CONNMARK, as the old ones were. Or am I missing something ?
>>=20
>> In my firewall config it is allowed for any packet to go out from my
> local
>> network to the internet even it is not in the conntrack.
>=20
> Ok. You could change this behaviour by blocking outgoing packets in the=20
> INVALID state.
>=20
>> So after my IP
>> has changed and the conntrack table's got flushed, TCP connections
> continue
>> traversing through the firewall
>=20
> Sorry but I still do no see how this is possible. The remote hosts=20
> cannot continue previously established TCP connections ("established"=20
> according to the TCP/IP stack, not Netfilter conntrack) with you if your =

> apparent IP address changes. They will continue to send traffic to your=20
> old IP address and ignore traffic from your new address. A TCP=20
> connection is defined by the source and destination addresses and ports. =

> If any of these 4 elements changes, the connection is broken.
>=20
>> My plan is to modify the code, so it would replace the old
>> addresses with the new one in the conntrack table keeping the port
>> assignments.
>=20
> Same remark as above. You cannot change the address of an established=20
> TCP connection.

Hey, UR absolutely right. I've been thinking too fast. Thanx for correcting
me. But I still don't know why ipp2p does not recognize the resetup. Maybe,
it does not know that 'command'. I think, I'll have to make a capture and
try to isolate the resetup message(s), and the report it to the developer
of
ipp2p.

Thanx again.
Steve


