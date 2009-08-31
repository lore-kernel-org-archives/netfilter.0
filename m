From: Diogo Sperb Schneider <vonsperb@live.com>
Subject: Routing HTTP Through Another Link
Date: Mon, 31 Aug 2009 21:30:34 +0300
Message-ID: <BLU116-W25EED7BAB4A40766109367A2F20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Greetings!

I'd like to route my HTTP traffic (ports 80 and 443) through a separate=
 link, but I'm not sure if I must use the ROUTE target or even how to u=
se it.
My main link has it's own static IP address, so I have SNAT doing the a=
ddress translation. (working)

My second link is a dynamic-IP DSL, so I believe NAT rules will need MA=
SQUERADE instead.

Could somebody please post a sample ruleset that does the trick?

Many thanks in advance.

Best regards,
Diogo


_________________________________________________________________
Acesse seu Hotmail de onde quer que esteja atrav=E9s do celular. Clique=
 aqui.
http://www.windowslive.com.br/celular/home.asp?utm_source=3DMSN_Hotmail=
&utm_medium=3DTagline&utm_campaign=3DMobileServices200908