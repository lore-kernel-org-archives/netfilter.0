From: Nicholas Couchman <nick.couchman@yahoo.com>
Subject: Windows/NetBIOS & SNAT
Date: Thu, 3 Sep 2009 16:28:29 -0700 (PDT)
Message-ID: <651562.95010.qm@web33406.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1252020509; bh=aVyLeXc0Bk9Li/TRdWm17zF78fm9vMmlISpwAoMTUqk=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=qDK6xhuXkMNFUwQn3Ev3DF2Rw02PbyA5otuj1x2SIAKcriiQ4iVABv0b25JnCObjwI8mamLYyJpZbxcGVLBWwu+bIQuRjunktc8Ddb9ioUdvjkI5BzgM+HVjC+xIRWJsmgVxXnnp3HUUAlenKQUZTE12WgV8xl0xH24vJy0nmp8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I've done quite a bit of Google searching and haven't turned up anything definitive hear.  I have a few Windows XP machines that I want to put behind a Linux/iptables NAT configuration.  The domain controllers and WINS servers sit outside the NAT configuration.  On the Linux side, I've enabled ip forwarding, and added the following rule with iptables:

iptables -t nat -A POSTROUTING -s 172.16.34.0/24 -j SNAT --to-source 192.168.100.100

However, I'm getting the following error when trying to log on to Windows:
The system cannot log you on now because the domain DOMAIN is not
available.  I've loaded the nf_conntrack and nf_conntrack_netbios_ns modules in Linux, but this hasn't helped.  I've done some packet tracing, and when I look at tcpdump, on the "inside" interface, I see requests to the WINS system but never any replies.  When I look at packets on the "outside" interface, I see the SNAT'd requests from the 192.168.100.100 interface going to the WINS server on port 138, and I see the replies coming from the WINS server to the 192.168.100.100 IP address, port 138.  Herein lies my problem - I'm guessing that the Linux system itself isn't actually expecting the reply on port 138, and so it's discarding the packet.  My question is this: is there some rule I ought to put somewhere else in iptables to have these packets returned to the "inside" network, to the co
 rrect host?

Oh, yeah, one other thing - all iptables is doing is NAT - there are no firewall rules that would block trafffic, and the default policy is "ACCEPT".

Thanks,
Nick
