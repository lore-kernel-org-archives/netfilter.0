From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NDP and ebtables
Date: Tue, 31 Aug 2010 01:31:04 +0200
Message-ID: <4C7C3F38.8010301@plouf.fr.eu.org>
References: <4C7A3C72.6070105@abpni.co.uk> <4C7A740D.8010908@plouf.fr.eu.org> <4C7A973D.7060204@abpni.co.uk> <4C7AB0E9.6080708@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7AB0E9.6080708@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>>
>> So, do you think I should just have my second rule then? The thing i=
s=20
>> though, is that bridges are know to "broadcast" all traffic everywhe=
re=20
>> for a few seconds when their configuration changes. I don't really=20
>> want this to happen. Can you please help me with some rules to preve=
nt=20
>> yet, and also stop spoofing?
>>
> How about something like this:
>=20
> /usr/local/sbin/ebtables -N OUT
> /usr/local/sbin/ebtables -P OUT DROP
> /usr/local/sbin/ebtables -I OUT -o "$vif" -d "$mac" -j ACCEPT
> /usr/local/sbin/ebtables -I OUT -p ARP -o "$vif" -j ACCEPT
>=20
> /usr/local/sbin/ebtables -I FORWARD -i "$vif" -s "$mac" -j OUT
>=20
> Woudn't that work nicely?

I guess so, except for IPv6 NDP (see below).
Note that you don't need a separate ARP rule for each port.

> That is, stop source address spoofing, as well=20
> as make sure that outgoing traffic is set for the correct MAC address=
=2E.

> I appreciate that my above rules would block all multicast/broadcast=20
> traffic (except ARP), however since this is in a hosting environment,=
=20
> that's probably ok isn't it?

NDP uses multicast and will break if you drop all multicast. You can
however accept only the multicast addresses the host listens to (see my
first reply for how to get the list).
