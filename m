From: Remi Pieternella <remi.pieternella@gmail.com>
Subject: Re: Diverting part of the traffic over a bridged network
Date: Mon, 10 Aug 2009 09:48:29 +0200
Message-ID: <9c567de70908100048t7a608c5ck90a8e39232c91c7f@mail.gmail.com>
References: <9c567de70908090726s72bb3678j4c24db8f2c89a1ef@mail.gmail.com>
	 <94012beb8601c0f82a9af6271fd7f0fb@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=hv2uMIB1o7ZdhSBjm/sBu67oN+57fuVmiu3zoS9iFjc=;
        b=GFqv8/k7baKb1AFRWD/s4eyRJTM3jun0pSu7AFvxV1neu3BREZxEiFnTfDXkr6nw7u
         1Po+THnJt5ptaqHKzCBP7e8Z/yH2I0chAp9UusAgLEqxLRiz3AaY+uYs2TMGhdnoPbOJ
         De0kdD4pkmMA9xcoMg4LKBaUpRWdfnJER9i9M=
In-Reply-To: <94012beb8601c0f82a9af6271fd7f0fb@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Benedikt Gollatz <ben@differentialschokolade.org>
Cc: netfilter@vger.kernel.org

Benedikt,

Indeed that certainly would have been the easier solution.
Unfortunately the Sonos music box doesn't allow me to set the gateway
(everything is set via DHCP).

What I could do is strip de DHCP server from the router and setup a
new one on my linux box. Next I would need to find a way to supply a
different gateway to DHCP requests coming in on eth1 (or based on the
MAC).

=46or the moment the bridged solution seems nicer as this would even
allow me to only divert very specific traffic (to specific sites)
(besides I guess the DHCP discussion would be considered off topic)

Regards
Remi

On Mon, Aug 10, 2009 at 1:41 AM, Benedikt
Gollatz<ben@differentialschokolade.org> wrote:
> On Sun, 9 Aug 2009 16:26:27 +0200, Remi Pieternella wrote:
>> On my network I have a music box (Sonos) which needs to be visible o=
n
>> my 192.168.0.x subnet (other wise my other computers will not be abl=
e
>> find it). But for which I would like to divert all non local to an
>> external gateway (possibly through a VPN connection)
>
> Why don't you just hook up the music box to the regular physical link=
 and
> configure a different default gateway for it?
>
> PS. Sorry for the PM, Remi.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
