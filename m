From: Chris Burroughs <chris.burroughs@gmail.com>
Subject: Altering outgoing IP Address without Connection Tracking
Date: Tue, 06 Sep 2011 18:59:04 -0400
Message-ID: <4E66A5B8.4030700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=G1DYDZ35AIm1a9supk2MaslIoA8bjnSiSDlQaV39QUg=;
        b=SgMRdHyelTJtA5WfcTm7coBIVQzlOMN9X7N/SZEC0uWqvyohZ5T3wJm+CHD+eDWD9D
         bz4ZiwmAQfWDCUg416+qYhdyyKJoircPQ6EhrVLsUf4zb6GeC51qeRTVPTQwx3fGA3/r
         ApFfMW23OWyErgB+DPrCKgrnxn9MbSOcDHcNA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'd like to alter the outgoing IP address (from internal to external LB)
on all packets sent on a specific port, without incurring the overhead
of running conntrack.  DNAT of course requires conntrack. But I can't
think of a reason why this simple substitution would require stateful
representation of packet flows.  I was able to find one reference to
someone trying to mange the RAW packets [1] in 2008, but apparently
without success.

Is it currently possible to alter outgoing IP addresses without
connection tracking?

[1]
http://www.linuxquestions.org/questions/linux-networking-3/iptables-notrack-670012/
