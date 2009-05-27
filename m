From: Saatvik Agarwal <saatvik.agarwal@stanford.edu>
Subject: TCP simultaneous open using iptables NAT?
Date: Wed, 27 May 2009 15:06:50 -0700
Message-ID: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com>
Reply-To: saatvik.agarwal@stanford.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:reply-to:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=UbM/Y8aTZJJ4VqFii6vWyYuDn8NBeqqgjZFxceA3380=;
        b=dUdNeyvkeqIaCpL9jAw2N6HGvhQc+Vy7GjG0XrPQCR7hzmdHMCl3MYbea2QrGULusN
         idiO+CVgzH2FFsMNLAc8RaJHqt42UQD2irQMa6RvzMLRrfDbRPZFHpktnRPQvCeg80fU
         yANUWjtTx3ST6uQtKb5Imd0WXvkU68QemJyAo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,

For my research project in school, I am trying to establish TCP
connections when both hosts are behind full-cone NATs using TCP's
simultaneous open functionality. Unfortunately, it seems that iptables
does not support TCP simultaneous open. For my test environment, I
simulate a full-cone NAT using iptables. My iptables rule is exactly
as follows:

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Of course, here my eth0 is the interface connected to the internet.
Everything else is set to accept; there is no filtering or anything.
In fact, I run iptables --flush before adding the above rule.

Using wireshark, the behavior I observe on both the iptables NAT boxes
is that both of them send out/see a SYN coming from their NATted host
before they receive a SYN from the other host. Unfortunately, both
NATs respond with TCP RSTs to this incoming SYN (note that the
incoming SYN corresponds to the exact same connection, i.e. port,
endpoint tuple, as the outgoing SYN). The idea behind simultaneous
open is that there are two SYNs in-flight at the same time and they
cross in the network. According to the TCP spec, this should result in
two TCP SYN-ACKs - one from either host - resulting in a four-way
handshake as opposed to the usual three-way handshake. Instead of
responding with RSTs, both NATs should let the incoming SYNs go
through if they were to support simultaneous open (and because the
port mapping should already have been created by the outgoing SYN).

I have well-tested code running on the client machines behind the NATs
that try to do a simultaneous open. To do so, I basically call connect
in a tight loop on both the connecting machines. There is a rendezvous
server which tells both NATted hosts their corresponding public
endpoints (IP address, port) so that they can connect.

According to the BEHAVE requirements outlined in IETF RFC 5382, TCP
simultaneous open must be supported by "well behaved NATs". So is
there a mistake in my rules or does iptables not support simultaneous
open?

Apologies for the long description, particularly if you are familiar
with simultaneous open. I couldn't find any discussion regarding this
on the list. Please let me know if something is not clear.

Thank you,
Saatvik Agarwal
