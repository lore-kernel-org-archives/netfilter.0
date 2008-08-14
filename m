From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 16:37:06 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808141635040.29462@fbirervta.pbzchgretzou.qr>
References: <19894-78618@sneakemail.com> <alpine.LNX.1.10.0808141557590.29462@fbirervta.pbzchgretzou.qr> <18385-66657@sneakemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <18385-66657@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Isard <y8ju2p902@sneakemail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2008-08-14 16:23, Stephen Isard wrote:
> On Thu, 14 Aug 2008, Jan Engelhardt jengelh-at-medozas.de |netfilter| wrote:
>
>> CUPS does not actually use SNMP, does it? The way I have seen its
>> output are regular UDP transmissions from and to port 631, without
>> any replies (much like most NBT packets).
>>
>>  -d 192.168.0.255 -p udp --dport 631
>
> It does that too, but yes, recent (I'm not sure since when) cups also uses
> snmp.  The port 631 transmissions are for finding other computers that share
> their printers.  Snmp is used for finding standalone printers with their own ip
> addresses on your local network.

Makes sense. It is only natural that the reply packet is not
associated with the original connection, because the sender address
is not 192.168.0.255. You could write a layer-4 connection tracker
that observes packets to 192.168.0.255:631, verifies that they are of
SNMP nature (or not verify at all and Just Do It), and then
instantiate a new expectation, therefore making replies matching -m
conntrack --ctstate RELATED.
