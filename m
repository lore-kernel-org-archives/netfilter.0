From: Elison Niven <elison.niven@gmail.com>
Subject: Get source IP of packet through PREROUTING CHAIN
Date: Tue, 11 Aug 2009 10:09:19 +0530
Message-ID: <21df6cb70908102139i1f0f21besc94740ed507615da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=LyYehhnBagiHhtuZb9VS9HXGcAxYH6VjHCuuQYwooHk=;
        b=DxnYVKfSli64wa85xLFsrgeRCNlAJtA7uI/BToEKWqDn7phzJe2513qKUy1gDW7O5j
         PLHrqYcmDQ3wW1FbK53heIbX7gf7DAFLsxXChWGhdyUaz2IFxY+hwwYkIByqoRrIDzl2
         DaYN+05rkQR+7/bQaA2YkzVOsvOqWXRf+gkRY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: elison.niven@matrixtelesol.com

Hi List,

I have two interfaces eth0 and eth1 on my machine.

My machine has eth0 = 192.168.1.100 and eth1 = 172.16.1.100

The scenario is that I will be receiving packets at port 10000 on eth0
of my machine. I do not know from which IP the packets are being
received (Can be any machine - I do not need to apply a source address
matching rule).

I need to forward these packets to another machine B that I do so with
this rule:

iptables -t nat -I PREROUTING -i eth0 -p udp \
       --dport 10000 -j DNAT --to-destination 172.16.1.200

Note that I have not added any -s option to the rule for source
address matching.

This also works properly. Now I need to _know_ the source IP and
source Port of the packets that are being received at port 10000 on
eth0. (For example to send some data back to the _same_machine_ that
is sending packets at port 10000)

How do I achieve this?

Best Regards,
Elison
