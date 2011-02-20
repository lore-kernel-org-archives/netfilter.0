From: Pandu Poluan <pandu@poluan.info>
Subject: Re: DMZ issue - redirect works as expected but behaviour not desired
Date: Sun, 20 Feb 2011 21:37:28 +0700
Message-ID: <AANLkTi=9euarpUK9RM6Gj6oRfyY1BvM7P2kR5_huXykE@mail.gmail.com>
References: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
	<4D604DCB.8030409@plouf.fr.eu.org>
	<FCF5BC26-F3C1-4533-AF80-DC33AAE3F772@utpress.utoronto.ca>
	<AANLkTi=rkXhB9UC=jG_wfF3P0MRjk4z-BVWjx4w=gb3m@mail.gmail.com>
	<DBDD48B6-7C43-48CC-8D9A-8BBD048C6E40@utpress.utoronto.ca>
	<AANLkTi=BFd1KYZ6pGEoH5BPb9BjdgY2uHj3i_LOXQ_=q@mail.gmail.com>
	<571669CE-5056-4264-89CB-4FFC7525CE15@utpress.utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <571669CE-5056-4264-89CB-4FFC7525CE15@utpress.utoronto.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Feasey, Nicholas" <nfeasey@utpress.utoronto.ca>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Your welcome :)

After the NAT is successful, don't forget to harden your iptables. And
while doing that, don't forget to ACCEPT packets that need to be
forwarded, e.g.:

-t filter -A FORWARD -s $WEBSERVER -p tcp --sport 80 -j ACCEPT

Good luck!

Rgds,


On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
> As I suspected I was doing myself in thinking that I could touch such=
 a
> thing on just one interface.  I have two interfaces and will now do i=
t the
> correct way.
>
> Thank you very much for your making it very clear for me and for your
> assistance!
>
> Nicholas
> On 2011-02-20, at 12:24 AM, Pandu Poluan wrote:
>
>> That won't work if the firewall, the webserver, and the client are a=
ll
>> in the same subnet.
>>
>> Let's assume:
>> * Client is 192.168.40.22
>> * Firewall is 192.168.40.10
>> * Webserver is 192.168.40.15
>>
>> Now client tries to access the faux-webserver:
>>
>> From: 192.168.40.22
>> To: 192.168.40.10
>>
>> The packet gets DNATed
>>
>> From: 192.168.40.22
>> To: 192.168.40.15
>>
>> See what happened? Because the source is the same subnet, the
>> webserver replies directly to the client.
>>
>> From: 192.168.40.15
>> To: 192.168.40.22
>>
>> The Linux firewall never sees the returning packet. And the client
>> sees a 'strange' packet, as the client's opened connection is with .=
10
>> not .15. This results in the client dropping the 'strange' packet.
>>
>> Now, the usual scenario is like this:
>>
>> Firewall Box has 2 interfaces:
>> * WAN: 202.72.112.5 (default gateway to ISP's router)
>> * DMZ: 192.168.40.1
>>
>> Webserver: 192.168.40.8 (default gateway is 192.168.40.1)
>>
>> Assume client is: 65.12.212.47
>>
>> Client opens a connection to the firewall:
>>
>> [1] From: 65.12.212.47
>> To: 202.72.112.5
>>
>> Firewall does a DNAT:
>>
>> From: 65.12.212.47
>> To: 192.168.40.8
>>
>> Webserver handles the request, and replies:
>>
>> From: 192.168.40.8
>> To: 65.12.212.47
>>
>> Since the destination is on a different subnet, the webserver hands
>> the packet to the firewall, which performs an 'un-DNAT':
>>
>> From: 202.72.112.5
>> To: 65.12.212.47
>>
>> The packet gets sent via the intertubes to the client, and the clien=
t
>> sees that the packet *is* a reply to its connection (see [1]; the
>> from: and to: addresses are properly swapped).
>>
>> So, if you want to test, you'll need to configure your network so th=
at:
>> * 2 interfaces on the Linux box
>> * the client and the webserver are *not* on the same subnet
>>
>> Rgds,
>>
>>
>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
>>> On 2011-02-19, at 8:28 PM, Pandu Poluan wrote:
>>>
>>>> (sorry for top posting; Gmail mobile client can only top-post)
>>>>
>>>> I've been doing what (I think) you're planning to do, i.e., mappin=
g an
>>>> external IP:port into DMZ (which uses private addressing)
>>>>
>>>> IMO, to do this, you really don't need more than 2 rules:
>>>> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80 -j
>>>> DNAT --to $WEBSERVER
>>>>
>>>> -A FORWARD -d $WEBSERVER -j ACCEPT
>>>>
>>>> With the above pair of rules, only the destination of incoming pac=
kets
>>>> get changed; the webserver would still see the original source
>>>> address. As long as the Linux firewall sees *both* incoming and
>>>> outgoing traffic from the webserver, netfilter will automatically
>>>> perform the inverse NAT.
>>>>
>>>> Of course you would want some -t raw -A PREROUTING rules to preven=
t
>>>> spoofing (esp. smurf attacks). But that's not strictly necessary f=
or
>>>> NAT-ing.
>>>>
>>>> CMIIW.
>>>>
>>>> Rgds,
>>>>
>>>>
>>>> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrot=
e:
>>>>> Thank you for your response and explanation of the difference bet=
ween
>>>>> MASQUERADE and SNAT.
>>>>>
>>>>> I really do not want to use MASQUERADE for exactly the reason tha=
t you
>>>>> state.
>>>>>
>>>>> My explanation is confusing because I was using the same ethernet=
 port
>>>>> just
>>>>> for testing.
>>>>>
>>>>> In the real world I'm trying to achieve a box that acts as a fire=
wall
>>>>> and
>>>>> depending on the service requested routes to an internal machine =
lying
>>>>> on
>>>>> a
>>>>> DMZ.
>>>>>
>>>>> So,  I'd be using multiple ethernet ports as you would expect.
>>>>>
>>>>> To be clear (I hope) users would enter http://somesite.somewhere.=
com
>>>>> and
>>>>> it
>>>>> would resolve to an IP address on the firewall box.
>>>>> They hit the outside interface (port 80 or 443) and it would forw=
ard
>>>>> this
>>>>> to
>>>>> a machine on the DMZ.  That's all I'm trying to achieve here.
>>>>>
>>>>> Is this just achieved via a series of FORWARD commands like any o=
ther?
>>>>>
>>>>>
>>>>> On 2011-02-19, at 6:10 PM, Pascal Hambourg wrote:
>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> Feasey, Nicholas a =C3=A9crit :
>>>>>>> I'm setting up a box that will be the only device on the Intern=
et and
>>>>>>> will forward requested services to other servers sitting on a D=
MZ.
>>>>>>>
>>>>>>> As a test I started with redirecting a web server.
>>>>>>>
>>>>>>> To test my arrangement I first merely set up a simple masquerad=
e
>>>>>>> (just
>>>>>>> on my internal network) in my iptables like so:
>>>>>>>
>>>>>>> *nat
>>>>>>> :PREROUTING ACCEPT [0:0]
>>>>>>> :POSTROUTING ACCEPT [0:0]
>>>>>>> -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to 192.168.40=
=2E15
>>>>>>> -A POSTROUTING -j MASQUERADE
>>>>>>
>>>>>> Be aware that using MASQUERADE on all interfaces may not do what=
 you
>>>>>> want. Usually, it is used only on the public internet side.
>>>>>>
>>>>>>> *filter
>>>>>>> ...normal filtering lines follow.
>>>>>>>
>>>>>>> This POSTROUTING entry works as well:
>>>>>>>
>>>>>>> -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.40.15
>>>>>>>
>>>>>>> I think this is because the above line is doing the same as the
>>>>>>> shortcut
>>>>>>> MASQUERADE.
>>>>>>
>>>>>> Not exactly. This rule replaces the source address of any connec=
tion
>>>>>> going out eth0 with 192.168.40.15 whereas the above MASQUERADE r=
ule
>>>>>> replaces the source address of any connection going out any inte=
rface
>>>>>> with the address of the interface.
>>>>>>
>>>>>> By the way, it is weird that you use the address of a remote hos=
t (the
>>>>>> server in the DMZ).
>>>>>>
>>>>>>> When I check the httpd access_log it shows that the connection =
came
>>>>>>> from
>>>>>>> 192.168.40.15 as expected.  It works.
>>>>>>
>>>>>> I'm puzzled. A connection cannot match both the DNAT and SNAT ru=
les as
>>>>>> they have the same input and output interface eth0. Even if it d=
id
>>>>>> (the
>>>>>> connection goes out the interface it came in), this connection w=
ould
>>>>>> end
>>>>>> up having the same address as source and destination 192.168.40.=
15.
>>>>>> --
>>>>>> To unsubscribe from this list: send the line "unsubscribe netfil=
ter"
>>>>>> in
>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.ht=
ml
>>>>>>
>>>
>>> Thank you for your reply.
>>>
>>> I just know that it's my inexperience that's getting me all messed =
up
>>> here.
>>> I've tried your advise but it's just not happening for me.
>>> Thought I'd post my test iptables configuration in the hopes that m=
y
>>> issue
>>> can be identified.  I've made the configuration basic so that nothi=
ng
>>> else
>>> get's in my way.
>>>
>>> Here goes...
>>>
>>> So, assuming
>>> $WAN_IFACE =3D eth0
>>> $WAN_IP =3D 192.168.40.10
>>> $WEBSERVER =3D 192.168.40.15
>>>
>>> Based on your recommendation of...
>>>
>>>> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80 -j
>>>> DNAT --to $WEBSERVER
>>>>
>>>> -A FORWARD -d $WEBSERVER -j ACCEPT
>>>
>>> *nat
>>> :PREROUTING ACCEPT [0:0]
>>> -A PREROUTING -i eth0 -d 192.168.40.10 -p tcp --dport 80 -j DNAT --=
to
>>> 192.168.40.15
>>> COMMIT
>>> *filter
>>> :INPUT ACCEPT [0:0]
>>> :FORWARD ACCEPT [0:0]
>>> :OUTPUT ACCEPT [0:0]
>>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>> -A INPUT -p icmp -j ACCEPT
>>> -A INPUT -i lo -j ACCEPT
>>> -A INPUT -i eth0 -j ACCEPT
>>> -A FORWARD -d 192.168.40.15 -j ACCEPT
>>> COMMIT
>>>
>>> I know they are on the same interface but again I assume this shoul=
d work
>>> for testing purposes even though this would never be done in a real
>>> environment.
>>> I've assumed that the -A FORWARD goes in the *filter table and not =
the
>>> *nat
>>> table?  Second assumption is that I don't need any rules per say in=
 the
>>> $WEBSERVER
>>> iptables file as you explained.
>>>
>>> I beg your indulgence with my inexperience while I try to wrap my h=
ead
>>> around this and I might have taken out too many lines (or two few) =
to get
>>> this to go.
>>>
>>> Bottom line is that with this in place I never get to the $WEBSERVE=
R like
>>> I"ve done with just my simple MASQUERADE test.
>>>
>>> I'm obviously missing something here and I can't begin to tell you =
my
>>> frustration in my ability to get what I believe should be relativel=
y
>>> simple
>>> to work.  :)
>>>
>>> Nicholas
>>>
>>>
>>>
>>>
>>
>>
>> --
>> --
>> Pandu E Poluan - IT Optimizer
>> My website: http://pandu.poluan.info/
>>
>>
>
>


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
