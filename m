From: Tom <tom@foscore.com>
Subject: Dropping UDP packets to port 53 containing known domain string?
Date: Mon, 26 Jul 2021 21:43:14 -0400
Message-ID: <6bf250e7-e0ba-43f2-6e35-c858e85db41c@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1627350196;
        bh=696/2On29BcQTFjRwc+jvBge49XMtNaT/lwN0c4rK7Q=;
        h=To:From:Subject:Date:From;
        b=cVNgBSWyPB9qXK6KjeJBvLrVhuF2GlikMeF1erdWXUJzCDojdZmG4RwhhgNl5osAf
         vQPIFhgiT7V6NOHQYmfTA2oh/Tn8IkRTSywHABGSwAz18KtTXrrYuj65UFYjBtPJyn
         WDBhYVde9Hm6jADS3zGwn3S+RDE1DfmwC30DJh40=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

If you run a DNS server you've likely come across lots of requests for 
RRSIGs of pizzaseo.com. It's a DDOS attack that's been going on for 
years, off and on. Currently it's on, and how! Thousands of requests an 
hour for weeks now on all 3 of my DNS servers. Instead of using fail2ban 
to block the offending IP addresses, I want to drop the packet before it 
gets to the DNS server.

I know there is a way for nftables to examine table header strings of 
UDP packets using something called a "raw payload expression". You need 
the hex equivalent of the string, and the beginning and end offsets of 
the string, for example:

meta l4proto udp udp dport 53 @th,160,120 
0x0970726f787970697065036e657400 counter drop comment "block queries for 
proxypipe.net"

If I wanted to block pizzaseo.com (and I'm far from alone in this 
request!), how do I convert that string to a 0x string? How do I check 
that I have the right start and offset? How would I debug such a rule?

Thanks in advance!
