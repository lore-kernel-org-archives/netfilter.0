From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: newbie at routing !!
Date: Wed, 7 Jun 2006 13:17:14 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C4012791@knowledge.wizdom.nu>
References: <BAY19-F1075A5A2BEA2CCF5AFFE059E8A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Diana Asnani <sakal_woman@hotmail.com>, netfilter@lists.netfilter.org

I am very tempted to just shout RTFM here. But then again, I'm already =
pissed at some other people, so let's just go back into friendly =
mode.... ;-)
=20
If your PC has default route set to the VLAN router (192.168.202.14) =
that part is ok
=20
The VLAN router will then need to know the route to 202.184.41.41/32 for =
the host itself or 202.14.41.0/24 if you need to reach the whole subnet, =
is via 192.168.206.1. I'm assuming both VLAN's are on the same VLAN =
router.=20
=20
I don't know anything about your VLAN router, so I cannot tell you the =
command, but on cisco it will be:
ip route 208.184.41.41 255.255.255.255 192.168.206.1 (or for subnet ip =
route 208.184.41.0 255.255.255.0 192.168.206.1).
=20
But if I must give you some real valuable advise, educate yourself. This =
is just part of the very basics of networking.
=20
-Sietse
________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Diana Asnani
Sent: Wed 07-Jun-06 12:46
To: netfilter@lists.netfilter.org
Subject: Re: newbie at routing !!




Hi Vinod,

thanks for the reply...the gateway for my 192.168.202.1 PC is =
192.168.202.14
which is the vlan router which enables me to ping the 192.168.206.1 vlan
address...for the route in the network device control, the destination
network is 192.168.206.0, the subnet mask 255.255.255.240 and the =
gateway as
192.168.202.14...this is what i have done so far...i am not too sure on =
how
i should configure a default gateway ot static route...

>From: Vinod Chandran <vinod_chandran@multitech.co.in>
>To: Diana Asnani <sakal_woman@hotmail.com>
>Subject: Re: newbie at routing !!
>Date: Wed, 07 Jun 2006 14:17:47 +0530
>
>Hi,
>
>You need to have a route configured to reach 202.184.41.0/24 network.
>Check ur routing table
>May be u need to configure a default gateway or a static route.
>
>Regards,
>Vinod C
>
>Diana Asnani wrote:
>
>>Hi,
>>
>>I need help!! My VLAN IP is 192.168.202.1. I can ping another PC with =
the
>>VLAN IP of 192.168.206.1 but i can't ping the 202.184.41.41 address in
>>that PC. Am i supposed to do some sort of routing configuration? I am
>>using FC3 as my OS. What am i supposed to do to ping 202.184.41.41? =
Thanks
>>
>>_________________________________________________________________
>>Get your mobile ringtones, operator logos and picture messages from =
MSN
>>Mobile http://msn.smsfactory.no/
>>
>>
>

_________________________________________________________________
Find just what you are after with the more precise, more powerful new =
MSN
Search. http://search.msn.com.my/ Try it now.





