From: "Gonzalez, Federico" <fgonzalez@goyaike.com.ar>
Subject: RE: TTL target
Date: Sat, 24 Jul 2004 19:03:15 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F83365C81484D411A63A00508BAEED5AF4A227@NT_CIRPC>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Jason Opperisano' <Jopperisano@alphanumeric.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Jason,

Thank you very much for your help. I could finally install the patch and is
working fine.

Best regards,

Federico.

-----Mensaje original-----
De: Jason Opperisano [mailto:Jopperisano@alphanumeric.com]
Enviado el: Viernes, 23 de Julio de 2004 04:19 p.m.
Para: netfilter@lists.netfilter.org
Asunto: RE: TTL target


heh--yeah, sorry about that.

Frederico-

there's a nice (albeit a bit old) step-by-step on patch-o-matic at:

	http://www.lowth.com/howto/add-iptables-modules.php

when you get down to step 6--the patch you're interested in is:  "runme
base/TTL.patch"

i've never had any luck with pom-ng on the stock RH kernels (runme says that
the kernel is too old), so you probably want to grab
'patch-o-matic-20031219' which does have the TTL target you're looking for.

HTH,

-j

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Friday, July 23, 2004 2:44 PM
To: netfilter@lists.netfilter.org
Subject: Re: TTL target


On Friday 23 July 2004 7:29 pm, Gonzalez, Federico wrote:

> I get the following error:
>
> iptables: No chain/target/match by that name

I think two people may be talking about two different things here without 
realising it:

The ttl *match* (lowercase) is for matching packets by value of the TTL
field.

The TTL *target* (uppercase) is for altering the TTL value in a packet.

Sorry I can't answer the actual question, because I don't use Fedora, but 
hopefully this might help to avoid some confusion, at least...

Regards,

Antony.

> ----- Original Message -----
> From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
> To: "Gonzalez, Federico" <fgonzalez@goyaike.com.ar>;
> <netfilter@lists.netfilter.org>
> Sent: Friday, July 23, 2004 3:21 PM
> Subject: RE: TTL target
>
>
> um--on fedora core 1--which seems to match the versions you provide, the
> TTL match target is there.
>
> $ uname -r
> 2.4.22-1.2197.nptl
>
> $ iptables -V
> iptables v1.2.9
>
> # iptables -A INPUT -m ttl --ttl-eq 1 -j DROP
> #
>
> # iptables -vnL INPUT
> Chain INPUT (policy DROP 184 packets, 19161 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 DROP       all  --  *      *       0.0.0.0/0
> 0.0.0.0/0           TTL match TTL == 1
>
> -j
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Gonzalez,
> Federico
> Sent: Friday, July 23, 2004 1:52 PM
> To: netfilter@lists.netfilter.org
> Subject: TTL target
>
>
> Hi,
>
> I have iptables 1.2.9, red hat kernel 2.4.22 and i need to use the TTL
> target to change the packets TTL.
>
> How do i enable this functionality ?
>
> Thank you.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the
list;
                                                           please don't CC
me.



