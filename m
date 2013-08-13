From: =?iso-8859-1?Q?Andr=E9_Paulsberg?= <Andre.Paulsberg@evry.com>
Subject: RE: Help with stateless firewall
Date: Tue, 13 Aug 2013 06:56:49 +0000
Message-ID: <838AB161BE491743AE3CA3A916CF1CC60D087585@ccdex004>
References: <5209377B.5030105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5209377B.5030105@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Alex Flex <aflexzor@gmail.com>

I agree with Rob0 , but the problem here is that you do not specify WHA=
T you are doing from your machine .
=46rom your rules , it's obvious you are running a SSH and WEB deamon o=
n this machine .

> a.) When allowing web traffic, is it neecessary to allow port range 1=
000:65535 ?

However you do not need to open port 1000-65535 for this or any other r=
eason , except MAYBE return traffic from your machine .
Since your mail does not specify any traffic originating from this mach=
ine , it should not be needed !

IF however you use this machine for "client" access , you should rather=
 add source ports (--sport) for each client ports you need on INPUT .

Typical you need port 53 UDP and TCP for name resolution , and you shou=
ld consider opening up for ICMP TYPE 3 for error messages .
Adding your DNS servers IP and allowing all traffic from them is possib=
le , but I think this is bad solution . ( not best practice )

> b.) What is needed to safely have a default OUTPUT DROP, apparently a=
s=20
> soon as i change it to that iam unable to access it via ssh, even if =
I=20
> add a rule like this: /sbin/iptables -A OUTPUT -p tcp --dport 22 -j A=
CCEPT


DROP OUTPUT fails because you don't have any source ports allowed ,

/sbin/iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT

And you will also need to ADD rules for DNS traffic going out

/sbin/iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

ATLEAST !!


> i saw that due to this rule sending packets to those ports directly r=
espond with a REJECT instead of a DROP which is preffered.

This is because you have made a rule ACCEPTing port 1000-65535 INPUT , =
and also made a default rule ACCEPTing tcp nack OUTPUT=20


> Any workaround and still have a stateless setup?

Well yes , remove/replace the port 1000 - 65535 opening INPUT !
( or DROP tcp nack OUTPUT , which would just be silly )


I cannot tell you anymore since there is not any more info on what you =
are doing ,
But adding a LOG statement in INPUT and OUTPUT before the DROP should h=
elp you spot any trouble .


Kind Regards Andr=E9

