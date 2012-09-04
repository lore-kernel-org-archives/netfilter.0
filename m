From: Aswathi Manikantan <aswathimanik@gmail.com>
Subject: conntrack ctexpire not working
Date: Tue, 4 Sep 2012 17:25:05 +0530
Message-ID: <CANM7VyXEAUq_E99sVmjpBbKH4J8sA6fK1fPxg2kbFNKYewcmng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=FPX9vfOSRm+fxVweza8KMxxscw+6YIVwQ8hMoWS583w=;
        b=MXCS2oRXYYWUuK3VfyabJG4jG8uRs03+FmGhB72SsVJibvZtlHBFeHtSWg39h5FvTY
         3RLrjL/VdsLv0w8kCXtKgmAEokZrGrZGybw9GfNgkYxH+Vtorw4jvVVJGcRTAM6J8oeM
         Bm0ApI5BT5ex3iZC1hW8LertB+aB9cne8V/QXXa7ZtPZQaNMxRq+meCcSVDHRKBo9bD8
         3nKV9DKBdAQ1hWuLK2eBHnkj3Z1qnyTf2Ff/9kbtdcFIvLA6T/nFVg2J0BxlGRRWX/MP
         HdPaNqlM7leLo4U37T+pI5YOSrz0ADcAgm+8Su5FrofSqm7evmL0yenkJHBy+opcAPsf
         GcFA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello Everyone,

I am facing problem with ctexpire.

I want to do timeout for a particular TCP session.
Eg:-
I am forwarding packets from 192.168.1.2 to internet through my routing device.
I need to set timeout for the TCP session from 192.168.1.2->ANY.

So I added the iptables rule like this on my routing device
  iptables -A FORWARD -s 192.168.1.0/24  -i eth1   -p tcp -m conntrack
--ctstate ESTABLISHED --ctexpire 10   -j REJECT   --reject-with
tcp-reset

But this rule is not working.

Can anybody suggest solution for this?

Aswathi
