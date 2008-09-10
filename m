From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: Help with multiple IP networks over an ethernet one
Date: Wed, 10 Sep 2008 18:41:15 +1000
Message-ID: <48C7882B.6060605@standarduniversal.com.au>
References: <ef6cbd7b0cc8d867f0702b0494896b60.squirrel@www.arcoscom.com>    <48C6EF5B.3030005@riverviewtech.net> <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <99a0783d528d1709644f5e55f406f469.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux@arcoscom.com
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>, Grant Taylor <gtaylor@riverviewtech.net>



ArcosCom Linux User wrote:
> Thanks for the response, I explain a bit more.
>
> The 3 uplinks have 3 public IP addressess (one per uplink), and are "=
ADSL"
> links, one public ip per interface.
>
> eth1 and eth2 have, each one, their direct connect to their ADSL gate=
way.
>
> eth3 (public IP) and eth0 (private IP) share the same ethernet networ=
k.
>
> Physically, this shared ethernet have many wireless bridges (using ST=
P) to
> link all the buildings we need to link.
>
> The test I done to see the latences are send 2 pings to the same phys=
ical
> place to diferent defices from the linux box.
>
> One ping from router to adsl gateway (eth3->uplink3 gateway) and, at =
the
> same time, one ping from router to a workstation (eth0->LAN).
>
> Physically the two pings go trought the same physicall path and end i=
n the
> same switch where the uplink3 gateway and the test workstation are.
>
> In router:
>    a) I MASQUERADE the IP by interface (-j MASQUERADE), because I nee=
d to
> have all ougoing frames control.
>    b) I balance the routers (as described in lartc and use magle to a=
llow
> the responses from the incomming interface where they arrives.
>    c) I use tc (using HTB qdiscs) for the QoS (the problem became wit=
h QoS
> disabled too, don't think this were the problem).
>
> Yesterday, I found a local kernel text file called
> /usr/share/doc/kernel-doc-2.6.18/Documentation/networking/ip-sysctl.t=
xt
> (internet is not all) where I see a very usefull information about ip
> parameters and appears that tweaking some of them will solve some pro=
blems
> with ARP, but really I don't know many of these parameters and only
> appears to be usefull for me some of them: arp_filter, arp_accept,
> arp_ignore, rp_filter.
>
> My distro is CentOS 5.2 whith the last kernel (2.6.18 based).
>
> Expect that with this information the problem could be more explained=
 than
> in the initial e-mail.
>
> Regards
>
> El Mar, 9 de Septiembre de 2008, 23:49, Grant Taylor escribi=F3:
>  =20
>> On 09/09/08 03:29, ArcosCom Linux User wrote:
>>    =20
>>> Physically there are 3 ethernet networks, one for the uplink 1, oth=
er
>>> for uplink 2, and the third is for the lans and the uplink 3. I
>>> forced to share the ethernet for the LANs and uplink 3.
>>>      =20
>> Ok...
>>
>>    =20
>>> The router has 4 interfaces, eth1 for uplink 1, eth2 for uplink 2,
>>> eth3 for uplink 3 and eth0 for the LANs.
>>>      =20
>> Just so I understand you correctly.  You have four physical ethernet
>> interfaces in the system, but eth3 and eth0 are connected to the sam=
e
>> ethernet network (broadcast domain)?
>>
>> (Presuming that the above understanding is correct.)  Why do you hav=
e
>> eth0 (LANs) and eth3 (uplink 3) connected to the same ethernet netwo=
rk?
>>   Rather why not have them be different networks from each other?
>>
>>    =20
>>> The problem I have is that, without a constant time or reason,
>>> sometimes I detect latences between uplink 3 and the router, and
>>> other times between the router and LAN hosts.
>>>      =20
>> Ok...
>>
>> Can we have some information about the IP addresses used for each
>> network?  Do all four networks have IP addresses in different subnet=
s /
>> networks?  Can we ask what they are (sanitized if need be) for the s=
ake
>> of discussion?
>>
>>    =20
>>> I think that I need to configure something in eth3 config files
>>> (/proc/sys/net/ipv4/conf/eth3) to disallow local frames and allow
>>> only the router and uplink 3 gateway comunication, but I don't foun=
d
>>> anything that help me.
>>>      =20
>> I can't say one way or the other for sure until I know what IP addre=
sses
>> you have where.  However as a general rule of thumb you don't need t=
o do
>> that.  I'd be wondering if you don't have a hardware resource / IRQ
>> conflict depending on how much data (amount and / or size of packets=
).
>>
>>    =20
>>> I tried with arp_filter, rp_filter, and many of them, but without
>>> success (I don't found many documentation about it, and I review
>>> lartc and googled about that parameters).
>>>
>>> I think that only allowing arp traffic betwen eth3 and uplink 3
>>> gateway (using arptables) will solve this, but I don't know if
>>> arptables will be the solution or not.
>>>      =20
>> With out knowing your IP addressing scheme better it's hard to say.
>>
>>
>>
>> Grant. . . .
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>    =20
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20

how about doing something to work around the problem

eg

http://computers.search.ebay.com.au/dual-port_Network-Interface-Cards_W=
0QQdfspZ1QQsacatZ20318

care needed to find one driven by linux. :-)

regards

Brian

