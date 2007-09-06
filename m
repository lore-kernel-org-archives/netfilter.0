From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ipt_MASQUERADE issue
Date: Thu, 06 Sep 2007 18:38:06 +0200
Message-ID: <46E02CEE.2030503@plouf.fr.eu.org>
References: <46E0132F.5020802@plouf.fr.eu.org>
	<e10edde8f4df7199c6d1910e8747b603@62.112.192.6>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e10edde8f4df7199c6d1910e8747b603@62.112.192.6>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

stevesz@enternet.hu a =E9crit :
>>
>>I am not sure I understand what the problem is. When the IP address=20
>>changes, any existing connections that were using the old IP address ar=
e=20
>>broken. So new connections have to be established using the new IP=20
>>address. New P2P connections should be identified and marked again by=20
>>ipp2p and CONNMARK, as the old ones were. Or am I missing something ?
>=20
> In my firewall config it is allowed for any packet to go out from my lo=
cal
> network to the internet even it is not in the conntrack.

Ok. You could change this behaviour by blocking outgoing packets in the=20
INVALID state.

> So after my IP
> has changed and the conntrack table's got flushed, TCP connections cont=
inue
> traversing through the firewall

Sorry but I still do no see how this is possible. The remote hosts=20
cannot continue previously established TCP connections ("established"=20
according to the TCP/IP stack, not Netfilter conntrack) with you if your=20
apparent IP address changes. They will continue to send traffic to your=20
old IP address and ignore traffic from your new address. A TCP=20
connection is defined by the source and destination addresses and ports.=20
If any of these 4 elements changes, the connection is broken.

> My plan is to modify the code, so it would replace the old
> addresses with the new one in the conntrack table keeping the port
> assignments.

Same remark as above. You cannot change the address of an established=20
TCP connection.

