From: Tanguy Ropitault <tanguy.ropitault@telecom-bretagne.eu>
Subject: IPv4 in IPv6 encapsulator
Date: Tue, 13 Oct 2009 10:54:46 +0200
Message-ID: <4AD44056.1030601@telecom-bretagne.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I try to implement an IPv4 in IPv6 encapsulator/decapsulator on my own. 
I know that ip4ip6 tunnel exists in Linux but I need to do it for some 
special features!
So in order to do that, I use libipq (which is quite obsolete I know).
The principle is the following:

IPv4/IPv6                    IPv4/IPv6
Host A     --------------->  Host B
@IPv4A                       @IPv4B
@IPv6A                       @IPv6B

Host A pings host B in IPv4 (ping @IPv4B).
With libipq, I encapsulate the V4 ping in V6 which gives the following 
packet:  [@IPv6A @IPv6B][@IPv4A @IPv4B][ICMPv4].
Host B receives the IPv4 in IPv6 ping. I decapsulate the IPv6 header 
with libipq. It gives me the following IPv4 echo request: [@IPv4A 
@IPv4B][ICMPv4].
Then with a raw socket where sin->addr is set to @IPv4B, I "send" the 
IPv4 echo request in order to have the right echo reply.
The kernel produces me an echo reply but it's where the problem begins. 
The echo reply has as source addr @IPv4B which is logical but also 
@IPv4B as destination address wereas I'm waiting @IPv4A to reply to the 
ping. I dont understand why. I think it has something to deal with the 
fact that the IPv4 echo request is "generated localy" when I decaspulate 
the IPv6 header but I dont get it... Note also that I just 
decapsulate/encapsulate the header, I never manipulate src or dst address.

If you have any tips for solving that, that would be great. If i post on 
netfilter mailing list, It's because I think someone with a great 
knowledge on the netfilter chain can easily indentify the problem. If 
I'm in the wrong place, sorry...

Thank you,
cheers.

Tanguy

