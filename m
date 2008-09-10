From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Wed, 10 Sep 2008 21:13:40 +0200 (CEST)
Message-ID: <a101ab37cddb703b5cb3cc863b96b846.squirrel@www.arcoscom.com>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>
    <48C6EF5B.3030005@riverviewtech.net>
    <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>
    <48C7D68C.2070902@riverviewtech.net>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48C7D68C.2070902@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks for the response, I'll answer the questions below:

El Mie, 10 de Septiembre de 2008, 16:15, Grant Taylor escribi=F3:
> On 09/10/08 02:51, ArcosCom Linux User wrote:
>> Thanks for the response, I explain a bit more.
>
> *nod*
>
>> The 3 uplinks have 3 public IP addressess (one per uplink), and are
>> "ADSL" links, one public ip per interface.
>
> Ok.
>
>> eth1 and eth2 have, each one, their direct connect to their ADSL
>> gateway.
>
> Ok.
>
>> eth3 (public IP) and eth0 (private IP) share the same ethernet
>> network.
>
> This confirms what I was thinking.  However I ask why they are sharin=
g
> the same ethernet network?  Why is the uplink 3 connection on the sam=
e
> ethernet network as your LANs?  Is there as reason that this is the c=
ase
> rather than just putting uplink 3 directly on eth3 with out putting i=
t
> across the LANs network segment?
>

Because I cant have another uplink in the router place and I need to pu=
t
that in another building that can have another uplink.

>> Physically, this shared ethernet have many wireless bridges (using
>> STP) to link all the buildings we need to link.
>
> Ok.  This should not matter.
>
>> The test I done to see the latences are send 2 pings to the same
>> physical place to diferent defices from the linux box.
>
> Ok...
>
>> One ping from router to adsl gateway (eth3->uplink3 gateway) and, at
>> the same time, one ping from router to a workstation (eth0->LAN).
>>
>> Physically the two pings go trought the same physicall path and end
>> in the same switch where the uplink3 gateway and the test workstatio=
n
>> are.
>
> So the uplink 3 gateway is on the LAN and on the local side of a WAN =
link?
>

Yes.

>> In router:
>>
>> a) I MASQUERADE the IP by interface (-j MASQUERADE), because I need
>> to have all ougoing frames control.
>
> Is this the only reason that you have both eth0 and eth3 connected to
> the same ethernet network?
>

Ah, no, this is not the reason. It's a "logistic" reason only.

>> b) I balance the routers (as described in lartc and use magle to
>> allow the responses from the incomming interface where they arrives.
>
> I believe this should be able to be done independent of the physical
> interface that packets are leaving.
>

Yes, I think so too, only put here to put more information.

>> c) I use tc (using HTB qdiscs) for the QoS (the problem became with
>> QoS disabled too, don't think this were the problem).
>
> Ok.
>
>> Yesterday, I found a local kernel text file called
>> /usr/share/doc/kernel-doc-2.6.18/Documentation/networking/ip-sysctl.=
txt
>> (internet is not all) where I see a very usefull information about i=
p
>> parameters and appears that tweaking some of them will solve some
>> problems with ARP, but really I don't know many of these parameters
>> and only appears to be usefull for me some of them: arp_filter,
>> arp_accept, arp_ignore, rp_filter.
>
> With out knowing for sure what the problem is or what is causing it I
> can't say what to adjust.  However I suspect your problem has somethi=
ng
> to do with the fact that (if I recall correctly) Linux will by defaul=
t
> respond to ARP queries on any interface for an IP that may be bound t=
o a
> different interface.  In short IPs are more or less bound to the box =
not
> the interface, thus any interface can get you to the box.  There are =
a
> couple of /proc entries that will adjust the kernel's ARP behavior to
> make it only respond to ARP queries if they are bound to an IP that i=
s
> bound to the interface that it is coming in on, rather if the
> interface's IP is in the subnet pertinent to the ARP query.
>
> I'm just guessing (with out seeing some TCPDumps of traffic) that
> systems on either eth0 or eth3 are needing to ARP for either of the I=
Ps
> of eth0 or eth3 and the wrong interface is replying, or both are
> replying.  If both interfaces are replying at the same time or if the=
y
> are flip flopping back and forth I can see how your layer 2 ethernet
> network / switch would be getting confused as well as devices wanting=
 to
> talk to said IPs.
>

Yes, that appears to be the problem (seeing tcpdumps in each interface)=
=2E

Do you have any suggestion about that parameters on that interfaces?
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


