From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: ARP Requests/Replies
Date: Sun, 27 Jun 2010 11:28:23 +0100
Message-ID: <4C2727C7.20605@abpni.co.uk>
References: <4C26154B.8050008@abpni.co.uk> <4C268A7A.6090207@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C268A7A.6090207@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On 27/06/10 00:17, Pascal Hambourg wrote:
> Hello,
>
> Jonathan Tripathy a =E9crit :
>   =20
>> I'm trying to set up ebtables on my Xen host. What I'm trying to do,=
 is
>> make sure that each guest can only access the bridge on the xen host
>> using the "legal" mac address assigned to it.
>>
>> The 2 rules I'm using are this:
>>
>> ebtables -I FORWARD -d $legal_mac_of_guest -o $vif_of_guest -j ACCPE=
T
>> ebtables -I FORWARD -s $legal_mac_of_guest -i $vif_of_guest -j ACCPE=
T
>>     =20
> Note : s/ACCPET/ACCEPT/
>
>   =20
>> While the above 2 rules do allow normal IP traffic, they seem to blo=
ck
>> ARP requests/replies working properly.
>>     =20
> By allowing only the unicast host address as a destination, you block
> any broadcast and multicast traffic. ARP requests use broadcast, IPv6
> neighbour discovery uses multicast. Note that IP broadcast and multic=
ast
> traffic is also blocked.
>
> You must also allow broadcast/multicast addresses as a destination :
>
> ebtables -I FORWARD -d multicast -o $vif_of_guest -j ACCEPT
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   =20

Thanks for the reply. What I ended up doing was this:

ebtables -I FORWARD -p ARP -o $vif_of_guest -j ACCPET


The ARP-Reply (is-at) frame seems to have the source field set properly=
,=20
so no new rule was required to allow arp replies from the respective gu=
est.

Think that's safe enough?

Thanks

