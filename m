From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 09:51:09 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com> <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Padmanabhan <rpdumps@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-07-21 08:15, Padmanabhan wrote:

>Hello All,
>I am couple of questions on whether iptables can used to achieve my requirement.
>
>Test Setup
>Two Fedora core 9 ( kernel 2.6.25.6-55) systems running Intel 2 core
>duo processor as iSCSI initiator/target connected via Gig Ethernet
>switch
>IP Tables v 1.4.0
>
>Requirement
>On the target system, I have to look for packets that have TOS bits
>set and in those packets, I have look beyond the TCP header i.e. into
>iSCSI header for specific values.
>In this case, i am looking for iSCSI read command( first byte) and
>notedown ITT value ( 4 bytes, from 16-19 )

-p tcp -m tos --tos 0x10/0x10 -m u32
--u32 "0 >> 22 & 0x3C @ 12 >> 28 @ 0 >> 24 = 0x13 &&
       0 >> 22 & 0x3C @ 12 >> 28 @ @ 16 = 0x1337"

Reading as:

(- offset is 0)
- bytes 0-3 from the IP header, shift them right by 22 (giving the IHL),
  and with 0x3C
- add that value to the offset
(- offset is now the TCP header)
- bytes 12-15 from the TCP header, shift them right by 28 (giving the Offset),
- add that value to the offset
(- offset is now the iSCSI header)
- bytes 0-3 from the iSCSI header, shift them right by 24 (therefore giving
  the first byte), compare with 0x13 (assuming this is the number for the
  read command)

[I hope I got it right]

and the same tests with byte 16-19, checking for example, 0x1337 as ITT.
Note that this matches one specific ITT value only. If you want to
log all ITTs, then you should omit the ITT test and only test for iSCSI,
and log that using your favorite method.
