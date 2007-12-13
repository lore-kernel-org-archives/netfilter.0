From: "Jacob Lear" <jlear@brammo.com>
Subject: RE: Network Communication Issues
Date: Thu, 13 Dec 2007 10:41:41 -0800
Message-ID: <004001c83db7$cd376bd0$fe02a8c0@brammo.main>
References: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main> <4760800B.7040601@riverviewtech.net> <003e01c83db1$25d10460$fe02a8c0@brammo.main> <47617846.5090101@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47617846.5090101@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

 
> All references I see to "wrong data byte #30 should be 0x1e but was" 
> suggest wrong drivers for the NIC.  Any thoughts?

That's entirely possible. That NIC isn't one of the onboard NICs and was
just one that I had laying around. I don't even remember what it is. The
server is Red Hat EL4 x64 and the driver it is using is the one that it
picked: "ADMtek NC100 Network Everywhere Fast Ethernet 10/100". I have a
bunch of spare Linksys LNE100TX... I think it might be one of those. Is
there a Linux driver for that and is that the correct driver for it,
assuming that there is and that is what the card is?

> Ok...
> I'm not entirely sure that the blank gateway on the second NIC is not a
problem, though I don't think it is your current 
> problem.  I've had mixed results not putting a gateway in on all interface
config panels in Windows before.

I don't think that's the problem... based on what I've read online, Windows
doesn't like having more than 1 Default Gateway -- it confuses it (big
shocker there huh?). I tried it that way at first and it was complaining
when I tried to save the TCP/IP properties. I don't think the routing was
working right either... I seem to recall some issues.

 
Jacob Lear
IT Systems Support Engineer

