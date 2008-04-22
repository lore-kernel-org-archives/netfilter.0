From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 15:07:50 -0500
Message-ID: <480E4596.9030000@riverviewtech.net>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E1752.2040308@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480E1752.2040308@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/22/08 11:50, Leonardo Rodrigues Magalh=E3es wrote:
> I have to confess that i have almost none experience with other=20
> network OSs different than Linux. But i really think that this idea o=
f=20
> loopback interface do NOT connects to real interfaces it not a linux=20
> decision. It seems to me that this is basically the whole loopback id=
ea:=20
> a network interface that connects the machine to itself, thus allowin=
g=20
> TCP/IP to fully exist even if the machine is not connect to 'real'=20
> networks.

I don't know for sure if the loopback network being isolated is limited=
=20
to Linux or not.  I do know that Microsoft's TCP/IP implementation has =
a=20
laughable loopback setup.  Other than that I can not say.

To me, the concept of the loopback interface is just a very unique=20
network interface.  Personally I could be equally happy with an etherne=
t=20
interface with a loopback plug in it used as the loopback interface wit=
h=20
in the system.  I think the idea of having the interface always=20
available is a good idea, but mainly there to remove the dependency on=20
other network interfaces and drivers there for.

I can see why there is a logical isolation of the loopback interface=20
from the rest of the network, however I wish that the isolation was=20
optional, much like reverse path filtering.

> The loopback interface is not 'connected' to the network, i really=20
> dont think that this would be possible to configure or tweak.

To me this is just a routing decision more so than any thing else.



Grant. . . .
