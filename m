From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: NDP and ebtables
Date: Sun, 29 Aug 2010 18:22:05 +0100
Message-ID: <4C7A973D.7060204@abpni.co.uk>
References: <4C7A3C72.6070105@abpni.co.uk> <4C7A740D.8010908@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A740D.8010908@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On 29/08/10 15:51, Pascal Hambourg wrote:
> Hello,
>
> Jonathan Tripathy a =E9crit :
>   =20
>> I'm just trailing out ipv6 on my network. Currently, all my bridge p=
orts
>> are protected from MAC address spoofing by using ebtables:
>>
>> /usr/local/sbin/ebtables -I FORWARD -p ARP -o "$vif" -j ACCEPT
>> /usr/local/sbin/ebtables -I FORWARD -i "$vif" -s "$mac" -j ACCEPT
>> /usr/local/sbin/ebtables -I FORWARD -o "$vif" -d "$mac" -j ACCEPT
>>
>> As you can see above, I allow all ARP packets to flow to the host
>> (who-has). This allows ARP resolution to work. Is-at works at the so=
urce
>> MAC address is set in the frame.
>>
>> However, adding IPv6 to the mix is a little trickier. As it turns ou=
t,
>> IPv6 doesn't use ARP, but uses NDP.
>>
>> Is there any way to make NDP work with ebtables, but still preventin=
g
>> MAC address spoofing?
>>     =20
> Sure : don't filter on the destination address, or at least accept
> related multicast addresses (see "ip -f link maddr" on the host).
>
> Spoofing is about the source, not the destination. If the bridge code
> decides to forward a packet to some port even when the destination
> address is not the address of a host connected to that port, it has s=
ome
> reason to do so :
> - the destination is multicast of broadcast,
> - the destination is unicast but unknown, thus treated as broadcast.
>
> You can safely drop in the latter case, not in the former.
>
> Note that your 3rd rule accepts packets from any source address, thus
> not preventing spoofing.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20

Hi Pascal,

Well spotted about my 3rd rule above!

So, do you think I should just have my second rule then? The thing is=20
though, is that bridges are know to "broadcast" all traffic everywhere=20
for a few seconds when their configuration changes. I don't really want=
=20
this to happen. Can you please help me with some rules to prevent yet,=20
and also stop spoofing?

Thanks
