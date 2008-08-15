From: "Stephen Isard" <y8ju2p902@sneakemail.com>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 10:17:53 -0400 (EDT)
Message-ID: <19140-74447@sneakemail.com>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net>
 <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr>
 <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
 <30978-20009@sneakemail.com> <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Oh it's --rsource not --rsrc. But --rdest is correct.

Ok!  Now I find the printers.  (I also had to stick -j ACCEPT at the 
ends of the lines.  You were probably taking that for granted.)

> I was assuming,
> from what you told me, that a standalone printer spews SNMP to a
> broadcast address and a Linux box replies, but now it looks like that
> hardly makes sense ;-)

No, the printers don't spew.  They sit there demurely waiting for 
broadcasts.

> The port is not stored, since in common sense, it is not part of the
> address. An (address,port) tuple is however not stored.

Assuming you really mean that last "not", then my description
>> If the port isn't
>> stored, then all we are storing is the address of our own interface
>> and we match any packet coming in from a port 161.  That's still an
>> improvement because we only let in the packets during a relatively
>> short window after a broadcast, but it's not quite what we'd really
>> like.
seems to apply.  So if a bad guy knew how take advantage of udp 
broadcasts to arbitrary high numbered ports, he could sit there waiting 
for a cups broadcast and then send his evil packets from his port 161 to 
whichever of my ports he wanted.  Fortunately, such broadcasts will not 
be very frequent, since once the printers are discovered, there is no 
need to rediscover them until something changes.  But still it would be 
better to match the broadcast port number.  A new feature?

>> But is there an approved firewall setup for samba these days?  (I 
>> don't use samba myself.)  If so, maybe we could adapt it.

> If by approved you mean what distributions use, then that's something
> simple along the lines of
> -A INPUT -p udp --dport 137:139 -j ACCEPT

Hmm.  That doesn't seem to address the issue at all.  Maybe samba has 
changed, or I was misunderstanding.

Thanks for your help!
