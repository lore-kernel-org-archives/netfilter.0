From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Using MARK and TOS to route traffic through different   interfaces
 to the same destination
Date: Thu, 11 Dec 2008 13:41:32 +0100
Message-ID: <49410A7C.6010501@plouf.fr.eu.org>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com> <1228998831.22977.9.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1228998831.22977.9.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Thomas Jacob a =E9crit :
> On Thu, 2008-12-11 at 13:18 +0100, Javier G=E1lvez Guerrero wrote:
>>
>> I need to route packets through different interfaces (let them be at=
h0
>> and eth0) depending on the application source port, so I thought usi=
ng
>> TOS or MARK targets of iptables would be helpful.
>>
>> Anyway, as I try configure it to mark the traffic and updating the
>> routing tables through many different ways, I can't get it working s=
o
>> the packets are always sent through the "default" interface in the
>> main routing table.
>>
>> For example, if I use MARK I configure it this way:
>>
>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60301 -j MARK --set=
-mark 1
>> sudo iptables -A OUTPUT -t mangle -p tcp --dport 60302 -j MARK --set=
-mark 2

These rules match the destination port. Replace --dport with --sport to=
=20
match the source port.

> AFAIK, locally generated packets are routed before they are sent to
> netfilter, so setting fwmarks there to influence routing is pointless=
=2E

A rerouting happens after the OUTPUT chains in order to take into=20
account destination NAT and marks.
