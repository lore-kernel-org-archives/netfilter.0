From: Pandu Poluan <pandu@poluan.info>
Subject: Re: DMZ issue - redirect works as expected but behaviour not desired
Date: Thu, 24 Feb 2011 07:19:48 +0700
Message-ID: <AANLkTikCwDu-r7xrxJzdF4Tke4EEe3mXX2iWxsa820a9@mail.gmail.com>
References: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
	<4D604DCB.8030409@plouf.fr.eu.org>
	<FCF5BC26-F3C1-4533-AF80-DC33AAE3F772@utpress.utoronto.ca>
	<AANLkTi=rkXhB9UC=jG_wfF3P0MRjk4z-BVWjx4w=gb3m@mail.gmail.com>
	<DBDD48B6-7C43-48CC-8D9A-8BBD048C6E40@utpress.utoronto.ca>
	<AANLkTi=BFd1KYZ6pGEoH5BPb9BjdgY2uHj3i_LOXQ_=q@mail.gmail.com>
	<571669CE-5056-4264-89CB-4FFC7525CE15@utpress.utoronto.ca>
	<AANLkTi=9euarpUK9RM6Gj6oRfyY1BvM7P2kR5_huXykE@mail.gmail.com>
	<3A9636F5-D484-4867-8EA9-751541813E2F@utpress.utoronto.ca>
	<AANLkTimre3dcFjdV8stbHGCzXQwN=CLwWXbf1n6mRKUW@mail.gmail.com>
	<3AAF85349127DC43AA77A652A1E1EC2F01F79E81@postoffice.utpress.utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3AAF85349127DC43AA77A652A1E1EC2F01F79E81@postoffice.utpress.utoronto.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Feasey, Nicholas" <nfeasey@utpress.utoronto.ca>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Okay, got your attachment. I blame the mangling of your email to my
Gmail mobile client; sometimes it's 'oversmart' and hides lines it
thought was a quote.

=46rom the attachment, I see 3 rules related to your NAT:

-t nat -A PREROUTING -i eth0 -d 10.0.10.22 -p tcp --dport 80 -j DNAT
--to 10.1.10.7
-t filter -A FORWARD -s 10.1.10.7 -p tcp --sport 80 -j ACCEPT
-t filter -A FORWARD -d 10.1.10.7 -p tcp --sport 80 -j ACCEPT

If that's the complete ruleset, I think you have to fix rule #3: s/spor=
t/dport/

BTW, you've set net.ipv4.ip_forward to 1, right? (Doesn't hurt to doubl=
e-check)

Rgds,




On 2011-02-24, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
> Hmm, I had that line in there but not sure why it didn't show up.
> Ok, so here is the configuration items again.  Hopefully, not mangled=
=2E
> Not sure if the list allows it but I've attempted to also attach the =
config
> file.
>
> Firewall (10.0.10.22 (eth0) on the inside, 10.1.10.1 (eth1) on the DM=
Z)
> *nat
> :PREROUTING ACCEPT [0:0]
> -A PREROUTING -i eth0 -d 10.0.10.22 -p tcp --dport 80 -j DNAT --to
> 10.1.10.7
> COMMIT
>
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
> -A FORWARD -s 10.1.10.7 -p tcp --sport 80 -j ACCEPT
> -A FORWARD -d 10.1.10.7 -p tcp --sport 80 -j ACCEPT
> COMMIT
>
> Webserver (10.1.10.7 (eth1 - no other interfaces active) on the DMZ w=
ith
> its' gateway set to 10.1.10.1 - no DNS specified)
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
> COMMIT
>
> Client 10.0.10.85 trying to connect to http://10.0.10.22 merely gets =
a
> timeout.
>
>
> -----Original Message-----
> From: Pandu Poluan [mailto:pandu@poluan.info]
> Sent: February-23-11 1:18 AM
> To: Feasey, Nicholas; netfilter@vger.kernel.org
> Subject: Re: DMZ issue - redirect works as expected but behaviour not
> desired
>
> Okay, the Gmail mobile client mangles your email, so I can't fully an=
alyze
> your configuration. But one rule stood out:
>
> -A FORWARD -s 10.1.10.7 -p tcp --sport 80 -j ACCEPT
>
> That rule *only* allows replies from the webserver. You need another =
rule
> for packets to reach the webserver:
>
> -A FORWARD -d 10.1.10.7 -p tcp --dport 80 -j ACCEPT
>
> And if your webserver serves HTTPS, another pair of rules for port 44=
3.
>
> Rgds,
>
>
> On 2011-02-23, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
>> My battle with iptables continues=E2=80=A6
>>
>> It's probably staring me in the face however here is the run down...
>>
>> In order to perform my testing I started with the inside network
>> (10.0.10.0).
>> I have set up the server on it's own DMZ (10.1.10.0 subnet).
>>
>> The firewall is on the internal network as 10.0.10.22 and the DMZ as
>> 10.1.10.1.  (It's ok that he firewall is on the same subnet - correc=
t
>> or do ALL ports on the fiewall have to be on different subnets?).
>>
>> The webserver has one interface up and running, it's IP is set to
>> 10.1.10.7 and it's gateway set to 10.1.10.1. No DNS defined at all.
>>
>> The particulars:
>>
>> client ip: 10.0.10.85
>> firewall ip: 10.0.10.22 (eth0) 10.1.10.1 (eth1) webserver ip:
>> 10.1.10.7 (eth1)
>>
>> Going to: http://10.0.10.22 (should see Welcome simple welcome page)
>>
>> No luck - just sits there.
>>
>> Below is the iptables for the firewall box:
>>
>> Firewall iptables
>> :
>> # Firewall configuration written by system-config-firewall # Manual
>> customization of this file is not recommended.
>> *nat
>> :PREROUTING ACCEPT [0:0]
>> #:POSTROUTING ACCEPT [0:0]
>> -A PREROUTING -i eth0 -d 10.0.10.22 -p tcp --dport 80 -j DNAT --to
>> 10.1.10.7 COMMIT *filter :INPUT ACCEPT [0:0] :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0] -A INPUT -m state --state ESTABLISHED,RELATED -=
j
>> ACCEPT -A INPUT -p icmp -j ACCEPT -A INPUT -i lo -j ACCEPT -A INPUT =
-m
>> state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT -A INPUT -m sta=
te
>> --state NEW -m tcp -p tcp --dport 80 -j ACCEPT -A INPUT -m state
>> --state NEW -m tcp -p tcp --dport 443 -j ACCEPT -A INPUT -j REJECT
>> --reject-with icmp-host-prohibited -A FORWARD -s 10.1.10.7 -p tcp
>> --sport 80 -j ACCEPT -A FORWARD -j REJECT --reject-with
>> icmp-host-prohibited COMMIT
>>
>> iptables -L -t nat on firewall:
>>
>> target     prot opt source               destination
>> DNAT       tcp  --  anywhere             zeus-n.utpress.utoronto.ca =
tcp
>> dpt:http to:10.1.10.7
>>
>> Chain POSTROUTING (policy ACCEPT)
>> target     prot opt source               destination
>>
>> Chain OUTPUT (policy ACCEPT)
>> target     prot opt source               destination
>>
>> iptables -L -t filter on firewall:
>>
>> Chain INPUT (policy ACCEPT)
>> target     prot opt source               destination
>> ACCEPT     all  --  anywhere             anywhere            state
>> RELATED,ESTABLISHED
>> ACCEPT     icmp --  anywhere             anywhere
>> ACCEPT     all  --  anywhere             anywhere
>> ACCEPT     tcp  --  anywhere             anywhere            state N=
EW
>> tcp
>> dpt:ssh
>> ACCEPT     tcp  --  anywhere             anywhere            state N=
EW
>> tcp
>> dpt:http
>> ACCEPT     tcp  --  anywhere             anywhere            state N=
EW
>> tcp
>> dpt:https
>> REJECT     all  --  anywhere             anywhere            reject-=
with
>> icmp-host-prohibited
>>
>> Chain FORWARD (policy ACCEPT)
>> target     prot opt source               destination
>> ACCEPT     tcp  --  10.1.10.7            anywhere            tcp spt=
:http
>> REJECT     all  --  anywhere             anywhere            reject-=
with
>> icmp-host-prohibited
>>
>> Chain OUTPUT (policy ACCEPT)
>> target     prot opt source               destination
>>
>>
>> Webserver iptables:
>>
>> # Firewall configuration written by system-config-firewall # Manual
>> customization of this file is not recommended.
>> *filter
>> :INPUT ACCEPT [0:0]
>> :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT -A INPUT -p
>> icmp -j ACCEPT -A INPUT -i lo -j ACCEPT -A INPUT -m state --state NE=
W
>> -m tcp -p tcp --dport 22 -j ACCEPT -A INPUT -m state --state NEW -m
>> tcp -p tcp --dport 80 -j ACCEPT -A INPUT -m state --state NEW -m tcp
>> -p tcp --dport 443 -j ACCEPT -A INPUT -j REJECT --reject-with
>> icmp-host-prohibited -A FORWARD -j REJECT --reject-with
>> icmp-host-prohibited COMMIT
>>
>> Webserver iptables -L -t filter
>>
>> Chain INPUT (policy ACCEPT)
>> target     prot opt source               destination
>> ACCEPT     all  --  anywhere             anywhere            state
>> RELATED,ESTABLISHED
>> ACCEPT     icmp --  anywhere             anywhere
>> ACCEPT     all  --  anywhere             anywhere
>> ACCEPT     tcp  --  anywhere             anywhere            state N=
EW
>> tcp
>> dpt:ssh
>> ACCEPT     tcp  --  anywhere             anywhere            state N=
EW
>> tcp
>> dpt:http
>> ACCEPT     tcp  --  anywhere             anywhere            state N=
EW
>> tcp
>> dpt:https
>> REJECT     all  --  anywhere             anywhere            reject-=
with
>> icmp-host-prohibited
>>
>> Chain FORWARD (policy ACCEPT)
>> target     prot opt source               destination
>> REJECT     all  --  anywhere             anywhere            reject-=
with
>> icmp-host-prohibited
>>
>> Chain OUTPUT (policy ACCEPT)
>> target     prot opt source               destination
>>
>> I just don't see what is wrong here so I'm sure it's something silly=
=2E
>>
>> Nicholas
>>
>> On 2011-02-20, at 9:37 AM, Pandu Poluan wrote:
>>
>>> Your welcome :)
>>>
>>> After the NAT is successful, don't forget to harden your iptables.
>>> And while doing that, don't forget to ACCEPT packets that need to b=
e
>>> forwarded, e.g.:
>>>
>>> -t filter -A FORWARD -s $WEBSERVER -p tcp --sport 80 -j ACCEPT
>>>
>>> Good luck!
>>>
>>> Rgds,
>>>
>>>
>>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote=
:
>>>> As I suspected I was doing myself in thinking that I could touch
>>>> such a thing on just one interface.  I have two interfaces and wil=
l
>>>> now do it the correct way.
>>>>
>>>> Thank you very much for your making it very clear for me and for
>>>> your assistance!
>>>>
>>>> Nicholas
>>>> On 2011-02-20, at 12:24 AM, Pandu Poluan wrote:
>>>>
>>>>> That won't work if the firewall, the webserver, and the client ar=
e
>>>>> all in the same subnet.
>>>>>
>>>>> Let's assume:
>>>>> * Client is 192.168.40.22
>>>>> * Firewall is 192.168.40.10
>>>>> * Webserver is 192.168.40.15
>>>>>
>>>>> Now client tries to access the faux-webserver:
>>>>>
>>>>> From: 192.168.40.22
>>>>> To: 192.168.40.10
>>>>>
>>>>> The packet gets DNATed
>>>>>
>>>>> From: 192.168.40.22
>>>>> To: 192.168.40.15
>>>>>
>>>>> See what happened? Because the source is the same subnet, the
>>>>> webserver replies directly to the client.
>>>>>
>>>>> From: 192.168.40.15
>>>>> To: 192.168.40.22
>>>>>
>>>>> The Linux firewall never sees the returning packet. And the clien=
t
>>>>> sees a 'strange' packet, as the client's opened connection is wit=
h
>>>>> .10 not .15. This results in the client dropping the 'strange' pa=
cket.
>>>>>
>>>>> Now, the usual scenario is like this:
>>>>>
>>>>> Firewall Box has 2 interfaces:
>>>>> * WAN: 202.72.112.5 (default gateway to ISP's router)
>>>>> * DMZ: 192.168.40.1
>>>>>
>>>>> Webserver: 192.168.40.8 (default gateway is 192.168.40.1)
>>>>>
>>>>> Assume client is: 65.12.212.47
>>>>>
>>>>> Client opens a connection to the firewall:
>>>>>
>>>>> [1] From: 65.12.212.47
>>>>> To: 202.72.112.5
>>>>>
>>>>> Firewall does a DNAT:
>>>>>
>>>>> From: 65.12.212.47
>>>>> To: 192.168.40.8
>>>>>
>>>>> Webserver handles the request, and replies:
>>>>>
>>>>> From: 192.168.40.8
>>>>> To: 65.12.212.47
>>>>>
>>>>> Since the destination is on a different subnet, the webserver han=
ds
>>>>> the packet to the firewall, which performs an 'un-DNAT':
>>>>>
>>>>> From: 202.72.112.5
>>>>> To: 65.12.212.47
>>>>>
>>>>> The packet gets sent via the intertubes to the client, and the
>>>>> client sees that the packet *is* a reply to its connection (see
>>>>> [1]; the
>>>>> from: and to: addresses are properly swapped).
>>>>>
>>>>> So, if you want to test, you'll need to configure your network so
>>>>> that:
>>>>> * 2 interfaces on the Linux box
>>>>> * the client and the webserver are *not* on the same subnet
>>>>>
>>>>> Rgds,
>>>>>
>>>>>
>>>>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wro=
te:
>>>>>> On 2011-02-19, at 8:28 PM, Pandu Poluan wrote:
>>>>>>
>>>>>>> (sorry for top posting; Gmail mobile client can only top-post)
>>>>>>>
>>>>>>> I've been doing what (I think) you're planning to do, i.e.,
>>>>>>> mapping an external IP:port into DMZ (which uses private
>>>>>>> addressing)
>>>>>>>
>>>>>>> IMO, to do this, you really don't need more than 2 rules:
>>>>>>> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80
>>>>>>> -j DNAT --to $WEBSERVER
>>>>>>>
>>>>>>> -A FORWARD -d $WEBSERVER -j ACCEPT
>>>>>>>
>>>>>>> With the above pair of rules, only the destination of incoming
>>>>>>> packets get changed; the webserver would still see the original
>>>>>>> source address. As long as the Linux firewall sees *both*
>>>>>>> incoming and outgoing traffic from the webserver, netfilter wil=
l
>>>>>>> automatically perform the inverse NAT.
>>>>>>>
>>>>>>> Of course you would want some -t raw -A PREROUTING rules to
>>>>>>> prevent spoofing (esp. smurf attacks). But that's not strictly
>>>>>>> necessary for NAT-ing.
>>>>>>>
>>>>>>> CMIIW.
>>>>>>>
>>>>>>> Rgds,
>>>>>>>
>>>>>>>
>>>>>>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> w=
rote:
>>>>>>>> Thank you for your response and explanation of the difference
>>>>>>>> between MASQUERADE and SNAT.
>>>>>>>>
>>>>>>>> I really do not want to use MASQUERADE for exactly the reason
>>>>>>>> that you state.
>>>>>>>>
>>>>>>>> My explanation is confusing because I was using the same
>>>>>>>> ethernet port just for testing.
>>>>>>>>
>>>>>>>> In the real world I'm trying to achieve a box that acts as a
>>>>>>>> firewall and depending on the service requested routes to an
>>>>>>>> internal machine lying on a DMZ.
>>>>>>>>
>>>>>>>> So,  I'd be using multiple ethernet ports as you would expect.
>>>>>>>>
>>>>>>>> To be clear (I hope) users would enter
>>>>>>>> http://somesite.somewhere.com and it would resolve to an IP
>>>>>>>> address on the firewall box.
>>>>>>>> They hit the outside interface (port 80 or 443) and it would
>>>>>>>> forward this to a machine on the DMZ.  That's all I'm trying t=
o
>>>>>>>> achieve here.
>>>>>>>>
>>>>>>>> Is this just achieved via a series of FORWARD commands like an=
y
>>>>>>>> other?
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2011-02-19, at 6:10 PM, Pascal Hambourg wrote:
>>>>>>>>
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> Feasey, Nicholas a =C3=A9crit :
>>>>>>>>>> I'm setting up a box that will be the only device on the
>>>>>>>>>> Internet and will forward requested services to other server=
s
>>>>>>>>>> sitting on a DMZ.
>>>>>>>>>>
>>>>>>>>>> As a test I started with redirecting a web server.
>>>>>>>>>>
>>>>>>>>>> To test my arrangement I first merely set up a simple
>>>>>>>>>> masquerade (just on my internal network) in my iptables like
>>>>>>>>>> so:
>>>>>>>>>>
>>>>>>>>>> *nat
>>>>>>>>>> :PREROUTING ACCEPT [0:0]
>>>>>>>>>> :POSTROUTING ACCEPT [0:0]
>>>>>>>>>> -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to
>>>>>>>>>> 192.168.40.15 -A POSTROUTING -j MASQUERADE
>>>>>>>>>
>>>>>>>>> Be aware that using MASQUERADE on all interfaces may not do
>>>>>>>>> what you want. Usually, it is used only on the public interne=
t
>>>>>>>>> side.
>>>>>>>>>
>>>>>>>>>> *filter
>>>>>>>>>> ...normal filtering lines follow.
>>>>>>>>>>
>>>>>>>>>> This POSTROUTING entry works as well:
>>>>>>>>>>
>>>>>>>>>> -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.40.15
>>>>>>>>>>
>>>>>>>>>> I think this is because the above line is doing the same as
>>>>>>>>>> the shortcut MASQUERADE.
>>>>>>>>>
>>>>>>>>> Not exactly. This rule replaces the source address of any
>>>>>>>>> connection going out eth0 with 192.168.40.15 whereas the abov=
e
>>>>>>>>> MASQUERADE rule replaces the source address of any connection
>>>>>>>>> going out any interface with the address of the interface.
>>>>>>>>>
>>>>>>>>> By the way, it is weird that you use the address of a remote
>>>>>>>>> host (the server in the DMZ).
>>>>>>>>>
>>>>>>>>>> When I check the httpd access_log it shows that the connecti=
on
>>>>>>>>>> came from
>>>>>>>>>> 192.168.40.15 as expected.  It works.
>>>>>>>>>
>>>>>>>>> I'm puzzled. A connection cannot match both the DNAT and SNAT
>>>>>>>>> rules as they have the same input and output interface eth0.
>>>>>>>>> Even if it did (the connection goes out the interface it came
>>>>>>>>> in), this connection would end up having the same address as
>>>>>>>>> source and destination 192.168.40.15.
>>>>>>>>> --
>>>>>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>>>>>> netfilter"
>>>>>>>>> in
>>>>>>>>> the body of a message to majordomo@vger.kernel.org More
>>>>>>>>> majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>>>>>
>>>>>>
>>>>>> Thank you for your reply.
>>>>>>
>>>>>> I just know that it's my inexperience that's getting me all mess=
ed
>>>>>> up here.
>>>>>> I've tried your advise but it's just not happening for me.
>>>>>> Thought I'd post my test iptables configuration in the hopes tha=
t
>>>>>> my issue can be identified.  I've made the configuration basic s=
o
>>>>>> that nothing else get's in my way.
>>>>>>
>>>>>> Here goes...
>>>>>>
>>>>>> So, assuming
>>>>>> $WAN_IFACE =3D eth0
>>>>>> $WAN_IP =3D 192.168.40.10
>>>>>> $WEBSERVER =3D 192.168.40.15
>>>>>>
>>>>>> Based on your recommendation of...
>>>>>>
>>>>>>> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80
>>>>>>> -j DNAT --to $WEBSERVER
>>>>>>>
>>>>>>> -A FORWARD -d $WEBSERVER -j ACCEPT
>>>>>>
>>>>>> *nat
>>>>>> :PREROUTING ACCEPT [0:0]
>>>>>> -A PREROUTING -i eth0 -d 192.168.40.10 -p tcp --dport 80 -j DNAT
>>>>>> --to
>>>>>> 192.168.40.15
>>>>>> COMMIT
>>>>>> *filter
>>>>>> :INPUT ACCEPT [0:0]
>>>>>> :FORWARD ACCEPT [0:0]
>>>>>> :OUTPUT ACCEPT [0:0]
>>>>>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT -A INPUT
>>>>>> -p icmp -j ACCEPT -A INPUT -i lo -j ACCEPT -A INPUT -i eth0 -j
>>>>>> ACCEPT -A FORWARD -d 192.168.40.15 -j ACCEPT COMMIT
>>>>>>
>>>>>> I know they are on the same interface but again I assume this
>>>>>> should work for testing purposes even though this would never be
>>>>>> done in a real environment.
>>>>>> I've assumed that the -A FORWARD goes in the *filter table and n=
ot
>>>>>> the *nat table?  Second assumption is that I don't need any rule=
s
>>>>>> per say in the $WEBSERVER iptables file as you explained.
>>>>>>
>>>>>> I beg your indulgence with my inexperience while I try to wrap m=
y
>>>>>> head around this and I might have taken out too many lines (or t=
wo
>>>>>> few) to get this to go.
>>>>>>
>>>>>> Bottom line is that with this in place I never get to the
>>>>>> $WEBSERVER like I"ve done with just my simple MASQUERADE test.
>>>>>>
>>>>>> I'm obviously missing something here and I can't begin to tell y=
ou
>>>>>> my frustration in my ability to get what I believe should be
>>>>>> relatively simple to work.  :)
>>>>>>
>>>>>> Nicholas
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> --
>>>>> Pandu E Poluan - IT Optimizer
>>>>> My website: http://pandu.poluan.info/
>>>>>
>>>>>
>>>>
>>>>
>>>
>>>
>>> --
>>> --
>>> Pandu E Poluan - IT Optimizer
>>> My website: http://pandu.poluan.info/
>>>
>>>
>>
>>
>
>
> --
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
>
>
>


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
