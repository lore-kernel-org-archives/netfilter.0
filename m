From: Vincent Bernat <bernat@luffy.cx>
Subject: Re: Forwarding packets over the same LAN
Date: Tue, 14 Jul 2009 22:36:59 +0200
Message-ID: <m3eisjovbo.fsf@neo.luffy.cx>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	<1247494451.25529.52.camel@enterprise.ims-firmen.de>
	<1247558286.7214.16.camel@TestField.intranet.bem.md>
	<1247585686.1173.7.camel@enterprise.ims-firmen.de>
	<e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
	(Simion Onea's message of "Tue, 14 Jul 2009 22:01:04 +0300")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simion Onea <simionea@gmail.com>
Cc: Thomas Jacob <jacob@internet24.de>, netfilter@vger.kernel.org

OoO En ce  d=C3=A9but de soir=C3=A9e du mardi 14 juillet  2009, vers 21=
:01, Simion
Onea <simionea@gmail.com> disait=C2=A0:

> Maybe I should examine more carefully the INPUT and FORWARD chains of
> the filter table. They are configured to allow inbound traffic to por=
t
> 10025 and to allow forwarding to port 25. Are there any other
> requirements?

> Is there any means to "debug" or to "see" how a packet traverses the
> chains and tables?

With a recent enough kernel, you can use the TRACE target in the raw ta=
ble.
--=20
I WILL NEVER WIN AN EMMY
I WILL NEVER WIN AN EMMY
I WILL NEVER WIN AN EMMY
-+- Bart Simpson on chalkboard in episode 9F21
