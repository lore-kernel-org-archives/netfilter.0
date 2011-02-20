From: Pandu Poluan <pandu@poluan.info>
Subject: Re: DMZ issue - redirect works as expected but behaviour not desired
Date: Sun, 20 Feb 2011 08:34:11 +0700
Message-ID: <AANLkTi=rPk5VTFzj0VruOGksm4+SzchacXs1SBG95dyX@mail.gmail.com>
References: <41BA18AA-DB18-493A-9429-37A188A2442B@utpress.utoronto.ca>
	<4D604DCB.8030409@plouf.fr.eu.org>
	<FCF5BC26-F3C1-4533-AF80-DC33AAE3F772@utpress.utoronto.ca>
	<AANLkTi=rkXhB9UC=jG_wfF3P0MRjk4z-BVWjx4w=gb3m@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=rkXhB9UC=jG_wfF3P0MRjk4z-BVWjx4w=gb3m@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Feasey, Nicholas" <nfeasey@utpress.utoronto.ca>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

(sorry. should've replied to all)


On 2011-02-20, Pandu Poluan <pandu@poluan.info> wrote:
> (sorry for top posting; Gmail mobile client can only top-post)
>
> I've been doing what (I think) you're planning to do, i.e., mapping a=
n
> external IP:port into DMZ (which uses private addressing)
>
> IMO, to do this, you really don't need more than 2 rules:
>
> -t nat -A PREROUTING -i $WAN_IFACE -d $WAN_IP -p tcp --dport 80 -j
> DNAT --to $WEBSERVER
>
> -A FORWARD -d $WEBSERVER -j ACCEPT
>
> With the above pair of rules, only the destination of incoming packet=
s
> get changed; the webserver would still see the original source
> address. As long as the Linux firewall sees *both* incoming and
> outgoing traffic from the webserver, netfilter will automatically
> perform the inverse NAT.
>
> Of course you would want some -t raw -A PREROUTING rules to prevent
> spoofing (esp. smurf attacks). But that's not strictly necessary for
> NAT-ing.
>
> CMIIW.
>
> Rgds,
>
>
> On 2011-02-20, Feasey, Nicholas <nfeasey@utpress.utoronto.ca> wrote:
>> Thank you for your response and explanation of the difference betwee=
n
>> MASQUERADE and SNAT.
>>
>> I really do not want to use MASQUERADE for exactly the reason that y=
ou
>> state.
>>
>> My explanation is confusing because I was using the same ethernet po=
rt
>> just
>> for testing.
>>
>> In the real world I'm trying to achieve a box that acts as a firewal=
l and
>> depending on the service requested routes to an internal machine lyi=
ng on
>> a
>> DMZ.
>>
>> So,  I'd be using multiple ethernet ports as you would expect.
>>
>> To be clear (I hope) users would enter http://somesite.somewhere.com=
 and
>> it
>> would resolve to an IP address on the firewall box.
>> They hit the outside interface (port 80 or 443) and it would forward=
 this
>> to
>> a machine on the DMZ.  That's all I'm trying to achieve here.
>>
>> Is this just achieved via a series of FORWARD commands like any othe=
r?
>>
>>
>> On 2011-02-19, at 6:10 PM, Pascal Hambourg wrote:
>>
>>> Hello,
>>>
>>> Feasey, Nicholas a =C3=A9crit :
>>>> I'm setting up a box that will be the only device on the Internet =
and
>>>> will forward requested services to other servers sitting on a DMZ.
>>>>
>>>> As a test I started with redirecting a web server.
>>>>
>>>> To test my arrangement I first merely set up a simple masquerade (=
just
>>>> on my internal network) in my iptables like so:
>>>>
>>>> *nat
>>>> :PREROUTING ACCEPT [0:0]
>>>> :POSTROUTING ACCEPT [0:0]
>>>> -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT --to 192.168.40.15
>>>> -A POSTROUTING -j MASQUERADE
>>>
>>> Be aware that using MASQUERADE on all interfaces may not do what yo=
u
>>> want. Usually, it is used only on the public internet side.
>>>
>>>> *filter
>>>> ...normal filtering lines follow.
>>>>
>>>> This POSTROUTING entry works as well:
>>>>
>>>> -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.40.15
>>>>
>>>> I think this is because the above line is doing the same as the
>>>> shortcut
>>>> MASQUERADE.
>>>
>>> Not exactly. This rule replaces the source address of any connectio=
n
>>> going out eth0 with 192.168.40.15 whereas the above MASQUERADE rule
>>> replaces the source address of any connection going out any interfa=
ce
>>> with the address of the interface.
>>>
>>> By the way, it is weird that you use the address of a remote host (=
the
>>> server in the DMZ).
>>>
>>>> When I check the httpd access_log it shows that the connection cam=
e
>>>> from
>>>> 192.168.40.15 as expected.  It works.
>>>
>>> I'm puzzled. A connection cannot match both the DNAT and SNAT rules=
 as
>>> they have the same input and output interface eth0. Even if it did =
(the
>>> connection goes out the interface it came in), this connection woul=
d end
>>> up having the same address as source and destination 192.168.40.15.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
