From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Gonzatti?= <fred99@libertysurf.fr>
Subject: Re: How to Forward a port (DNAT) ?
Date: Sun, 11 Jul 2004 00:02:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F0676A.5000107@libertysurf.fr>
References: <40F0622F.6090500@libertysurf.fr> <200407102254.29715.Antony@Soft-Solutions.co.uk>
Reply-To: fred99@libertysurf.fr
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407102254.29715.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

>On Saturday 10 July 2004 10:39 pm, Fr=E9d=E9ric Gonzatti wrote:
>
> =20
>
>>My iptables rules are :
>>##########################################"
>>iptables -F
>>iptables -X
>>
>>echo 1 > /proc/sys/net/ipv4/ip_forward
>>
>>iptables -P INPUT DROP
>>iptables -P FORWARD DROP
>>iptables -P OUTPUT DROP
>>
>>iptables -t filter -A INPUT -i lo -j ACCEPT
>>iptables -t filter -A OUTPUT -o lo -j ACCEPT
>>
>>iptables -t nat -A PREROUTING -p tcp --dport 25 -i eth2 -j DNAT --to
>>192.168.2.151:25
>>
>>#################################################"
>>
>>It's a very simple test. But unfortunately it doesn't work.
>>   =20
>>
>
>You need a FORWARD rule to allow the packets through the firewall after be=
ing=20
>DNATted - you also need to allow the reply packets.
>
>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>iptables -A FORWARD -p tcp --dport 25 -d 192.168.2.251 -j ACCEPT
>
>I recommend Oskar Andreasson's tutorial http://iptables-tutorial.frozentux=
.net=20
>to you.
>
>Regards,
>
>Antony.
>
> =20
>
Thanks Antony, I will try this.

Frederic



