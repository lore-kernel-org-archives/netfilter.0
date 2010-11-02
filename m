From: Brandon Black <blblack@gmail.com>
Subject: Stateless UDP PAT?
Date: Mon, 1 Nov 2010 22:43:24 -0500
Message-ID: <AANLkTikPkQx=sL=c2CZH4Adaht=uzCK0+jJvqVr_M4e6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=KLO0kqxg03iVGUT6rt9g4NPn3H40/FR2eiAfyKV+/lU=;
        b=W61AgwmsqodzX2k9MZmqMIuoV42rq/8E/1s+AiGT8csoooyIGF4sYbAVFIw7rFSNc/
         QtD79fIbwHL9FTBJcwIYCnySMGyranLZKUTLEqx7D5rytio+S9L68LV84wDpkGB5N/7w
         AHQLsOLcG0+fg6D5Yokp6yPohUDL3yQWz4x7M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I've been digging around in the iptables (and xtables-addons) stuff
looking for a way to do stateless UDP PAT, but I don't think any of
the existing modules cover what I want to do.  I wanted to check here
first though, in case perhaps I missed something.

To give a concrete example of the behavior I'm looking for:

192.0.2.1 is a real IP address on this machine (there's no real
routing or NAT going on here)
Application instances are listening on UDP ports 12340-12347.
The "official" port number that external clients will reach this
application on is 1234
I want incoming traffic for port 1234 to be round-robined to 12340-12347

These two rules would nearly do what I want, if I'm reading the docs correctly:

iptables -t nat -A PREROUTING -d 192.0.2.1 -p udp --dport 1234 -j DNAT
--to-destination :12340-12347
iptables -t nat -A POSTROUTING -s 192.0.2.1 -p udp -m multiport
--dports 12340-12347 -j SNAT --to-source :1234

However, the application's protocol is built on stateless transactions
(single request packet, single response packet), and for performance
reasons (and sheer count of packets flying) I don't want conntrack
trying to watch and timeout all of these single-packet UDP
transactions.  I just want it to round-robin alter the destination
port on the incoming packets, and statically alter the source ports
back to the canonical one on the response traffic, stateless-ly.

Did I miss some way to do this with the existing tools/modules?  Do I
just have to write a custom module for this sort of thing?

Thanks,
-- Brandon
