From: =?ISO-8859-1?Q?Gerard_Par=EDs_Aixal=E0?=
	<gerard.paris@estudiants.urv.cat>
Subject: Re: Filtering MAC addresses and Multicast
Date: Wed, 02 Aug 2006 09:17:28 +0200
Message-ID: <44D05188.3040506@estudiants.urv.cat>
References: <44CF1266.5090109@estudiants.urv.cat> <44CFB3EE.2010007@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CFB3EE.2010007@rtij.nl>
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

Martijn Lievaart wrote:
> Gerard Par=EDs Aixal=E0 wrote:
>
>> Hello all,
>>
>> /sbin/iptables -t mangle -A PREROUTING -m mac --mac-source=20
>> 00:06:5B:12:C9:7A -j DROP
>> /sbin/iptables -t mangle -A PREROUTING -m mac --mac-source=20
>> 00:06:5B:13:4A:69 -j DROP
>>
>> These rules drop Unicast traffic but they do not drop Multicast traffi=
c.
>
> Multicast traffic is sent to specific multicast MAC adresses.
> Learn how multicast works and drop the corresponding MAC addresses.=20
> (No I don't have a link handy, tcp/ip illustrated would be a good, but=20
> pricy source).
>
> HTH,
> M4
>

I know how multicast works, but I want to drop packets with the=20
specified MAC source adresses. In multicast, the source address is=20
always a real one, to identify which computer the packet came from (the=20
destination address, both MAC and IP, is a special one).

Gerard

