From: =?UTF-8?Q?David_Bala=C5=BEic?= <xerces9@gmail.com>
Subject: Re: How to do a "double" NAT ?
Date: Wed, 8 Jul 2009 13:23:00 +0200
Message-ID: <9948385e0907080423x56f22f3dl96ec79df62525103@mail.gmail.com>
References: <9948385e0907071348g3aa24b91of296401ff38e3eea@mail.gmail.com>
	 <1247012313.8471.18.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Krbh8iBXeA7uDDA+q+vYZZ4z94psuPZnzqR0pa/zh5k=;
        b=SO+Uh93c1pi8UvVdjt5Oo2S0wXxn3OGz69qc5nYij93j6Q8074twCz11FBTKOePN/b
         dJh5yz0Gc6EtngReYRoyNYFYFui/kYqxku452sy2UogQW1pzon4Cu2QN3foDQcsdQutZ
         ssdB1vAvFqLhKLOmmee2hfOubD6Hu2jxPdOSQ=
In-Reply-To: <1247012313.8471.18.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

=46or the record, this worked:

# I used port 8085 on outside, as 80 is already used for the routers GU=
I

# vlan1 is just a network interface, just like br0, eth1, wlan1, ppp0 ;=
-)

iptables -A FORWARD -i ppp0 -o vlan1 -j ACCEPT

# 1.2.3.4 is the remote IP I only allow access
iptables -t nat -A prerouting_rule -i ppp0 -p tcp -s 1.2.3.4 --dport
8085 -j DNAT --to 192.168.1.254:80

iptables -t nat -A POSTROUTING -o vlan1 -p tcp -d 192.168.1.254
--dport 80 -j SNAT --to-source 192.168.1.1

# I guess prerouting_rule is OpenWRT specific, is "linked" from the
PREROUTING rule/table/chain/whatever-it-is-called-properly

Regards,
David

2009/7/8 =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=
=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>:
> =D0=92 =D0=92=D1=82=D0=BE, 07/07/2009 =D0=B2 22:48 +0200, David Bala=C5=
=BEic =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi!
>>
>> I have a bit specific, but not that unusual problem.
>>
>> I have linux 2.4 (OpenWRT 1.0) running on a home router.
>> ppp0 has the connection to outside world and br0 is the local networ=
k
>> and is "NAT-ed".
>>
>> I also have a vlan0 interface with IP address =C2=A0192.168.1.1. On =
that
>> network there is a host that has a HTTP server on port 80 and accept=
s
>> connections only from 192.168.1.x.
>>
>> What I want is to set up a rule that allows outside hosts (the entir=
e
>> internet, ok maybe limited to a single IP) access to that port and o=
f
>> course masquerades it to appear as if coming from 192.168.1.x.
>>
>> There I'm lost. I have good unix experience, but managed to avoid
>> packet filters until now ;-)
>
> iptables -t nat -A PREROUTING -i ppp0 -p tcp -d <ppp0_IP> --dport 80 =
-j
> DNAT --to-destination 192.168.1.1
> iptables -t nat -A POSTROUTING -o br0 -p tcp -d 192.168.1.1 --dport 8=
0
> -j SNAT --to-source <br0_IP>
>
> I managed to avoid VLAN setups, so the above will work for the case
> without vlan when HTTP server is connected to br0.
>
> --
> =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=
=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>
>
>
