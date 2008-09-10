From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Thu, 11 Sep 2008 00:48:54 +0200 (CEST)
Message-ID: <7ffdca96fd513b795e9a5996f03c72bd.squirrel@www.arcoscom.com>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>
    <48C6EF5B.3030005@riverviewtech.net>
    <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>
    <48C7D68C.2070902@riverviewtech.net>
    <a101ab37cddb703b5cb3cc863b96b846.squirrel@www.arcoscom.com>
    <48C82F38.3070400@riverviewtech.net>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C82F38.3070400@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks again, I'll answer below:

El Mie, 10 de Septiembre de 2008, 22:34, Grant Taylor escribi=F3:
> On 09/10/08 14:13, ArcosCom Linux User wrote:
>> Thanks for the response, I'll answer the questions below:
>
> You are welcome.
>
>> Because I cant have another uplink in the router place and I need to
>> put that in another building that can have another uplink.
>
> Ok... Let me see if I (now) understand you right.  You have your rout=
er
> in question along with uplinks 1 and 2 (and their associated modems /
> routers) in one location and uplink 3 (and it's associated modem /
> router) and (part of) the LAN are located in another building?  Furth=
er
> you can't make an additional connection between the buildings to conn=
ect
> uplink 3 to the router?
>

I can't, there's no visible line between builds.

>> Ah, no, this is not the reason. It's a "logistic" reason only.
>
> *nod*  (Logistics being proximity and / or cabling)
>
>> Yes, that appears to be the problem (seeing tcpdumps in each
>> interface).
>
> *nod*
>
>> Do you have any suggestion about that parameters on that interfaces?
>
> I don't recall the option(s) that need to be set off hand, but I thin=
k
> you are looking for the the ARP /proc entries that tell the system to
> only reply to ARP queries if they come in an interface that has an IP=
 in
> the subnet that the query is for.  Thus when you receive ARP queries =
on
> eth0 and eth3, the system should only reply from eth0 or eth3 dependi=
ng
> on what IP is being ARPed for (the uplink 3 or LAN IP).
>

Appears that, between e-mail and e-mail, I have a workaround changing a=
rp
parameters to the interfaces.

Many thanks!!

> Something else to consider is VLAN trunking across the connection fro=
m
> eth0 to the LAN(s).  Heck, you might consider putting all six network=
s
> on its own VLAN: u1, u2, u3, l1, l2, and l3.  If you trunk across the
> connection between buildings, you can access the uplink modems any wh=
ere
> you can connect to the VLAN.  I've successfully had a cable modem (th=
at
> was connected to its own VLAN) at the opposite end of a campus from t=
he
> router with out any problems at all.
>

Uhmm ... VLANs ... sound fine!!

Do you know any URL to begin with VLANs?

Thanks!!

>
>
> Grant. . . .
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


