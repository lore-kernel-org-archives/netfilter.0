From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Mon, 29 Jun 2009 14:02:07 +0100 (WEST)
Message-ID: <2306.192.168.1.3.1246280527.squirrel@webmail.decimal.pt>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>
    <4A44C5B2.9030408@trash.net>
    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>
    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>
    <4A48B3F4.8000705@trash.net>
    <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>
    <4A48B97C.1060803@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A48B97C.1060803@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: Jorge Bastos <mysql.jorge@decimal.pt>, netfilter@vger.kernel.org

>> Explain something to me if possible, why is the SIP module need if
>> everything works without it?
>
> Well, in that case you don't need it obviously :) In case you're using
> NAT, I guess you're also using STUN or something similar. This does not
> really work reliable with netfilter, although it might appear that way
> most of the time.

Well, this is on the machine that is doing NAT for local LAN, no STUN or
so :P
But it works fine with (with the parameters) or without the module.
Everything's solved! :P

Thanks, Jorge

