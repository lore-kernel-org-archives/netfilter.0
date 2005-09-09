From: "Jonathan" <phonic@antisocial.nu>
Subject: Re: Route packets from an interface to another
Date: Fri, 9 Sep 2005 21:51:24 +0200 (CEST)
Message-ID: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I think so. On box1 I type these commands:
# ifconfig eth0:5 192.121.234.213 netmask 255.255.255.240 broadcast
192.121.234.223
# ip route add 192.121.234.213 via 10.1.0.2 (10.1.0.2 is the tunnel's
endpoint on box2)

on box1:
# ifconfig lo:0 192.121.234.213 netmask 255.255.255.255
# ip rule add from 192.121.234.213 lookup 10
# ip route add default via 10.1.0.1 table 10

and when I ssh 192.121.234.213 from box1, I come to box2.

I have also noticed that 192.121.234.213 exists in the kernel routing
table on box1, so I deleted it and when I then ssh 192.121.234.213 from
the outside I get the error "no route to host".

So the routing seems to be correct, right?
And why I set up the tunneled address on lo is because a guy told me to d=
o
that. ;-)

> Well.. routing in this case is not single point problem.... but both
points have to route correctly to make it "happen". You sure the other
machine is routing through the VPN tunnel when replying?
>
> On 9/9/05, Jonathan <phonic@antisocial.nu> wrote:
>> I have already set up routes exactly like that one. :-)
>>
>> The purpose is that I want to have a static IP on my home box. I have =
a
/28 addressed on a box so I thought I could tunnel one of these
addresses
>> to my box home.
>>
>> And the problem; when I ping/ssh/whatever 192.121.234.213 from the /28=
-box
>> (box1), the traffic goes through 10.1.0.1 to 10.1.0.2 and reaches my h=
ome
>> box. But when I ping/ssh/whatever from outside the traffic goes to
box1. That's why I think NATing the connections will solve the problem.
But maybe I'm wrong?
>>
>> > IPTABLES? I think it's a routing problem, not a firewall one.
>> >
>> > ip route add 192.121.234.213 via 10.1.0.2
>> > I think that would do the first part of your problem.
>> >
>> > But why do you have an IP address (not 127/8) set on a loopback
>> interface?
>> >
>> > On 9/9/05, Jonathan <phonic@antisocial.nu> wrote:
>> >> Hello,
>> >> I have the following interface configuration on two boxes:
>> >> box1: eth0:5 192.121.234.213 netmask 255.255.255.240 broadcast
192.121.234.223
>> >> box2: lo:0 192.121.234.213 netmask 255.255.255.255
>> >> between box1 and box2 I have a OpenVPN tunnel (endpoints 10.1.0.1
and 10.1.0.2).
>> >>
>> >> I want to forward all packages on box1 with destination
>> 192.121.234.213
>> >> to
>> >> tun0 (10.1.0.1), so theWy pass through the tunnel and comes to box2=
.
>> I
>> >> also
>> >> want to forward all packages from tun0 (10.1.0.1) to eth0:5
>> >> (192.121.234.213). How do I do this with iptables?
>> >>
>> >> Regards
>> >> Jonathan
>> >>
>> >>
>> >>
>> >
>> >
>>
>>
>>
>>
>





