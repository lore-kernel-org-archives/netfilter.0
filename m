From: Vincent Arniego <vincent_arniego@yahoo.com>
Subject: [NFQUEUE] Help with program that changes DHCP payload
Date: Tue, 29 Jan 2008 19:58:35 -0800 (PST)
Message-ID: <763049.9097.qm@web58311.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org




Hi Everyone,

I'm kinda new here and I would like some help regarding
 netfilter_queue. If this is asked already, forgive me I didn't see it in the archives.

I'm making a program that changes the value of an attribute in the DHCP
 payload.
I'm using nfqueue to intercept the packet, change the content of the
 payload and resend it again to DHCP
which resides in the same server as the firewall. Why am I doing this?
 I'm making a pseudo option 82 using a translated bridge (which the mac
 is unchangeable) but I'm using the hostname attribute instead.

So far, I was able to change the content of the hostname attribute of
 the payload, and I checked the packet again
just to be sure its sending the correct content. I use nfq_set_verdict
 to resend the packet with the modified payload.

But it didn't work.

The next thing is did *just to be sure is just changing the TTL value
 of the IP header, then resending again, but it seems its not working. I
 used ethereal to capture the packets that are coming in after
 modification. And yes I checksummed it.

These are my questions:

1. My firewall rule to intercept the packets is in the PREROUTING
 chain, mangle table.Is this the correct way?
2. The packets that are captured by ethereal, are these the packets
 before modification or after? (just to be sure I'm looking it the right
 way)
3. What can I do to verify if the packets are indeed modified?

If anyone need a snippet of the code, for everyone, I'll just send it
 in a reply email.

Thanks in advanced guys.



      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
