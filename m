From: Daniel Rycaj <daniel@rycaj.net>
Subject: Re: AW: linux, kernel 2.6.10, vlans and IPsec problem
Date: Thu, 10 Feb 2005 14:11:44 +0100
Message-ID: <1553767597.20050210141144@rycaj.net>
References: <47D438A0510BD611B9470002A58EDAE70770A884@mchh2a6e.mchh.siemens.de>
Reply-To: Daniel Rycaj <daniel@rycaj.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <47D438A0510BD611B9470002A58EDAE70770A884@mchh2a6e.mchh.siemens.de>
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
To: Stindl Wolfgang EXT <Wolfgang.Stindl.extern@icn.siemens.de>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

You're right. Wrong list. I've solved the problem however.
Sorry for messing up.


Hello Stindl,

Thursday, February 10, 2005, 2:08:05 PM, you wrote:

SWE> Hi,

SWE> Well, I don't understand where your problem is.
SWE> If you have disabled netfilter, than why do you think your
SWE> ipsec problem is an netfilter issue?
SWE> The packets in your trace have a size of 88 byte. So
SWE> packet-size shouldn't be an issue too.
SWE> So what exactly doesn't work?

SWE> Regards
SWE> wolfgang

>> -----Urspr=FCngliche Nachricht-----
>> Von: netfilter-bounces@lists.netfilter.org=20
>> [mailto:netfilter-bounces@lists.netfilter.org] Im Auftrag von=20
>> Daniel Rycaj
>> Gesendet: Donnerstag, 10. Februar 2005 12:15
>> An: netfilter@lists.netfilter.org
>> Betreff: linux, kernel 2.6.10, vlans and IPsec problem
>>=20
>>=20
>> Hi all,
>>=20
>> details:
>> linux fedora 3 (kernel compiled from official sources)
>> iptables 1.2.11 (compiled from sources too)
>> vlan support turned on (vconfig from cvs)
>>=20
>> I have following situation:
>>=20
>>=20
>>                  eth0    eth1.X(vlans)
>> internet----------[linux]-----------------[clients]
>>=20
>>=20
>> I *DO NOT* use private addresses so I don't use
>> NAT at all (just packet forwarding).
>>=20
>> One of my clients tries to establish IPsec connection
>> to a host located somewhere outside of my network
>> and it doesn't work.
>>=20
>> During the tests I removed all firewall rules.
>>=20
>> tcpdump shows me:
>>=20
>> [root@GW]# tcpdump -n -i eth1.9 -vv
>> tcpdump: listening on eth1.9, link-type EN10MB (Ethernet),=20
>> capture size 96 bytes
>> 12:09:59.200139 IP (tos 0x0, ttl 116, id 7059, offset 0, flags [none],
>> proto 50, length: 88) XX.XX.XX.XX > YY.YY.YY>YY:=20
>> ESP(spi=3D0x139c2705,seq=3D0x35b)
>> 12:10:01.767596 IP (tos 0x0, ttl 128, id 49969, offset 0, flags
>> [none], proto 50, length: 88) YY.YY.YY.YY > XX.XX.XX>XX:=20
>> ESP(spi=3D0x43b9ff86,seq=3D0x3d3)
>>=20
>> I tried to lower MTU on eth1.9 but it didn't help.
>> Any ideas ?
>>=20
>>=20
>> --=20
>> Best regards,
>>  Daniel                          mailto:daniel@rycaj.net
>>=20
>>=20
>>=20



--=20
Best regards,
 Daniel                            mailto:daniel@rycaj.net



