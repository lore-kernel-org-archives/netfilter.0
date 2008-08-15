From: "Stephen Isard" <y8ju2p902@sneakemail.com>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 09:10:41 -0400 (EDT)
Message-ID: <30978-20009@sneakemail.com>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net>
 <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr>
 <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu, 14 Aug 2008, Jan Engelhardt jengelh-at-medozas.de |netfilter| wrote:
...
> You can specify --rsrc/--rdest (patch just merged that documents them).
> But somehow I am not sure...
>
> -A INPUT -d 192.168.0.255 -p udp --dport 161 -m recent --name snmp
> --rsrc --set
>
> -A OUTPUT -p udp --sport 161 -m recent --name snmp
> --rdest --rcheck
>
> Try?

I've tried, but my system doesn't seem to like --rsrc/--rdest.

Just to make sure I'm not completely confused, you've made a typo and 
reversed INPUT and OUTPUT, right?  That is, I think we want --set to 
happen on output when we broadcast to the destination port 161.

After making that adjustment, when I try to load the rules, I get an 
error message:
Applying iptables firewall rules: iptables-restore v1.3.5: Unknown arg 
`--rsrc'

This is on Scientific Linux 5.2 with its latest kernel, 
2.6.18-92.1.10.el5.  So do I need a much more recent kernel?  If so, I 
can set up a virtual machine for a test.  Can you recommend a 
reasonably lightweight distribution that would serve?  Obviously it 
needs a fairly recent cups as well.  The latest KNOPPIX?

Can you comment on my understanding of the "recent" rules as set out 
below?

"-m recent --set" stores an address, just as an address, not marked as 
source or dest.  This address is taken from either the source or 
destination address of a packet, depending on the use of --rsrc/--rdest. 
In order for the rules to do what we want them to, the address has to 
include the port number as well as the ip address.

"-m recent --rcheck" looks to see whether the stored address is the same 
as either the source or destination address on a packet, depending on 
the use of --rsrc/--rdest.

If that is correct and the port is stored as part of the address, then 
the logic of your rules looks good to me.  If the port isn't stored, 
then all we are storing is the address of our own interface and we match 
any packet coming in from a port 161.  That's still an improvement 
because we only let in the packets during a relatively short window 
after a broadcast, but it's not quite what we'd really like.

By the way, googling around for help on this issue, I came across a 
forum thread from 2004 discussing the same problem with respect to 
samba.  Evidently samba uses the same broadcast/response tactic. 
Unfortunately the thread seemed to peter out without resolution.  But is 
there an approved firewall setup for samba these days?  (I don't use 
samba myself.)  If so, maybe we could adapt it.
