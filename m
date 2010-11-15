From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: BROUTING VLANS
Date: Mon, 15 Nov 2010 18:12:56 +0100
Message-ID: <AANLkTi=Dy1Yg1YMpd3YBGN_vipmBCtH7OK-8-_j+SstK@mail.gmail.com>
References: <0619127E-C439-4A2D-A720-30C5B1FD25FA@gmail.com> <4CE1632F.1080104@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=EcPcmtJRQxGwv+FUcjObUM8jDuls6M+mJ2e0W3dhCoI=;
        b=cRNAOedIq3Ae5ukJohTwuHW/8mT81l0Nq/Wv25S30WpWqfazzR7xnK40GAyYcxZXS2
         SorBASleZWjHnNWKH/QRZqhoxS+ThEdZs5Zb3AxGV3+eDMqEbpC3zmZaakBQ1xL2apio
         uMls89WcXpAnEWsGmlFLtEZDEbak452NQXsBQ=
In-Reply-To: <4CE1632F.1080104@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

I'm not sure I realise what you consider to be a problem. Anyway, FWIW
we have several linux routers each with several hundred
vlan-interfaces, I think about 600 at most currently. We are doing ip
routing, but not bridging, for these. Not seeing any problems.

/Oskar


2010/11/15 Grant Taylor <gtaylor@riverviewtech.net>:
> On 11/15/10 05:02, Asher Awelan wrote:
>>
>> QUESTION:
>> Is there a way to broute the vlans to the eth1 interface and not hav=
e to
>> create every interface and register every vlan... or perhaps strip t=
he vlan
>> id (after logging of course)...
>
> It /might/ be possible to strip the VLAN tags and send the traffic on=
 it's
> way with out the need for all the vlan interfaces. =A0But, I don't kn=
ow that
> it will be possible (at least as easily) to re-tag the returning traf=
fic.
>
> Something you might consider doing is moving the (un)tagging / trunki=
ng in
> to a user space application that can dynamically add and remove the V=
LAN
> tags with out needing kernel support or vlan interfaces. =A0- =A0I'm =
just typing
> raw theories out my (you know what) and would have to give this quite=
 a bit
> more thought.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
