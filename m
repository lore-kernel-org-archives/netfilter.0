From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Sat, 05 Dec 2015 11:13:17 +0100
Message-ID: <5662B8BD.1040908@plouf.fr.eu.org>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>	<5660CCD1.60807@familie-kuntze.de>	<CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>	<5660D6D3.8040205@familie-kuntze.de>	<CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>	<CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>	<5660DFC7.9040206@familie-kuntze.de> <CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: Noel Kuntze <noel@familie-kuntze.de>, netfilter@vger.kernel.org

Hello,

Scott Bronson a =E9crit :
>> Traffic going over loopback seems to be handled in a special way
>> with the TRACE target.

It's not handled specially /per se/.
It's a side effect of how conntrack and NAT work. The conntrack confirm
takes place at the end of POSTROUTING, and no new NAT rule can be
applied on a confirmed connection.

The same applies to packets belonging to an established connection :
they all skip the nat chains.

The special thing in the loopback path is that there is no need for an
input routing decision after PREROUTING. So, what would happen if you
could actually DNAT the packet ?

> It's considered looped back even though there's never any 127.0.0.1 a=
ddresses?

127.0.0.0/8 is reserved for loopback, but loopback is not reserved for
127.0.0.0/8. Any address assigned to a local interface is considered
local. Loopback traffic is all that goes through a loopback interface.
Check your logs : IN=3Dlo, OUT=3Dlo.
