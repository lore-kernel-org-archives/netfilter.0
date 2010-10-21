From: Mateus Caruccio <mateus@caruccio.com>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 14:42:00 -0200
Message-ID: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

In the end, we came with a very simple solution (no iptables/ip needed)=
:

=46rom DEVEL_SRV we ran:

# ifconfig eth1 PROD_SRV_IP netmask PROD_SRV_NETMASK promisc -arp hw
ether PROD_SRV_HWADDR up

That is it !

All traffic targeted to PROD_SRV_IP is now being accepted by our
mirrored eth1. Since this is an interface aimed to tests only, no
matter what's being accepted.

Thanks Jan and Grant for your suggestions and explanations. That worths=
 a lot!

regards,
Mateus Caruccio


On Thu, Oct 21, 2010 at 1:02 PM, Grant Taylor <gtaylor@riverviewtech.ne=
t> wrote:
> On 10/20/10 16:58, Mateus Caruccio wrote:
>>
>> Thanks to this damn GUI world, probably this ascii-art is ruined.
>
> Nope. =A0Using text mode email and a fixed width font (my default) it=
 came
> through just fine. =A0;-)
>
>> All traffic is UDP port 2077 only. I can not change any config on
>> PROD_SRV.
>
> Ok... =A0UDP will take care of the protocol handshake issue that you =
have with
> TCP. =A0That means that your dev server can truly receive the request=
 and not
> have borked connections.
>
>> Our DEVEL_SRV should receive exactly the same packet PROD_SRV receiv=
es,
>> but with destination address modified so it can reach our userspace
>> application.
>
> On the surface I agree. =A0Just under the surface I wonder if you rea=
lly need
> to alter the destination IP or not. =A0(More in a bit.)
>
>> I've tried to "DNAT" it, but without success:
>
> Rather than DNAT, why not try simple routing. =A0(More in a bit.)
>
>> From DEVEL_SRV point of view, it receives a legitime request.
>
> I assume that you are looking at the traffic (via TCPDump or somethin=
g like
> it) and deciding that it's legitimate b/c you haven't gotten traffic =
to make
> it in to the service yet.
>
>> I've setup a DROP rule so responses do not interfer on client's requ=
ests.
>
> I'd wonder if you really want to DROP the traffic or redirect the rep=
lies so
> that you could test (analyze) that as well. =A0(More in a bit.)
>
>> If I'm not clear, please fell free to ask anything.
>
> Na, I think I understand what you are trying to do. =A0- =A0Set up so=
mething so
> that you can test dev code under (possibly a portion of) live traffic=
 load.
>
> For giggles I'd try having the dev server and prod server be in diffe=
rent
> subnets. =A0That will allow you to bind the prod server's IP to a dif=
ferent
> nic (dummy or something like it) and enable routing. =A0That way when=
 the
> traffic comes in to the eth0 interface on the dev box, it would be ro=
uted to
> the proper nic where your software is bound to the real IP. =A0There =
by doing
> away with any hacks needed to get the traffic in to your service.
>
> As a bonus, you should have a better emulation of the service between=
 the
> prod and dev servers, there by making it a better test and allowing s=
ervice
> config migration between the two boxen.
>
> Just something that I'd try.
>
> As far as the DROP rule, I'd rather set the default gateway on the de=
v box
> so that it would go out a different nic (physical or virtual) such th=
at your
> service could send reply packets that could then be analyzed elsewher=
e.
>
>> Thanks for helping,
>
> n/p
>
> Good luck.
>
> Please provide follow up and let us know what worked for you.
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



--=20
# ################ VOTE NULO ################
# Mateus de Oliveira Caruccio <mateus at caruccio dot com>
# Old programmers never die.=A0 They just branch to another namespace
