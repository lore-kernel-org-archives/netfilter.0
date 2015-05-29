From: Karan <digitalkaran@gmail.com>
Subject: Due to Connection Tracking multiple DNAT rules for GRE packets do not
 get hit
Date: Fri, 29 May 2015 11:17:34 +0530
Message-ID: <CAJpBj-gvfN9z6eCBdjYdFQUsE5N1eZcF5ARmAUDcqA1KKhT8nQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ko50zjP1YsxIz/OrS3h1eEzeDfzitc6cu++Y++oYmao=;
        b=Qc0BNF88lqXGgTqtYHzj1AluvRlwiED+qa3W9ISodsQp0pDq2oRqYz6GX014ro4TyV
         dwlYcYaYXYQ08rXoJYv96xpFPciAikpY3BPfCjRFRcPuSt65wz5+doDuXaVDYaEV7oYX
         Q5IvXYFJPiNWOG+JG4DVUzgj2ss0sAFztWbuPk5P+0l6lBfxZ1lOqovhxVeveqJ/rfV8
         FgEMmECFV54x6mE43uRTsJq3QiDH4ra4erbWrfVgxscWF1CSvbMlJJS7kXP+05t+Rny9
         i8Pxjqn7KNDvQP6cO3Cph8JO5N94bpRsOdd4lW1IlDB1UgYGDMNwoha/Q2KiCJj1lHBP
         BUUw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to do simple round robin load balancing of GRE packets
using iptables 'statistic' extension. I have multiple rules in
sequence that DNAT the packets to specific IPs. But the problem is as
soon as first GRE packet is received and DNATted, connection tracking
makes an entry for it and all the subsequent GRE packets get DNATted
to the same IP. What's more surprising is that, if I see the counters
of the DNAT rule entry, its value stays at one. This implies that all
subsequent packets are getting DNATted because of connection tracking
and not because of DNAT rule. I confirmed this by deleting all the
DNAT rules and surprised to see that packets were still getting
DNATted until I flush the GRE connection from connection tracking.

Here are the details of how I want to achieve load balancing but due
to Connection Tracking I am unable to achieve the same.

iptables -t nat -A PREROUTING -m statitstic -p GRE -d 172.16.96.173
--mode nth --every 2 --packet 0 -j DNAT --to 15.0.0.2

iptables -t nat -A PREROUTING -m statitstic -p GRE -d 172.16.96.173
--mode nth --every 1 --packet 0 -j DNAT --to 15.0.0.3

'172.16.96.173 is the GRE tunnel endpoint which I intend to load balance.'

My intentions are to DNAT GRE packets in a round robin fashion between
15.0.0.2 and 15.0.0.3. I believe my logic is fine but the way DNATted
GRE packets are tracked by netfilter connection tracking it is not
working. What I have understood so far is that, unlike TCP where
source port gets changed frequenlty, all the GRE packets hitting my
router have same source and destination IP and 'GRE key', connection
tracking treats them as packets of same connection. If I keep on
flushing DNAT GRE connecton using conntrack command line, the things
seem to work, BUT is it the only possible SOLUTION ? Please SUGGEST
what am i MISSING and how I can ACHIEVE my goals. I can provide
further details of my setup if needed.


Thanks
Karan Pugla
