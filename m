From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Port-forwarding Perfomance
Date: Thu, 24 Feb 2005 06:29:03 -0800
Message-ID: <421DE4AF.6040702@wildcash.com>
References: <421D2F04.8090100@wildcash.com>
	<1109156169.11713.2.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1109156169.11713.2.camel@nostromo.bgsecm.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

Still having trouble with port-forwarding performance.

As much as I look I can't find anything wrong.

I have one Linux 66.283.12.21 box and one Windows box 192.168.0.10

I can download a file of the linux box at around 140K/s

That very same file on the Windows machine is around 15K/s using DNAT=20
and Masq/Forwarding.

I'm very disappointed and did not expect to see anything like this, I=20
had more like 10% in mind ...

The linux box is not under heavy load and there is only 431 connections=20
being tracked.

Hmm .. I must have a problem else where, it just too hard to believe=20
those download rate numbers.


Jose Maria Lopez Hernandez wrote:

>El mi=C3=A9, 23-02-2005 a las 17:33 -0800, Rudi Starcevic escribi=C3=B3:
> =20
>
>>Hi,
>>
>>I have www port-forwarding setup and running OK.
>>
>>However I wonder if they way I have configured it is not the most=20
>>optimal for speed and performance.
>>
>>I have a default policy of DROP with a total of about 30 rules.
>>
>>These rules below do my www port-forwarding, can you see if there is a=20
>>better way to do this ?
>>
>># ENABLE FORWARDING / NAT / MASQUERADING
>>echo "1" > /proc/sys/net/ipv4/ip_forward
>>
>># NAT Forwarding Setup
>>$IPTABLES --table nat --append POSTROUTING --out-interface $ETH0 -j=20
>>MASQUERADE
>>   =20
>>
>
>The only thing I can say about your rules it's that if you
>know the firewall IP it's much better to use SNAT than
>MASQUERADE, because you gain some speed with it.
>
> =20
>
>>$IPTABLES -A FORWARD -i $ETH1 -j ACCEPT
>>$IPTABLES -A FORWARD -i $ETH0 -j ACCEPT
>>$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>># http Port-Forwarding setup
>>$IPTABLES -t nat -A PREROUTING -i $ETH0 -p tcp --dport 80 -d $MEDIA1_IP=
=20
>>-j DNAT --to $MEDIA1_LO:80
>>   =20
>>
>
>The rule it's OK, I don't know how you can do it better to achieve
>more speed.
>
> =20
>
>>Many thanks,
>>Kind regards
>>Rudi
>>   =20
>>
>
>Regards.
>
> =20
>



--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


