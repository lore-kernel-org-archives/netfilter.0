From: Romain Moyne <aero_climb@yahoo.fr>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 15:03:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400157A0.70902@yahoo.fr>
References: <4001239D.7010904@yahoo.fr> <1073827964.769.16.camel@elendil.intranet.cartel-securite.net> <40015381.1090803@yahoo.fr> <200401111355.44937.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401111355.44937.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Antony Stone a =E9crit :

>On Sunday 11 January 2004 1:45 pm, Romain Moyne wrote:
>
> =20
>
>>Cedric Blancher a =E9crit :
>>
>>   =20
>>
>>>	iptables -t nat -A POSTROUTING -s $LAN -d $WB -j SNAT --to $ETH0
>>>     =20
>>>
>>What must I write instead of $LAN and $ETH0 ?
>>   =20
>>
>
>$LAN is the network range of the machines you might have packets coming fr=
om=20
>(note it is the source address in the above rule) and $ETH0 is the IP addr=
ess=20
>of the interface on your netfilter machine.
>
>Perhaps $LAN=3D192.168.0.0/24 and $ETH0=3D192.168.0.1 for your network?
>
>Antony.
>
> =20
>
Thanks to everybody ! It works fine now ;)
Thanks you

Romain


