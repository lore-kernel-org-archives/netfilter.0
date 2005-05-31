From: Sertys <sertys@supportivo.org>
Subject: Re: mysterious dropped echo replies
Date: Tue, 31 May 2005 11:40:39 +0000 (UTC)
Message-ID: <opsro6aifo76nf2y@xonix>
References: <1117528956.25434.65.camel@athene.bestsolution.at>
	<opsrozalyc76nf2y@xonix> <opsrozlyy176nf2y@xonix>
	<1117539228.25434.82.camel@athene.bestsolution.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Date: Wed, 01 Jun 2005 18:21:44 +0300
In-Reply-To: <1117539228.25434.82.camel@athene.bestsolution.at>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

Well , this line :
iptables -t nat -A Cid3D99741E.0   -d 192.168.100.0/24 -j RETURN

change it to -j DROP and it wont generate any replies. -j RETURN, returns=
 =20
the packet and sends and icmp message to the src!


On Tue, 31 May 2005 13:33:48 +0200, Udo Rader <udo.rader@bestsolution.at>=
 =20
wrote:

> Hi Sertys,
>
> thanks for your reponse. I doubt that my entire script will help much,
> but anyway, I attached it (obfuscated a bit, of course :-)
>
> Yes, we are using traffic shaping (qdisc), but not RP_filter.
>
> The netmask for .240 is find, actually .240 _is_ the router, the router
> sends echo replies to some other hosts in the DMZ for reasons
> unknown ...
>
> And no, this is no PPP network but a leased line instead.
>
> Udo Rader
>
> BestSolution.at GmbH
> http://www.bestsolution.at
>
> On Wed, 2005-06-01 at 15:57 +0300, Sertys wrote:
>> I was totally wrong and realised it a min after sending. In fact why =20
>> don't
>> you post your whole script. Do you use connection limiting? RP_filter?
>> First - check that the netmask is set correctly on 240. As long as the=
y
>> are on the same segment, they aren't suppose to talk via the router. =20
>> They
>> just have to ARP discover each other and talk directly. A machine gets=
 =20
>> to
>> default gw, when the ip is not in the routing table. IS THIS A PPP =20
>> network?
>>
>>
>>
>> On Wed, 01 Jun 2005 15:50:35 +0300, Sertys <sertys@supportivo.org> =20
>> wrote:
>>
>> > On Tue, 31 May 2005 10:42:36 +0200, Udo Rader
>> > <udo.rader@bestsolution.at> wrote:
>> >
>> > Those are illegal packets:
>> >> DROP IN=3D OUT=3Deth1 SRC=3D192.168.100.240 DST=3D192.168.100.10 LE=
N=3D28 =20
>> TOS=3D0x00
>> >> PREC=3D0x00 TTL=3D64 ID=3D32153 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D=
45639 SEQ=3D0
>> > There's no type0&code0 combination.
>> >
>> >
>> >> Hi,
>> >>
>> >> I am stuck with a strange phenonemon where iptables drops packages =
it
>> >> (probably) shouldn't.
>> >>
>> >> The dropped packages are logged like this:
>> >>
>> >> DROP IN=3D OUT=3Deth1 SRC=3D192.168.100.240 DST=3D192.168.100.10 LE=
N=3D28 =20
>> TOS=3D0x00
>> >> PREC=3D0x00 TTL=3D64 ID=3D32153 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D=
45639 SEQ=3D0
>> >>
>> >> So that means that this is about an icmp echo reply, originating fr=
om
>> >> 192.168.100.240, pending to be sent through its internal interface
>> >> (eth1) and destined to 192.168.100.10.
>> >>
>> >> It is completely mysterious to me where this reply comes from, but
>> >> that's not all.
>> >>
>> >> Each of the two hosts involved can ping each other and in the case =
=20
>> of a
>> >> ping, iptables does not drop any packages.
>> >>
>> >> If I shut down 192.168.100.10 (a box within the DMZ), it doesn't ta=
ke
>> >> long until iptables starts to drop packages destined to other boxes=
 =20
>> in
>> >> the DMZ.
>> >>
>> >> One of the first rules in my iptables setup is this:
>> >>
>> >> iptables -A INPUT -s 192.168.100.0/24 -m state --state NEW -j ACCEP=
T
>> >> iptables -A OUTPUT -s 192.168.100.0/24 -m state --state NEW -j ACCE=
PT
>> >> iptables -A FORWARD -s 192.168.100.0/24 -m state --state NEW -j =20
>> ACCEPT
>> >>
>> >> For the internal interface this is the first rule:
>> >>
>> >> iptables -A INPUT -i eth1 -s 192.168.100.0/24 -d 192.168.100.0/24 -=
m
>> >> state --state NEW -j ACCEPT
>> >> iptables -A FORWARD  -i eth1 -s 192.168.100.0/24 -d 192.168.100.0/2=
4 =20
>> -m
>> >> state --state NEW -j ACCEPT
>> >> iptables -A OUTPUT -o eth1 -s 192.168.100.0/24 -d 192.168.100.0/24 =
-m
>> >> state --state NEW -j ACCEPT
>> >> iptables -A FORWARD -o eth1 -s 192.168.100.0/24 -d 192.168.100.0/24=
 =20
>> -m
>> >> state --state NEW -j ACCEPT
>> >>
>> >> The rule that drops the package is the very last one (the 'catch =20
>> all')
>> >> rule.
>> >>
>> >> This is something new, because I haven't changed the iptaples setup=
 =20
>> for
>> >> quite some time, so if anybody has any guess on what's going on her=
e.
>> >>
>> >> Udo Rader
>> >>
>> >> BestSolution.at GmbH
>> >> http://www.bestsolution.at
>> >
>> >
>> >
>>
>>
>>



--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

