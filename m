From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Dropping network "noise"
Date: Sun, 13 Feb 2005 15:09:26 +0200
Message-ID: <420F5186.5060703@hotpop.com>
References: <200502130928.41225.e-boogie@yandex.ru>
	<1108296226.10876.16.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1108296226.10876.16.camel@nostromo.bgsecm.com>
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

Jose Maria Lopez Hernandez wrote:

>El dom, 13-02-2005 a las 09:28 +0300, Mikhail Zotov escribi=C3=B3:
> =20
>
>>Hello everybody,
>>
>>I have a Linux machine (with a static routable IP address)
>>connected to a windoops LAN.  As is known, there is certain
>>"noise" in windoops networks, which can be silently dropped
>>by a rule like this:
>>
>>iptables -A INPUT -p udp --dport 135:139 -j DROP
>>   =20
>>
>
>That's OK, but also DROP port 445 because there's also a great
>amount of traffic in that port.
>
> =20
>
How exactly is that OK ? i guess you don't have anything listening on=20
135-139/udp, right ?
So you won't "save" any traffic with a rule like that, that's how=20
ethernet works.
The only point in a rule like that maybe is - if you are logging not=20
matched packets at the end of the filter table/INPUT chain and don't=20
want your logs flooded by that broadcast traffic.

>>I have found that this "noise" can also be effectively blocked
>>by the following rule:
>>
>>iptables -A INPUT -d ! $IP.ADDRESS.OF.MY_BOX -j DROP
>>   =20
>>
>
>Yes, it's a rule to prevent spoofing. It's OK *if* and *only if*
>the $IP.ADDRESS.OF.MY_BOX it's really the IP address of your
>box, and the *only* IP address of your box (you can have more
>than one for various reasons).
>
> =20
>
>>I haven't noticed anything going wrong yet, still I'd like to
>>know: Does this rule have a (potential) drawback?  Can it break
>>anything in case I have NFS or obtain IP address via DHCP or
>>in any other situation?
>>   =20
>>
>
>NFS doesn't have any problem, but if you receive your IP via
>DHCP you must change the IP in the rule with the one received.
>And also if you use Zeroconf you must have a rule to accept
>the traffic for the Zeroconf IP.
>
> =20
>
>>A similar question goes for the case of a Linux router/gateway
>>protecting a LAN (with machines with routable IP addresses).
>>Can the following rules do any harm?
>>
>>iptables -A FORWARD -i $EXTERIOR_INTERFACE -d $LAN.BROADCAST -j DROP
>>   =20
>>
>
>If you are don't want to receive traffic your broadcast it's OK.
> =20
>
same thing here ... you will receive that broadcast traffic no matter=20
what. dropping it won't help.

> =20
>
>>iptables -A FORWARD -i $EXTERIOR_INTERFACE -d ! $LAN.IP.ADDRESSES.RANGE=
 -j DROP
>>   =20
>>
>
>And this it's another anti-spoofing rule. I'll tell you the same that
>for the previous rule. It's OK if the $LAN.IP.ADDRESSES.RANGE it's OK.
>
> =20
>
>>Thanks in advance!
>>
>>--
>>Mikhail
>>   =20
>>
>
>Regards.
>
> =20
>
regards,
Georgi Alexandrov

