From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Source and Destination port 0
Date: Tue, 15 Jul 2003 12:36:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E359A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Geffrey Velasquez <g_netfilter@netfids.com>, Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org


How about the fact that these packets are for T/TCP aka Transactional
TCP, not regular TCP!

-----Original Message-----
From: Geffrey Velasquez [mailto:g_netfilter@netfids.com]=20
Sent: Tuesday, July 15, 2003 12:16 PM
To: Ramin Dousti
Cc: netfilter@lists.netfilter.org
Subject: Re[2]: Source and Destination port 0

More detail:

RD> If the FORWARD chain is not blocking these faulty packets it might
mean
RD> that the packets are being generated on the firewall itself.

Maybe, but in this suposed case, my firewall had to be compromised,
It has installed tripwire and.. I don't see signs of intrussion.

RD>  Try to block
RD> them on the OUTPUT chain as well and see what happens.

I put the rules also in the OUTPUT chain, and I still continue getting
the packets

RD> The next step would
RD> be to figure out why you get them.

Its a sample of the snort logs, the destination IP is an internal
NATed IP address, maybe source IP is spoffed:

[**] [116:56:1] (snort_decoder): T/TCP Detected [**]
07/15-13:46:24.988459 216.136.173.130:0 ->  . . . :0
TCP TTL:52 TOS:0x0 ID:59827 IpLen:20 DgmLen:68 DF
******S* Seq: 0x65FF5C67  Ack: 0x0  Win: 0xFFFF  TcpLen: 48

[**] [116:56:1] (snort_decoder): T/TCP Detected [**]
07/15-13:47:20.446750 66.163.169.17:0 ->  . . . :0
TCP TTL:51 TOS:0x0 ID:32453 IpLen:20 DgmLen:68 DF
******S* Seq: 0xFE485E60  Ack: 0x0  Win: 0xFFFF  TcpLen: 48

I will continue investigating, but someone could give me
recommendations?


Regards,
Geffrey


RD> Ramin

RD> On Tue, Jul 15, 2003 at 12:16:44PM -0500, Geffrey Velasquez wrote:

>> Hello Friends,
>>=20
>> I have in my IDS logs packets comming from outside to DMZ servers
with
>> source port 0 and destination port 0.
>>=20
>> The IDS is located in the DMZ network, and I have an iptables
>> firewall, kernel-2.4.18-26.1.99_kb2c.1foo over RH 8 (that is the
>> kernel with superfreeswan patches).
>>=20
>> I tried with this couple of rules on top of FORWARD chain:
>>=20
>> $IPT -A FORWARD -p tcp --sport 0 -j LOG --log-prefix "Zero: "
>> $IPT -A FORWARD -p tcp --sport 0 -j DROP
>>=20
>> also:
>>=20
>> $IPT -A FORWARD -p tcp --sport 0 --dport 0 -j LOG --log-prefix "Cero:
"
>> $IPT -A FORWARD -p tcp --sport 0 --dport 0 -j DROP
>>=20
>> After that I continue viewing the bad packets on IDS, how could I
>> filter this kind of packets?
>>=20
>>=20
>> --=20
>> Best regards,
>>  Geffrey                          mailto:g_netfilter@netfids.com
>>=20



