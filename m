From: =?ISO-8859-1?Q?Gerard_Par=EDs_Aixal=E0?=
	<gerard.paris@estudiants.urv.cat>
Subject: Re: Filtering MAC addresses and Multicast
Date: Wed, 02 Aug 2006 13:55:04 +0200
Message-ID: <44D09298.20503@estudiants.urv.cat>
References: <44CF1266.5090109@estudiants.urv.cat> <44CFB3EE.2010007@rtij.nl>
	<44D05188.3040506@estudiants.urv.cat>
	<44D052DD.3060103@rtij.nl> <44D0731A.4070507@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44D0731A.4070507@freemail.hu>
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

G=E1sp=E1r Lajos wrote:
> Martijn Lievaart =EDrta:
>> Gerard Par=EDs Aixal=E0 wrote:
>>
>>> Martijn Lievaart wrote:
>>>
>>>> Gerard Par=EDs Aixal=E0 wrote:
>>>>
>>>>> Hello all,
>>>>>
>>>>> /sbin/iptables -t mangle -A PREROUTING -m mac --mac-source=20
>>>>> 00:06:5B:12:C9:7A -j DROP
>>>>> /sbin/iptables -t mangle -A PREROUTING -m mac --mac-source=20
>>>>> 00:06:5B:13:4A:69 -j DROP
>>>>>
>>>>> These rules drop Unicast traffic but they do not drop Multicast=20
>>>>> traffic.
>>>>
>>>>
>>>> Multicast traffic is sent to specific multicast MAC adresses.
>>>> Learn how multicast works and drop the corresponding MAC addresses.=20
>>>> (No I don't have a link handy, tcp/ip illustrated would be a good,=20
>>>> but pricy source).
>>>>
>>>> HTH,
>>>> M4
>>>>
>>>
>>> I know how multicast works, but I want to drop packets with the=20
>>> specified MAC source adresses. In multicast, the source address is=20
>>> always a real one, to identify which computer the packet came from=20
>>> (the destination address, both MAC and IP, is a special one).
>>
>>
>> <blush> Oops, my bad. Should read better. Sorry, Can't help you=20
>> there. If you don't get a reply on this list in a few days, maybe ask=20
>> netfilter-devel, because this looks like a bug.
>>
>> M4
>>
>>
>>
>>
> Try this:
>
> iptables -t mangle -A PREROUTING -j DROP -m mac --mac-source=20
> XX:XX:XX:XX:XX:XX -m pkttype --pkt-type multicast
>
>
I tried this.
And this:
iptables -t mangle -I PREROUTING -d 225.0.0.4 -j DROP       # 225.0.0.4=20
is the multicast address
iptables -t mangle -I PREROUTING -j DROP
But the multicast traffic still arrives at the destination computer.

