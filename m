From: Lesley Binks <lesley.binks@googlemail.com>
Subject: Re: Building network
Date: Thu, 6 Aug 2009 12:33:21 +0100
Message-ID: <cfd8acdc0908060433g30297806oeb9d2a7cde7dcfbf@mail.gmail.com>
References: <ca067d757753e0893cbebd61d2c90c8c.squirrel@webmail.vp44.net>
	 <b4a3339c0908060310p1314e793q8cd3a183cb8f59e3@mail.gmail.com>
	 <a72d2cfe2db630c3ff5a4ddb83062fc2.squirrel@webmail.vp44.net>
Reply-To: lesley.binks@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-firewall=debian-firewall=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:reply-to:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5CH0YvHDGUT698hmjFiAd887iX2ZPEujS81Qbo5aFko=;
        b=CG4lYAoAARAcPHLxJyKXzQMB96nCbsm1417wbIXtpvOz+9OBetwcYaXoEjQCAiG5X3
         PQFzfjZBPdv34ATDxOYNxvFo1ezht/b3h3arhZVr7O/kfOEJ4Xq8zg5Sq9Sz1ADtiskH
         3hWGKY7HvpR3cv2tWz+0LC0HmvWxHGMSMmoUc=
In-Reply-To: <a72d2cfe2db630c3ff5a4ddb83062fc2.squirrel@webmail.vp44.net>
Resent-Message-ID: <5rEnRJX6qwL.A.K7H.V-reKB@liszt>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:debian-firewall@lists.debian.org>
List-Help: <mailto:debian-firewall-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-firewall-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-firewall-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="utf-8"
To: jknowlton@vp44.com
Cc: netfilter@vger.kernel.org, debian-firewall@lists.debian.org

2009/8/6 Jack Knowlton <jknowlton@vp44.com>:
> On Thu, August 6, 2009 12:10 pm, Makara wrote:
>> Hi Jack,
>>
>> Would you mind to draw out your idea and network diagram so that we can
>> understand it well ?.
>>
>> Example:
>>
>> =C2=A0{ISP}----------(eth0)-{Debain}-(eth1)--{Switch}----{server2}
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {server 2} {LAN}
>> you would like ......
>>
>>
>>
>> On Thu, Aug 6, 2009 at 2:55 PM, Jack Knowlton <jknowlton@vp44.com> wrote=
:
>>
>>> Hi all.
>>> I have just switched to a new DSL provider and I need some serious help
>>> re-building my iptables/routing setup for the new connection.
>>> The ISP now provides me with a /29 subnet that I want to use for some o=
f
>>> the computers on my LAN.
>>>
>>> The access device, a DSL bridge, is attached to the debian routing box
>>> (currently with 2 interfaces). According to the ISP tech department
>>> (they
>>> are referring to a standard soho router) I have to set the internal
>>> (LAN)
>>> interface to xxx.xxx.xxx.153 and the outside interface (WAN) will get
>>> the
>>> IP assigned by their DHCP. I then have 5 more IPs that I want to assign
>>> to
>>> different computers (static addressing - no internal DHCP needed).
>>>
>>> Since I want to host various servers, all of the computers that get
>>> public
>>> IPs will have to be accessible on whatever service they're hosting. In
>>> the
>>> case of the mailserver, the outgoing IP has to be the real one (and not
>>> the routing box's) because of rdns and dnsbl issues.
>>> Basically I think I do not need NAT. Unfortunately I have no idea how t=
o
>>> implement that..
>>>
>>> Next: there's a bunch of wifi clients that connect to an internal AP. T=
o
>>> be on the safe side I decided to keep the AP in a local LAN
>>> (10.0.1.0/24)
>>> and have the debian box to do NAT for them.
>>> My idea would be to add a third network interface to the routing box an=
d
>>> give it a local LAN address, then use a basic iptables setup to have it
>>> NAT for any local client that requests it.
>>>
>>> If someone has had some experience with this I would really appreciate
>>> some guidence with what I'm trying to set-up.
>>> Regards,
>>>
>>> -JK
>>>
>>>
>
>
> Right :D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{server4}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|
> {ISP}--{DSL-brige}--(eth0)-{Debian}-(eth1)--{Switch}-(eth0)-{server2}-(et=
h1)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (eth2) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (eth0)-{=
server3}-(eth1) =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\---------{switch2}----------------/----/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {=
AP}
>
>
> {Debian}
> ppp0: bridge interface (PPPoE via eth0)
> eth1: LAN with public IP interface (xxx.xxx.xxx.153)
> eth2: LAN with private IP interface (10.0.1.2)
>
> {server2}
> eth0: LAN with public IP (in /29 subnet)
> eth1: LAN with private IP (10.0.1.3)
>
> {server3}
> same as server2
>
> {AP}
> eth0: LAN with private IP (10.0.1.5)
>
This is a bit confusing to me .... you have multiple instances of ethn
where n=3D0,1.
You also appear to have more than one route to a subnet and claim at
least two interfaces with the same IP address i.e. is server 2 really
the same as server 3 ?

Your IP addresses should be passed into your Debian box - you shonuld
then provide routes to the external facing IP addresses - is server 3
on a NIC from the Debian box ?
If so where is eth3 on the Debian box and what address does that have?
 Likewise server 4 -- how do you route to that?

<snip>

Regards

L.

