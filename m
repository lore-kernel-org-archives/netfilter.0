From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: VoIP conntrack issue
Date: Tue, 13 Nov 2012 11:32:33 +0200
Message-ID: <50A213B1.4050601@ngtech.co.il>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

On 11/13/2012 5:20 AM, J=F6rn Krebs wrote:
> Not really, as I use the devices behind the firewall, in many
> networks, so I need one setup that works.
>
> But to be honest, I don't like to start this discussion:
> My question is, why can netfilter not reuse the same port?
> The host inside the firewall is the same, so why can't linux manage a
> port mapping, which says: If a UDP packet comes from host A to us,
> port 1234, AND host B, port 1234, map both to internal host Int1?
> (under the assumption, that Int1 tried to establish the connection
> with Host A and B first).
>
> The point is: There is NO port mapping clash, why is netfilter
> creating one? and does a port remap? (For UDP ... TCP is different.)
Are you sure you understand NAT stun and how port prediction works??
Try to talk IP and ports in a diagram that will make sense to the eye=20
please.

Regards,
Eliezer
