From: Walther@gehag-dsk.de
Subject: Re: FreeS/WAN + static NAT + 2 machines
Date: Mon, 23 Sep 2002 17:51:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFF0E2BAE6.091E3C50-ONC1256C3D.005712A0-C1256C3D.00572927@GEHAG-DSK.DE>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Monday 23 September 2002 2:22 pm, Walther@gehag-dsk.de wrote:

>> > Interesting.   Why do you have two separate firewalls, plus a
FreeS/WAN
>> > gateway ?   I would have thought:
>>
>> I don't really like collapsed firewalls. That's why I installed two
>> firewalls. The second is, there are some other machines in the DMZ such
as
>> a proxy.

>Okay - that makes sense.

>> > a) one firewall would be sufficient (obviously the one inside the
IPsec
>> > gateway, so it can filter unencrypted traffic)
>> >
>> > b) you should be able to run the firewalling, the NAT, and IPsec all
on a
>> > single machine (what speed is your Internet link ?)
>>
>> i'm sorry, but thats no option, coz the machines aren't powerful enough
to
>> do both.

>That's why I asked what speed your Internet link was.   I'm intrigued to
know
>what quantity of data you're trying to shovel through FreeS/WAN that you
find
>the performance of the machine a limitation.   Please tell me your link
>bandwidth and a rough spec of the machine/s you're using.


I have a 2MBit with about 15 official IP's.

>> on the one side there is a roadworrior and on the other side there is
our
>> internal lan.

>That sounds bad :-(   Road warrior configurations nearly always use
transport
>mode (you can easily tell because it's one of the first options in the
>ipsec.conf file - it will say either "type tunnel" or "type transport" in
the
>"conn" section of the file).

i will install the testmachine on wednesday in the DMZ, and will try again
with the modes. i rechecked my rules and in my test-environment it works
now (with NAT).

>As I said earlier:

>> > Provided you are using tunnel mode, you can NAT IPsec traffic.   The
ESP
>> > protocol works through NAT.
>> >
>> > If you are using transport mode, you cannot NAT IPsec traffic.   The
AH
>> > protocol breaks under NAT.

>Therefore if it does turn out that you are using transport mode, you
cannot
>NAT the traffic between the two IPsec machines (well, not unless you NAT
it
>back again so that the effect is to cancel things out, anyway).

>Assuming this is your situation, the only thing I can think you may be
able
>to do is to proxy-arp for the external IP of your FreeS/WAN gateway on the


>external interface of your firewall, create a dedicated point-to-point
route
>between the firewall and the gateway (which has the true external IP on
its
>interface), and not attempt any translation of packets to/from the gateway


>machine on the firewall (but you can still use the firewall to filter what


>packets are allowed to get to the gateway).

>This setup would have a pretty unpleasant routing table on your firewall
(the
>gateway would just have a simple default route pointing to the firewall),
and
>I cannot guarantee that it would work, but it's about the only thing I
can
>think of without:
>a) being able to create an extra subnet on the *outside* of your firewall

>(between the firewall and the Cisco), or
>b) needing *another* firewall to perform the reverse NAT which the first
one
>is doing, so that IPsec doesn't realise there are two NATs cancelling
each
>other out.

>> > The other thing which might be relevant is your ipsec.conf files on
the
>> > two Security Gateways: the standard FreeS/WAN instructions tell you
to put
>> > the same configuration file on both ends, however when you are using
NAT
>> > in between the two Gateways, the rule becomes:
>> >
>> > the configuration file on each IPsec machine must contain the
addresses
>> > for the local and remote machines, as known to the local machine.
>>
>> you mean, on both sides the external IP for the freeswan-gateway???

>I mean at end A of the IPsec link the config file contains A's *real*
address
>(the address which is actually on A's interface), and it contains the
address
>which A thinks B has, even if that address actually gets DNATted
somewhere on
>the way to B to a private address.

>In other words, the config file contains the true address of the local
>machine, and whatever address you'd use in a ping command, or traceroute,
to
>get to the remote machine.   Apply that rule at both ends of the link.

>> > What do you see in your /var/log/messages when you try to start
FreeS/WAN
>> > running ?
>>
>> in my test-config without firewall, i get:
>>
>> ISAKMP SA Established, Respond to MR3 and I get IPSec SA Established.

>There should be quite a lot of messages before you get that far....

i see the standard messages of loading the keys and so on, no error
message is appearing.

>> But when I try to use the rules above and change the config files from
>> freeswan (or leave it as before) i don't get any of these messages.

>You mean there are no messages about 'trying to establish SA' and failing
for
>some reason ?   Strange....

>no, there is nothing like this. i tried to listen with tcpdump at the
external interface of my >firewall. but there are no packets arriving at
all.

>> > By the way, I have a really complicated diagram on a whiteboard which
>> > shows how packets travel through the various chains / tables of
netfilter
>> > on a machine also running FreeS/WAN - if you ever consider setting up
a
>> > single machine to do your filtering, NAT and IPsec I'll figure out a
way
>> > to get you a copy so you can understand what rules you need and what
>> > addresses to expect where.....
>>
>> this would be very nice. i think this would also be very helpful. thx

>Okay - it'll take me a few days because (a) I'm not working in the office

>where that whiteboard is right now, and (b) it's a complicated diagram
which
>I guess I could either redraw on a computer, or just photograph and try
to
>make sure it's legible.   I'll see what I can do.

THX

>Antony.

>--

>Perfection in design is achieved not when there is nothing left to add,
>but rather when there is nothing left to take away.

> - Antoine de Saint-Exupery
>

i will tell you on wednesday if it works or not, coz there is no way to
test it before this date.



Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

--------------------------------------------------------------
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free.
Examined by DOGMATIC infallibility system.
Version 6.04



