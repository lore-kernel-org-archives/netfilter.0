From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirecting ports in a bridge
Date: Tue, 22 Apr 2008 09:29:24 -0500
Message-ID: <480DF644.8010302@riverviewtech.net>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es> <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr> <480888CE.3080400@juntadeandalucia.es> <4808B26F.4060205@riverviewtech.net> <480C3A6A.3090206@juntadeandalucia.es> <480D3FA2.4050000@riverviewtech.net> <480D8272.1020200@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480D8272.1020200@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/22/08 01:15, Javier Prieto Mart=EDnez wrote:
> Yes. We are logging and filtering right now, but we want to redirect=20
> traffic too.

*nod*

> The point is we want the bridge to be transparent except for one=20
> particular redirection we want to do :-)

*nod*

> Thanks for the advice. I'll try with EBTables, then.

*nod*

Except for possibly some syntactical change your rules should be very=20
similar and operate in the same fashion.

Based on your previous statement "I don't want to mess with the real=20
IPs" it sounds like you don't even want to change source / destination=20
IPs of the traffic going to the back end system.  Am I understanding yo=
u=20
correctly that you indeed want to not alter the source and / or=20
destination IP?  If this is the case, be aware that you do not want to=20
NAT the IP and that you will be down to NATing the MAC address (which=20
can be done but is another discussion) as the frame is passing through=20
the bridge.

I guess I should ask:

+---+         +---+   +---+   +---+
| C +-- - - --+ R +---+ A +---+ S |
+---+         +---+   +---+   +---+

Presuming that C is the client, R is the router, A is the appliance, an=
d=20
S is one or more of the servers, do you want S to see the source and=20
destination IP that the client connected to?  Or is it ok for the=20
appliance to munge the source and / or destination IP (as seen by the=20
server) in the process of redirecting to the server?



Grant. . . .
