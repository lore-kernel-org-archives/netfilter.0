From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ARP Requests/Replies
Date: Sun, 27 Jun 2010 13:18:01 +0200
Message-ID: <4C273369.60001@plouf.fr.eu.org>
References: <4C26154B.8050008@abpni.co.uk> <4C268A7A.6090207@plouf.fr.eu.org> <4C2727C7.20605@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2727C7.20605@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>>   =20
>>> I'm trying to set up ebtables on my Xen host. What I'm trying to do=
, is
>>> make sure that each guest can only access the bridge on the xen hos=
t
>>> using the "legal" mac address assigned to it.
>>>
>>> The 2 rules I'm using are this:
>>>
>>> ebtables -I FORWARD -d $legal_mac_of_guest -o $vif_of_guest -j ACCP=
ET
>>> ebtables -I FORWARD -s $legal_mac_of_guest -i $vif_of_guest -j ACCP=
ET
>>>     =20
>>> While the above 2 rules do allow normal IP traffic, they seem to bl=
ock
>>> ARP requests/replies working properly.
>>>     =20
>> By allowing only the unicast host address as a destination, you bloc=
k
>> any broadcast and multicast traffic. ARP requests use broadcast, IPv=
6
>> neighbour discovery uses multicast. Note that IP broadcast and multi=
cast
>> traffic is also blocked.
>>
>> You must also allow broadcast/multicast addresses as a destination :
>>
>> ebtables -I FORWARD -d multicast -o $vif_of_guest -j ACCEPT
>=20
> Thanks for the reply. What I ended up doing was this:
>=20
> ebtables -I FORWARD -p ARP -o $vif_of_guest -j ACCPET
>=20
> The ARP-Reply (is-at) frame seems to have the source field set proper=
ly,=20
> so no new rule was required to allow arp replies from the respective =
guest.
>=20
> Think that's safe enough?

Be aware that it solves the problem only for ARP, but not for the other
protocols that may use broadcast or multicast.
