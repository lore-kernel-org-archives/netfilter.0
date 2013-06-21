From: =?iso-8859-1?Q?Andr=E9_Paulsberg?= <Andre.Paulsberg@evry.com>
Subject: RE: 'Invalid packet' problem since upgrading
Date: Fri, 21 Jun 2013 06:36:55 +0000
Message-ID: <838AB161BE491743AE3CA3A916CF1CC601A35F13@ccdex004>
References: <51BF10F2.2040808@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51BF10F2.2040808@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello Allen ,

There is not enough info in this case to solve it with any good certain=
ty ,
However IF I should make an educated guess it would be some sort of pro=
blem with the Wii-U .

My reasoning is simple , since I lack all the facts :

1. All other traffic seems to go fine .
2. The new versin of Ubuntu probably has a new version of IPTABLES ( bu=
t this is unknown to me since you did not include this info )
3. The stateful inspection might have been change in a way that either =
blocks traffic that it should but didn't before ( a fix in the new vers=
ion ),
   or it now blocks traffic it should not block but handled correctly b=
efore ( a bug added to the new version ).

With this lack of information , I will ASSUME there is a fix in the new=
 version ( this typicaly the way with new versions ).
and since no other traffic is affected there is a possibility the Wii-U=
 is doing something wrong that earlier versions did not take into
considerartion during stateful inspection .
( this also explains why a setup without firewall works , since a "fire=
wallless" environment has no stateful inspection ).

I would recommend doing a TCPDUMP into a file , and having all traffic =
to/from Wii-U analyzed .
This would actually make it possible to spot any state mismatch in pack=
ets created by Wii-U and verify my teory
( or prove my assumptions wrong :)

My personaly would do a dump to pcap file , and analyze in wireshark .
It colormarks packets who it thinks are "OFF" in some manner , and has =
a more readable trace in a big tcpdump .

tcpdump -n -s 0 -i eth0 host 192.168.58.38 -w Wii-U.pcap

Should do the trick , I would personally dump during a bootup , a "inte=
rnet connection test" and finaly try connect to nintendo services .

Hope this helps in you in any way ...


Best regards
Andr=E9 Paulsberg
Senior Network Engineer=20
Core Network
Operation, Network, Nordic Operations
andre.paulsberg@evry.com
M +47 xxx yyyyy

