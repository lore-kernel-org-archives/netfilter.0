From: Guido Anzuoni <ganzuoni@gmail.com>
Subject: Hanging outgoing connections while incoming are OK
Date: Sat, 28 Jan 2012 09:39:44 +0100
Message-ID: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=OuP7Nxg52f0qMZMggtea9Fs9QHng2fcDBMDKQBin0vA=;
        b=Udotnm70OyjEnStTieJivoS1+KhlghgG6kmqsxIHueW2Gw5jyq8Tv84HsZu78ZU00x
         WBKMeEPAtGDJ0xWAg6zy1tv7wt2OGVFGzUsgvJqiD+JtY8DZWggDFXUn0WJCUHzhIVyt
         HhS+VbkxtI0TzuqQ9JKCP9Pbu2wFRntgw/aLk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I'm setting up a firewall (CentOS 5.3) for our internet connection.
We have multiple internal networks so the fw has 5 network adapter.
Internet connection is managed by the ISP with 2 cisco router in LB.
I have absolutely no problem performing DNAT for incoming connections b=
ut
I am facing a strange problem with outgoing ones.
Let simplify the configuration.
Public addresses assigned: PUB_IP_OUTGOING, PUB_IP_OUTGOING
There is a subnet connecting the fw with the routers:
fw address:=A010.254.254.1/24
Router1:=A010.254.254.3/24
Router2:=A010.254.254.4/24
Virtual ip for route:=A010.254.254.2/24

fw default gateway: 10.254.254.2
fw eth0: 10.254.254.1, PUB_IP_OUTGOING, PUB_IP_OUTGOING

Internal networks:
fw eth1: 192.168.16.1
fw eth2: 192.168.17.1


The main iptables rule for outgoing connections is:
-A POSTROUTING -o eth0 -j SNAT --to-source PUB_IP_OUTGOING

Please note that we have a secondary internet connection managed by a
router at 192.168.16.80
so I have an additional rule:
-A POSTROUTING -o eth1 -j SNAT --to-source 192.168.16.1

Now, I have really strange behaviour browsing the web from internal net=
works
(well, even ssh outgoing connection from a windows box with putty
- connection is established but I have lost packets).
With certain urls the browser hangs waiting for something.
I have found one of these urls (an image perfectly valid about 7k)
and doing a wget of the same url
it downloads about 6k and hangs waiting for the remaining part
(beware that other urls for the same webserver perfectly work).
If I replace the default gateway with 192.168.16.1 I never miss a beat.
I have turned off one cisco router but nothing changes
(so LB should not be a problem - but, maybe, I have to turn off the
modem too... - ).
I have inspected with tcpdump the flow of packets and I have seen that =
the
requests come in from ethxx with INTERNAL_IP->TRAGET_WEB_SERVER pair
of addresses and
is outputted on eth0 with PUB_IP_OUTGOING->TRAGET_WEB_SERVER
and when I switch default gateway
is outputted on eth0 with 192.168.16.1->TRAGET_WEB_SERVER

My doubt is about eth0 configuration where I bind multiple addresses,
an internal one and all the public assigned by the ISP.
Is it a correct setup ?
I can't find anything wrong since certains connections are OK
while other are failing during packet flow.
More, when I switch gateway everything is perfectly working, but there
is a difference.
In this case, the SNAT address is on the same network of the router
while in the normal case
the SNAT address is the public one
(obviously, the ISP routes with PUB_IP_OUTGOING destination to 10.254.2=
54.1).

TIA
Guido
