From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: chains in the same table
Date: Thu, 6 May 2004 16:10:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679322@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Jee J.Z." <jz105@york.ac.uk>, netfilter@lists.netfilter.org

Jee J.Z. wrote:
> Hi Antony, Amit, Frank, and Klemen,
>=20
> Thank you all for your replies. Your answer actually is what I was
> expected. However, I did an experiment which seems to show it is not
> the case, and therefore I got confused.
>=20
> My network structure is as follows:
>=20
>  PC1
>  (eth0:global_ip_1)
>    |
>    |
>  (eth0:global_ip_2)
>  PC2
>  (eth1:192.168.0.1)
>    |
>    |
>  (eth1:192.168.0.2)
>  PC3
>=20
> I put the following rules on the PC2:
>=20
> iptables -F
> iptables -F -t nat
> iptables -I FORWARD -j QUEUE
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip_2
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2
>=20
> echo '1' >/proc/sys/net/ipv4/ip_forward
>=20
> Since I didn't put in the rules like "iptables -P INPUT DROP" and
> "iptables -P OUTPUT DROP", I expect traffics that addressed to PC2
> will not be passed on to the FORWARD chain, and therefore they will
> not be queued to userspace. However, it seems not the case. When I
> ftp or ping from PC1 to PC2 (addressed to PC2), all the packets are
> queued to userspace and if accepted from userspace are then DNATed to
> PC3. Could you explain this to me? Or am I missing something obvious?
>=20

When sending a packet from Machine A to Machine B through Machine C, the
following rules apply:

Machine A
OUTPUT
POSTROUTING

Machine B
PREROUTING
INPUT

Machine C
PREROUTING
FORWARD
POSTROUTING

Note: Each table inside each chain is traversed. So, in the first
example, the Machine A would really look like this:

Machine A
Application
OUTPUT mangle
OUTPUT filter
OUTPUT nat
OUTPUT raw
Routing Decision
POSTROUTING
Routing Decision (if needed)

> Cheers,
> Jee
>=20
>=20
>> On Thursday 06 May 2004 10:48 am, Jee J.Z. wrote:
>>=20
>>> Hi all,
>>>=20
>>> I'm asking a basic question that in the same table (for example,
>>> the filter table), if a packet hit the INPUT chain while no rules
>>> are in the INPUT chain and the default policy is ACCEPT, will the
>>> packet be passed on to the FORWARD chain? If accepted again, be
>>> passed on to the OUTPUT chain?=20
>>=20
>> Any single packet only traverses one of the above chains.
>>=20
>> If it's addressed *to* the machine, it goes through INPUT only.
>>=20
>> If it's addressed *from* the machine, it goes through OUTPUT only.
>>=20
>> If it's going *from* somewhere else *to* somewhere else (ie: being
>> routed), it goes through FORWARD only.=20
>>=20
>> (I guess there's an exception that loopback packets will go through
>> both OUTPUT and INPUT, but that's unusual.)
>>=20
>> Regards,
>>=20
>> Antony.
>>=20
>> --
>> Ramdisk is not an installation procedure.
>>=20
>>                                                      Please reply to
>>                                                            the list;
>> please don't CC me.=20

